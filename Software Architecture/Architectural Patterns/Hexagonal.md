
# Hexagonal (Ports & Adapters) Architecture

Proposed by Alistair Cockburn, focuses on creating systems independent from external interfaces.

### Components:

- **Core Application (Domain)**: Business logic and domain rules.
- **Ports**: Interfaces defining communication channels to/from the Core.
- **Adapters**: Concrete implementations of ports.

### Structure:

```
Adapters ↔ Ports ↔ Core (Application Domain)
```

### Example:

A payment system can use Hexagonal Architecture:

- **Core Application**: Payment authorization, refund rules, and fraud checks.
- **Ports**: Interfaces such as `PaymentGateway`, `PaymentRepository`, and `NotificationSender`.
- **Adapters**: Stripe adapter, SQL repository, fake test gateway, and email adapter.

The core payment logic depends on ports, so the team can replace Stripe with another provider without rewriting the business rules.

### Pros:

- Highly testable due to clean separation.
- Easily replaceable external integrations.

### Cons:

- Requires significant discipline in keeping ports/adapters clean.
- High initial overhead.

### When to use:

- Microservices architecture.
- Systems with multiple external dependencies (DB, APIs, messaging).# 3. Clean Architecture

Clean Architecture emphasizes decoupling, independence of frameworks, testability, and maintainability. Developed by Robert C. Martin (Uncle Bob).

### Layers:

- **Entities**: Core business objects.
- **Use Cases (Application)**: Contains application logic; interacts with Entities.
- **Interface Adapters**: Controllers, Presenters, Gateways. Converts data between Use Cases and external layers.
- **Frameworks & Drivers**: External layer (e.g., web, database, UI frameworks).

### Structure (Inner layers don't depend on outer layers):

```
Entities ← Use Cases ← Interface Adapters ← Frameworks & Drivers
```

### Example:

An appointment booking system can use Clean Architecture:

- **Entities**: Appointment, doctor, patient, and scheduling rules.
- **Use Cases**: Book appointment, cancel appointment, and find available slots.
- **Interface Adapters**: REST controllers, presenters, and repository interfaces.
- **Frameworks & Drivers**: Web framework, database, notification service, and calendar API.

The booking rules remain independent from the database or web framework, so they can be tested without starting the full application.

### Pros:

- Excellent maintainability and testability.
- Highly decoupled design.

### Cons:

- May seem overly abstract and complicated for smaller projects.
- High initial setup complexity.

### When to use:

- Enterprise-scale applications.
- Projects needing long-term maintenance and evolution.
