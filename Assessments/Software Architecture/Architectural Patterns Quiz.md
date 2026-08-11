# Architectural Patterns Quiz

16 questions on the
[architectural patterns](../../Software%20Architecture/Architectural%20Patterns/Clean%20Architecture.md):
Clean, Hexagonal, Layered, Event-Driven, Microservices, MVC and MVVM, and on choosing
between them.

## Layered, Clean, Hexagonal

<quiz>
In [Layered Architecture](../../Software%20Architecture/Architectural%20Patterns/Layered%20Architecture.md), what does a strictly closed layering rule mean?

- [x] A layer may only call the layer directly beneath it, so changes stay contained between neighbours
> Correct. Skipping layers ("open" layering) buys speed and gives up the isolation that motivated the pattern.
- [ ] Every layer may call every other layer
- [ ] The presentation layer may call the database directly for reads
- [ ] Layers may only communicate through events
</quiz>

<quiz>
Which symptom most often shows a layered system has degenerated?

- [x] Anaemic middle layers that only forward calls, so every feature edits all layers for no isolation benefit
> Correct. Strict layering already costs pass-through code; when the middle layers add no behaviour, that cost buys nothing.
- [ ] The presentation layer contains UI formatting logic
- [ ] The persistence layer contains SQL
- [ ] The system is deployed as one unit
</quiz>

<quiz>
In [Clean Architecture](../../Software%20Architecture/Architectural%20Patterns/Clean%20Architecture.md), what is the dependency rule?

- [x] Source code dependencies point inward only, so inner layers know nothing about outer ones
> Correct. The domain and use cases stay independent of frameworks, UI, and databases.
- [ ] Dependencies point outward, from the domain toward infrastructure
- [ ] Each layer may depend on any other via interfaces
- [ ] Dependencies are resolved at runtime, so direction does not matter
</quiz>

<quiz>
Under Clean Architecture, where does the database belong?

- [x] In the outermost layer, as a detail plugged into an interface the inner layers define
> Correct. Storage is a delivery detail; the use cases state what they need and infrastructure implements it.
- [ ] At the centre, since all data flows from it
- [ ] In the use case layer, so queries stay close to logic
- [ ] It is outside the architecture entirely and needs no boundary
</quiz>

<quiz>
What do "ports" and "adapters" mean in [Hexagonal Architecture](../../Software%20Architecture/Architectural%20Patterns/Hexagonal.md)?

- [x] The core defines ports as interfaces, and technology-specific adapters plug into them from either side
> Correct. Driving adapters call inbound ports; outbound ports are implemented by driven adapters, so technology stays replaceable.
- [ ] Ports are network sockets and adapters convert protocols
- [ ] Ports are the outermost layer and adapters are the innermost
- [ ] Ports are concrete classes the domain instantiates directly
</quiz>

<quiz>
Which characteristic do Clean and Hexagonal architectures most directly improve, and what is the usual price?

- [x] Testability and replaceability of integrations, paid for with more indirection and up-front structure
> Correct. Both give the domain a technology-free centre, which is exactly what makes fast unit tests possible.
- [ ] Raw performance, paid for with weaker testing
- [ ] Elasticity, paid for with higher infrastructure cost
- [ ] Interoperability, paid for with vendor lock-in
</quiz>

## Event-driven and microservices

<quiz>
In [Event-Driven Architecture](../../Software%20Architecture/Architectural%20Patterns/EDA.md), what does a producer know about its consumers?

- [x] Nothing; it publishes an event and consumers subscribe independently
> Correct. That decoupling is the point, and it is why consumers can be added without touching the producer.
- [ ] Their endpoints, so it can call each one in turn
- [ ] Their processing order, which it enforces
- [ ] Their schemas, which it validates before publishing
</quiz>

<quiz>
Which is the strongest availability argument for asynchronous messaging between services?

