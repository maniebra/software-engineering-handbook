# Integrity and Transactions

Data integrity means the database remains a trustworthy representation of the domain. An RDBMS helps preserve it with constraints and transactions, but each rule must be assigned to the layer that can enforce it reliably.

## Put rules in the strongest practical layer

| Rule type | Example | Good enforcement location |
| --- | --- | --- |
| Value shape | Quantity is positive | Column type and `CHECK` |
| Required/unique fact | Email is present and unique | `NOT NULL`, `UNIQUE` |
| Reference | Order has a real customer | Foreign key |
| Multi-row invariant | Reserved inventory never exceeds stock | Transaction with appropriate isolation/locking |
| Workflow/authorization | Only a payment service can mark an order paid | Application/domain service plus database permissions/audit |
| Cross-service policy | Refund must be reconciled with payment provider | Durable workflow, idempotency, reconciliation |

Application validation improves error messages and user experience. It is not a substitute for database constraints, because imports, background workers, future services, and manual scripts can bypass one application code path.

## Core constraints

```sql
CREATE TABLE order_lines (
    order_id UUID NOT NULL REFERENCES orders(order_id),
    line_number INTEGER NOT NULL CHECK (line_number > 0),
    product_id UUID NOT NULL REFERENCES products(product_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price_at_purchase NUMERIC(12,2) NOT NULL
        CHECK (unit_price_at_purchase >= 0),
    PRIMARY KEY (order_id, line_number)
);
```

Constraints are executable documentation. They make invalid states impossible or at least immediately visible at the write boundary.

## Transactions make a unit of work all-or-nothing

Placing an order might create an order, create lines, reserve inventory, and record payment intent. A transaction says that this group either commits together or leaves no partial result.

```sql
BEGIN;

INSERT INTO orders (order_id, customer_id, status, placed_at)
VALUES (:order_id, :customer_id, 'pending', now());

INSERT INTO order_lines (order_id, line_number, product_id,
                         product_name_at_purchase, unit_price_at_purchase, quantity)
SELECT :order_id, item.line_number, p.product_id, p.name, p.current_price, item.quantity
FROM requested_items AS item
JOIN products AS p ON p.product_id = item.product_id;

UPDATE inventory
SET available_quantity = available_quantity - :quantity
WHERE product_id = :product_id
  AND available_quantity >= :quantity;

-- The application verifies every requested stock update affected one row.
COMMIT;
```

On any failure, issue `ROLLBACK`. In production code, use the database driver’s transaction API so exceptions reliably trigger rollback and connections are returned cleanly.

## ACID, in practical language

| Property | Meaning |
| --- | --- |
| Atomicity | A transaction’s changes happen together or not at all |
| Consistency | A committed transaction preserves declared rules; the application must supply correct rules |
| Isolation | Concurrent transactions behave as though protected from harmful interference, at a chosen level |
| Durability | Once committed, data survives expected crashes through the database’s recovery mechanisms |

ACID does not mean every distributed operation is magically safe. A database transaction cannot atomically charge a third-party payment provider and publish a message unless the architecture supplies a reliable coordination pattern.

## Concurrency hazards

Two requests may both read `available_quantity = 1` and each try to buy it. A naive read-then-write sequence can oversell.

Safer patterns include:

- A conditional atomic update: `UPDATE ... WHERE available_quantity >= :quantity`.
- Locking the row while deciding, such as `SELECT ... FOR UPDATE`, used sparingly.
- Optimistic concurrency with a version column and a conditional update.
- Serializable isolation for operations that need its stronger guarantee, with retries for serialization failures.

The correct choice depends on contention, latency, and the invariant. Keep transactions short; do not make network calls to payment providers while holding database locks.

## Isolation is a trade-off

Isolation levels differ by database, but the broad trade-off is stable: stronger protection reduces anomalies while increasing contention or retry work. Know the actual semantics of the chosen RDBMS rather than relying on level names alone.

For a concrete operation, write down:

1. What rows are read and written?
2. What must be true at commit time?
3. Which concurrent operation could violate it?
4. How will failure or retry be handled?

## Idempotency makes retries safe

Networks fail after a server commits but before the client receives the response. The client may retry. For externally triggered commands such as “place order,” record an idempotency key with a unique constraint and return the original result for a duplicate key.

```sql
CREATE TABLE idempotency_keys (
    customer_id UUID NOT NULL REFERENCES customers(customer_id),
    key TEXT NOT NULL,
    order_id UUID NOT NULL REFERENCES orders(order_id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (customer_id, key)
);
```

Make the command, key insert, and resulting order part of one transaction. Decide a retention period and payload-mismatch behavior explicitly.

<quiz>
What is the most reliable first protection against a quantity of zero being stored in an order line?

- [x] A database `CHECK (quantity > 0)` constraint
> Correct. Client-side validation is helpful, but the database constraint protects every write path.
- [ ] A comment asking developers to validate it
- [ ] A cache entry for the quantity
- [ ] A read replica
</quiz>
