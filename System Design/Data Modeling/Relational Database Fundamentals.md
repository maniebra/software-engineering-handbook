# Relational Database Fundamentals

In a relational model, data is held in **relations**, usually implemented as tables. A table has named columns; each row represents one fact of the table’s type. Tables refer to each other with keys instead of nesting arbitrary records inside one another.

An RDBMS—such as PostgreSQL, MySQL, SQL Server, or SQLite—does more than save tables. It parses SQL, plans queries, coordinates concurrent work, enforces constraints, records changes durably, and supports backup and recovery.

## From ERD to schema

The straightforward mapping is:

| ERD idea | Relational implementation |
| --- | --- |
| Entity | Table |
| Attribute | Column |
| Entity instance | Row |
| Identifier | Primary key |
| One-to-many relationship | Foreign key on the “many” table |
| Many-to-many relationship | Junction table with two foreign keys |
| Business rule | Constraint, transaction rule, or application rule |

For example, the relationship “a customer places orders” becomes an `orders.customer_id` column that refers to `customers.customer_id`.

```sql
CREATE TABLE customers (
    customer_id UUID PRIMARY KEY,
    email       TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE orders (
    order_id    UUID PRIMARY KEY,
    customer_id UUID NOT NULL REFERENCES customers(customer_id),
    status      TEXT NOT NULL,
    placed_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

The database now rejects an order with no customer or with a customer ID that does not exist. That is more reliable than hoping every caller remembered to check first.

## Schema, table, row, and column

A **schema** is a namespace and a contract for database objects. In a small application, `public` might contain everything. In a larger system, schemas can group modules such as `billing`, `catalog`, or `reporting`; they are not a replacement for service ownership boundaries.

| Term | Example |
| --- | --- |
| Database | `store_production` |
| Schema | `sales` |
| Table | `sales.orders` |
| Row | One order, identified by `order_id` |
| Column | `status`, `placed_at`, `customer_id` |
| Value | `paid`, `2026-09-17T10:00Z`, a UUID |

## Choose types that express meaning

Types are part of correctness. Pick types for the data’s semantics and expected operations, not merely what is convenient in the application language.

| Kind of fact | Typical type | Notes |
| --- | --- | --- |
| Identifier | `UUID`, `BIGINT` | See key strategy on the next page |
| Small whole count | `INTEGER` | Add a positive check when appropriate |
| Money | `NUMERIC(p,s)` or integer minor units | Never use binary floating point for exact currency |
| Time of an event | `TIMESTAMPTZ` | Store an instant with timezone-aware semantics |
| Calendar date | `DATE` | A birthday is not an instant |
| Bounded state | `TEXT` + `CHECK`, enum, or lookup table | Choose based on how often values change |
| Flexible metadata | `JSONB`/JSON where supported | Do not use it to avoid modeling core relational facts |

Database type names and details vary by product. The SQL examples in this tutorial are PostgreSQL-flavoured, but the relational ideas apply broadly.

## NULL means unknown or inapplicable

`NULL` does not mean an empty string, zero, or “false.” It means no value is present—often because it is unknown or not applicable. SQL’s three-valued logic makes this matter:

```sql
-- This does not return rows where cancelled_at is NULL.
SELECT * FROM orders WHERE cancelled_at = NULL;

-- This does.
SELECT * FROM orders WHERE cancelled_at IS NULL;
```

Make a column `NOT NULL` when the business rule requires a value. Do not make fields nullable merely to make early inserts easier; model draft state or a separate workflow if that is what exists.

## SQL is declarative

With SQL, describe the result you want, not the loops used to get it.

```sql
SELECT o.order_id, o.placed_at, o.status
FROM orders AS o
JOIN customers AS c ON c.customer_id = o.customer_id
WHERE c.email = 'ada@example.com'
  AND o.placed_at >= CURRENT_DATE - INTERVAL '30 days'
ORDER BY o.placed_at DESC;
```

The RDBMS chooses a plan based on table statistics, constraints, and indexes. This is why schema and index design influence performance, while still leaving room for the optimizer to choose an efficient route.

## Data definition vs data manipulation

| SQL family | Purpose | Examples |
| --- | --- | --- |
| DDL | Define structure | `CREATE`, `ALTER`, `DROP` |
| DML | Read and change rows | `SELECT`, `INSERT`, `UPDATE`, `DELETE` |
| DCL | Control permissions | `GRANT`, `REVOKE` |
| TCL | Control transactions | `BEGIN`, `COMMIT`, `ROLLBACK` |

Treat DDL as versioned application code: review it, test it against realistic data, and apply it through migrations. A production schema should not be an unrecorded collection of manual console changes.

Next, learn how keys give rows identity and turn ERD relationships into enforceable references in [Keys and Relationships](Keys%20and%20Relationships.md).

<quiz>
Which type is the safer default for an exact monetary amount such as a product price?

- [x] A fixed-precision decimal such as `NUMERIC(12,2)`, or an integer number of minor units
> Correct. These avoid rounding surprises from binary floating-point representation.
- [ ] `FLOAT`, because it uses less conceptual space
- [ ] `TEXT`, because prices are displayed as text
- [ ] `BOOLEAN`, because a product is either expensive or cheap
</quiz>