- [x] The caller stays up when the callee is down, because the message waits in the broker instead of failing the request
> Correct. Removing synchronous dependencies removes their availability from the chain.
- [ ] Message brokers never fail
- [ ] Asynchronous calls are always faster end to end
- [ ] It removes the need for retries and idempotency
</quiz>

<quiz>
What is the main cost teams underestimate in Event-Driven Architecture?

- [x] Reasoning about end-to-end flow, ordering, duplicates, and eventual consistency, which no stack trace shows
> Correct. Decoupled producers and consumers trade traceability for flexibility, which is why observability becomes mandatory.
- [ ] The price of broker licences
- [ ] The extra latency of a single publish call
- [ ] The inability to add new consumers later
</quiz>

<quiz>
A team splits a system into [microservices](../../Software%20Architecture/Architectural%20Patterns/Microservice%20Architecture.md), and now a typical feature requires coordinated changes in three services released together. What have they built?

- [x] A distributed monolith: the boundaries do not match how the system changes, so they paid the network cost and kept the coupling
> Correct. Service granularity without cohesive boundaries makes deployability worse, not better.
- [ ] A correct microservice architecture, since services are separate
- [ ] An event-driven architecture missing a broker
- [ ] A layered architecture with extra layers
</quiz>

<quiz>
Which condition most justifies extracting a module into its own service?

- [x] It has an independent reason to scale, fail, or be released
> Correct. Distribution should buy something specific; otherwise a modular monolith gives the same structure without partial failure.
- [ ] The codebase has grown past a line-count threshold
- [ ] A new team has been hired
- [ ] The module has many classes
</quiz>

<quiz>
Two microservices need one atomic outcome across their own databases. What is the usual approach?

- [x] A saga with compensating actions, or an outbox for reliable event publication, instead of a distributed transaction
> Correct. Two-phase commit across services is fragile and rarely available; sagas trade atomicity for compensations.
- [ ] A two-phase commit coordinated by the gateway
- [ ] A shared database used by both services
- [ ] Retrying both calls until they agree
</quiz>

## MVC, MVVM, and choosing

<quiz>
In [MVC](../../Software%20Architecture/Architectural%20Patterns/MVC.md), what is the controller's responsibility?

- [x] Handling input, invoking the model, and selecting the view to render
> Correct. The model owns state and rules; the view renders; the controller mediates.
- [ ] Holding the application's business rules
- [ ] Formatting data for display
- [ ] Persisting entities to the database
</quiz>

<quiz>
What distinguishes [MVVM](../../Software%20Architecture/Architectural%20Patterns/MVVM.md) from MVC?

- [x] The ViewModel exposes bindable state, and the view synchronises with it through data binding rather than being selected by a controller
> Correct. Binding is what makes the view thin and the ViewModel unit-testable without a UI.
- [ ] MVVM removes the model entirely
- [ ] MVVM applies only to web applications
- [ ] MVVM requires microservices on the server
</quiz>

<quiz>
A ViewModel in an MVVM application has grown to contain validation, business rules, and API calls. What is the problem?

- [x] Domain logic has migrated into a presentation-layer object, so it cannot be reused or tested outside the UI stack
> Correct. The ViewModel adapts the model for display; the rules belong in the model or domain services.
- [ ] Nothing, since the ViewModel is testable anyway
- [ ] The view should call the API instead
- [ ] The model should be removed to avoid duplication
</quiz>

<quiz>
A small internal tool with one team, modest load, and a short deadline is proposed to launch on microservices, EDA, and Clean Architecture together. What is the sound response?

- [x] Match the pattern to the constraints: start with a well-modularised monolith and extract services only when a real driver appears
> Correct. Patterns are trade-offs against context, and adopting distribution without a driver buys operational cost for nothing.
- [ ] Proceed, since these patterns are industry best practice
- [ ] Use microservices but skip the modularity work to save time
- [ ] Choose whichever pattern the team has not tried yet
</quiz>
