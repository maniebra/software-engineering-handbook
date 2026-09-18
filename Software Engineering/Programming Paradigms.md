# Programming Paradigms

A programming paradigm is a broad way of structuring a program and reasoning about its behaviour. It influences where state lives, how control flows, how components communicate, and which mistakes are easiest or hardest to make. Paradigms are not mutually exclusive: most production languages and systems combine several of them.

## Imperative and procedural programming

Imperative code describes **how** to reach a result: execute statements in order and change program state along the way. Procedural programming organizes that code into reusable procedures or functions.

```python
total = 0
for price in prices:
    total += price
```

It maps naturally to machine execution and is useful when the sequence of operations matters, such as I/O, resource management, or performance-sensitive algorithms. The trade-off is mutable state: as a procedure grows, it can become difficult to see every value it changes.

## Object-oriented programming (OOP)

OOP groups state with the operations that maintain it into objects. Objects collaborate through methods and expose an interface while hiding implementation details.

```python
class Cart:
    def __init__(self):
        self._items = []

    def add(self, item):
        self._items.append(item)
```

It is effective for modelling entities with identity, lifecycle, and invariants, such as an order or a bank account. Prefer composition over deep inheritance: inheritance can couple subclasses to internal details of their base classes and make changes ripple unexpectedly.

## Functional programming

Functional programming treats computation as the evaluation and composition of functions. It emphasizes immutable data, pure functions, and higher-order functions (functions that accept or return functions).

```python
total = sum(map(lambda price: price * 1.2, prices))
```

A pure function has no observable side effects and returns the same output for the same input. That makes it easier to test, reuse, parallelize, and reason about. In practice, isolate unavoidable side effects—database calls, clocks, network requests—at the boundaries of the application rather than trying to eliminate them.

## Declarative programming

Declarative code states **what** result is wanted and leaves the execution strategy to a runtime, engine, or framework.

```sql
SELECT customer_id, SUM(total)
FROM orders
GROUP BY customer_id;
```

SQL, regular expressions, configuration languages, and many UI frameworks are declarative. The abstraction can make intent concise and lets an engine optimize execution, but it also means performance and failure behaviour may be less obvious. Learn enough about the underlying execution model to diagnose slow queries and unexpected updates.

## Logic programming

Logic programming expresses facts and rules; the runtime searches for values that satisfy them. For example, a rule may state that a person is an ancestor if they are a parent, or a parent of an ancestor.

It fits constraint solving, planning, scheduling, and rule-based domains. Its search strategy can be powerful but harder to predict and tune than direct procedural code, especially when the search space is large.

## Event-driven and reactive programming

Event-driven code responds to events such as a user action, a message arriving, or a file changing. Reactive programming extends this idea to values or event streams that propagate changes through a system.

```text
order placed → payment requested → payment confirmed → order fulfilled
```

This is well suited to interactive interfaces, integrations, and asynchronous services. It requires explicit attention to ordering, retries, duplicate delivery, back-pressure, cancellation, and error handling; otherwise the control flow becomes difficult to follow.

## Concurrent and parallel programming

Concurrent programming coordinates multiple tasks that make progress during the same period. Parallel programming runs tasks at the same time on multiple execution resources. They are related but not identical: a single-threaded event loop can be concurrent without running tasks in parallel.

Common models include shared-memory threads, actors that communicate by message passing, async/await, and communicating processes. Prefer ownership, immutability, or message passing where possible; uncontrolled shared mutable state produces races, deadlocks, and timing-dependent failures.

## Choosing and combining paradigms

Choose the style that makes the important constraints visible:

| Need | Useful emphasis |
| --- | --- |
| Stateful domain entities and invariants | Object-oriented design with clear encapsulation |
| Deterministic business rules and transformations | Functional, pure functions |
| Queries, rules, configuration, or UI descriptions | Declarative or logic programming |
| User input, integrations, and streaming updates | Event-driven or reactive programming |
| Many independent tasks or CPU-bound work | Concurrent or parallel programming |
| Direct control over ordered steps and resources | Imperative or procedural programming |

A common combination is an imperative shell that performs I/O, invokes a functional core for business rules, persists state through objects or modules, and communicates across services with events. The goal is not paradigm purity; it is code whose responsibilities, state changes, and failure modes are easy to understand.
