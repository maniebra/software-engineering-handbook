
# Hexagonal (Ports & Adapters) Architecture

Proposed by Alistair Cockburn, focuses on creating systems independent from external interfaces.

### Components:

- **Core Application (Domain)**: Business logic and domain rules.
- **Ports**: Interfaces defining communication channels to/from the Core.
- **Adapters**: Concrete implementations of ports.

### Structure:

```plantuml
@startuml
left to right direction

package "Driving Adapters" {
  [REST Controller]
  [CLI]
}

package "Core (Application Domain)" {
  interface "Inbound Port" as InPort
  interface "Outbound Port" as OutPort
  [Domain Logic]
}

package "Driven Adapters" {
  [SQL Repository]
  [Payment Gateway Client]
}

[REST Controller] --> InPort
[CLI] --> InPort
InPort --> [Domain Logic]
[Domain Logic] --> OutPort
OutPort <-- [SQL Repository]
OutPort <-- [Payment Gateway Client]
@enduml
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
- Systems with multiple external dependencies (DB, APIs, messaging).

## Check Your Understanding

<quiz>
What do ports and adapters mean in Hexagonal Architecture?

- [x] The application defines ports (interfaces); adapters connect those ports to the UI, database, or external services
> Correct. The core states what it needs, and technology-specific adapters plug in, so the database or delivery mechanism can be swapped without touching the core.
- [ ] Ports are network sockets and adapters are protocol converters
- [ ] Ports are the outermost layer and adapters are the innermost
- [ ] Ports are concrete classes the domain imports directly
</quiz>
