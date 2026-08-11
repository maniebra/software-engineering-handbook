# Design Patterns

The 23 patterns catalogued in *Design Patterns: Elements of Reusable Object-Oriented Software* by Gamma, Helm, Johnson and Vlissides, the "Gang of Four", grouped by what they are for.

## Creational

How objects get made, so that creation logic does not leak into the code that uses them.

- [Singleton Pattern](Singleton%20Pattern.md), exactly one instance, globally reachable
- [Factory Pattern](Factory%20Pattern.md), let subclasses decide which class to instantiate
- [Abstract Factory Pattern](Abstract%20Factory%20Pattern.md), create whole families of related objects
- [Builder Pattern](Builder%20Pattern.md), assemble a complex object step by step
- [Prototype Pattern](Prototype%20Pattern.md), create new objects by copying an existing one

## Structural

How objects are composed into larger structures.

- [Adapter Pattern](Adapter%20Pattern.md), make an incompatible interface usable
- [Bridge Pattern](Bridge%20Pattern.md), split an abstraction from its implementation
- [Composite Pattern](Composite%20Pattern.md), treat trees and leaves uniformly
- [Decorator Pattern](Decorator%20Pattern.md), add responsibilities at runtime, without subclassing
- [Facade Pattern](Facade%20Pattern.md), one simple entry point over a complex subsystem
- [Flyweight Pattern](Flyweight%20Pattern.md), share fine-grained objects to save memory
- [Proxy Pattern](Proxy%20Pattern.md), stand in for another object and control access to it

## Behavioural

How objects communicate and distribute responsibility.

- [Chain of Responsibility Pattern](Chain%20of%20Responsibility%20Pattern.md), pass a request along a chain of handlers
- [Command Pattern](Command%20Pattern.md), turn a request into an object you can queue and undo
- [Interpreter Pattern](Interpreter%20Pattern.md), represent and evaluate a small language
- [Iterator Pattern](Iterator%20Pattern.md), traverse a collection without exposing it
- [Mediator Pattern](Mediator%20Pattern.md), replace a web of references with a hub
- [Memento Pattern](Memento%20Pattern.md), snapshot and restore state without breaking encapsulation
- [Observer Pattern](Observer%20Pattern.md), notify dependents automatically on change
- [State Pattern](State%20Pattern.md), change behaviour when internal state changes
- [Strategy Pattern](Strategy%20Pattern.md), swap interchangeable algorithms at runtime
- [Template Method Pattern](Template%20Method%20Pattern.md), fix the skeleton, defer the steps
- [Visitor Pattern](Visitor%20Pattern.md), add operations to a hierarchy without changing it

## Related

- [Dependency Injection](../Snippets%20and%20Cheatsheets/Dependency%20Injection%20Pattern.md), not a GoF pattern, but the usual answer to the coupling these patterns fight

## A word of warning

A pattern is a name for a solution to a recurring problem, not a goal. Applying one to a problem you do not have costs you indirection, classes and reading time, and buys nothing. Reach for a pattern when the pressure it relieves is already hurting.
