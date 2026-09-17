# Query Design and Indexes

An index is a data structure that helps an RDBMS find or order a small relevant subset of rows without scanning an entire table. It is essential for many read paths, but every index also costs storage and makes writes more expensive because it must be maintained.

Design indexes from real queries and verify them with the database’s query-plan tools. Do not add them because a column “sounds important.”

## Start with access patterns

Write important reads and writes in ordinary language before choosing an index.

| Operation | Query shape | Candidate index |
| --- | --- | --- |
| Sign in | Find customer by email | Unique `customers(email)` |
| Order history | Orders for one customer, newest first | `(customer_id, placed_at DESC)` |
| Order detail | Lines for one order | `(order_id, line_number)` primary key |
| Product page | Product by SKU | Unique `products(sku)` |
| Category browse | Active products in a category | `(category_id, is_active)` or a partial index, depending on selectivity |

This table is a hypothesis. Confirm it with representative production-like data and query plans.

## B-tree indexes and composite order

Most relational databases use a B-tree index by default. It works well for equality lookups, ranges, and ordered scans.

```sql
CREATE INDEX orders_customer_placed_at_idx
ON orders (customer_id, placed_at DESC);

SELECT order_id, status, placed_at
FROM orders
WHERE customer_id = :customer_id
ORDER BY placed_at DESC
LIMIT 20;
```

Column order matters. An index on `(customer_id, placed_at)` is effective for a query restricted to `customer_id` and ordered by time. It is generally much less useful for a query filtering only by `placed_at`, because the leading values are customer IDs. Think **equality filters first, then range/order columns**; validate the rule against the chosen database and exact query.

## Primary, unique, and foreign-key indexes

- Primary and unique constraints typically create supporting indexes.
- Foreign keys protect referential integrity, but may not create a supporting index on the referencing column automatically.
- Index frequently joined or filtered foreign-key columns, such as `orders.customer_id` and `order_lines.order_id`.

Indexes can also help parent deletion/update checks, because the database must find matching child rows before enforcing the FK rule.

## Read a query plan

PostgreSQL’s `EXPLAIN (ANALYZE, BUFFERS)` shows the plan actually used and its observed timing:

```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT order_id, status, placed_at
FROM orders
WHERE customer_id = '…'
ORDER BY placed_at DESC
LIMIT 20;
```

Look for:

- Whether the scanned row count is proportionate to the result.
- An index scan when it is selective and beneficial (a sequential scan can be correct for a large fraction of a small table).
- Unexpected sorting after retrieval.
- Bad row-count estimates, which can suggest stale statistics or skewed data.
- Expensive nested loops, hash joins, or disk reads in the context of the actual data volume.

Avoid declaring a plan “bad” from one node name alone. Measure p50/p95 latency, concurrency, and I/O under realistic conditions.

## Avoid common non-sargable predicates

A predicate is often **sargable** when the optimizer can use an index to narrow a search efficiently. Wrapping an indexed column in a function can prevent that.

```sql
-- Often prevents an ordinary index on placed_at from narrowing the range.
WHERE DATE(placed_at) = DATE '2026-09-17'

-- Lets a time index find a range.
WHERE placed_at >= TIMESTAMPTZ '2026-09-17 00:00:00+00'
  AND placed_at <  TIMESTAMPTZ '2026-09-18 00:00:00+00'
```

The remedy can also be an expression index where that expression is a stable, intentional query contract. First choose the simplest query that preserves index use and correct timezone semantics.

## Indexes are not a substitute for query design

An index will not fix:

- Fetching columns or rows the caller does not need.
- N+1 queries, where code loads related data in a loop.
- A join against an unbounded result set.
- A data model that makes the needed query impossible without expensive reconstruction.
- Lock contention or a saturated primary caused by write-heavy work.

For list APIs, use a deterministic sort and pagination. Offset pagination is simple but can become slow and shift under concurrent inserts. Keyset (cursor) pagination uses the last seen ordered values and is often better for deep, frequently changing lists.

```sql
-- Keyset pagination: the cursor is (placed_at, order_id).
SELECT order_id, placed_at, status
FROM orders
WHERE customer_id = :customer_id
  AND (placed_at, order_id) < (:cursor_placed_at, :cursor_order_id)
ORDER BY placed_at DESC, order_id DESC
LIMIT 20;
```

Use a matching index such as `(customer_id, placed_at DESC, order_id DESC)`.

## Safe evolution

On a large production table, adding an index can be operationally significant. Test the migration path; use online/concurrent index creation where the RDBMS supports it; monitor replication lag and write latency; and remove unused indexes only after evidence and an observation window.

The [Worked Example: Online Store](Worked%20Example%20-%20Online%20Store.md) combines a schema, constraints, transactions, and access-pattern indexes.

<quiz>
For an order-history query filtered by `customer_id` and ordered by newest `placed_at`, which index is the best starting hypothesis?

- [x] `(customer_id, placed_at DESC)`
> Correct. It starts with the equality filter and can deliver that customer’s rows in the requested order.
- [ ] `(placed_at, customer_id)` because dates are always more important
- [ ] `(status)` because every order has a status
- [ ] No index; foreign keys automatically optimize every query
</quiz>
