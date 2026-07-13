
# Layered Architecture (N-tier)

Simplest form of software architecture, dividing software into horizontal layers.

### Common Layers:

- **Presentation Layer** (User interfaces)
- **Business Logic Layer** (Application logic)
- **Data Access Layer** (Database interactions)

### Structure:

```
Presentation → Business Logic → Data Access
```

### Example:

An online store can use a layered structure:

- **Presentation Layer**: Product pages, cart screen, and checkout form.
- **Business Logic Layer**: Pricing rules, discount validation, stock checks, and order processing.
- **Data Access Layer**: Queries for products, customers, inventory, and orders.

When a customer places an order, the UI sends the request to the business layer, which validates the order and then uses the data layer to save it.

### Pros:

- Easy to understand, widespread usage.
- Simple separation of concerns.

### Cons:

- Tends toward tight coupling.
- Harder to change foundational layers later.

### When to use:

- Simple CRUD applications.
- Small to medium-sized web apps.
