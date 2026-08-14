
# Microservices Architecture

Builds applications as independent, loosely coupled services.

### Components:

- Independent services with specific functionality.
- Services communicate over network (usually via HTTP APIs or message queues).

### Structure:

```mermaid
graph LR
    C[Client] --> G[API Gateway]
    G --> S1[Microservice 1]
    G --> S2[Microservice 2]
    G --> SN[Microservice N]
    S1 --> D1[(DB 1)]
    S2 --> D2[(DB 2)]
    SN --> DN[(DB N)]
```

### Example:

An e-commerce platform can be split into microservices:

- **Product Service**: Manages product catalog and search.
- **Order Service**: Handles carts, checkout, and order history.
- **Payment Service**: Processes payments and refunds.
- **Notification Service**: Sends emails, SMS messages, or push notifications.

Each service owns its own logic and can be deployed or scaled independently.

### Pros:

- Independent scaling.
- Flexibility in choosing technology per service.

### Cons:

- Higher complexity in orchestration.
- Challenges with data consistency and latency.

### When to use:

- Large-scale distributed systems.
- Continuous deployment scenarios.

Service boundaries are the hard part. The most defensible way to draw them is along
[bounded contexts](../Domain-Driven%20Design/index.md), not along technical layers or
database tables.

## Check Your Understanding

<quiz>
What is the strongest argument for a Microservice Architecture?

- [x] Services are independently deployable and scalable, each owning its own data
> Correct. The price is real: network failure, distributed transactions, and operational complexity a monolith never has to pay.
- [ ] It removes the need for integration testing
- [ ] It guarantees strong consistency across the whole system
- [ ] It reduces the total amount of infrastructure to run
</quiz>
