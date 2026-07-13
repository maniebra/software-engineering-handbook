# SOLID Principles

SOLID is a set of five object-oriented design principles that help make software easier to understand, test, and change.

## Single Responsibility Principle (SRP)

One class should do one thing and one thing only.

### Example

A `UserService` should handle user-related business rules, while an `EmailService` should handle sending emails.

Bad:

```java
class UserService {
    void createUser() {
        // create user
        // send welcome email
        // write log file
    }
}
```

Better:

```java
class UserService {
    private EmailService emailService;

    void createUser() {
        // create user
        emailService.sendWelcomeEmail();
    }
}
```

## Open/Closed Principle (OCP)

A class should be open for extension, but closed for modification.

### Example

Instead of editing a payment processor every time a new payment method is added, create a common interface and add new implementations.

```java
interface PaymentMethod {
    void pay(double amount);
}

class CreditCardPayment implements PaymentMethod {
    public void pay(double amount) {
        // pay by credit card
    }
}

class PaypalPayment implements PaymentMethod {
    public void pay(double amount) {
        // pay by PayPal
    }
}
```

The system can support new payment methods by adding new classes, not by rewriting existing logic.

## Liskov Substitution Principle (LSP)

If a class works, its subclasses must work as well without surprises.

### Example

If a function expects a `Bird`, any subclass of `Bird` should behave correctly in that function.

Bad:

```java
class Bird {
    void fly() {}
}

class Penguin extends Bird {
    void fly() {
        throw new UnsupportedOperationException();
    }
}
```

Better:

```java
interface Bird {}

interface FlyingBird extends Bird {
    void fly();
}

class Sparrow implements FlyingBird {
    public void fly() {
        // fly
    }
}

class Penguin implements Bird {
    // penguins do not fly
}
```

## Interface Segregation Principle (ISP)

Don't force a class to implement methods it does not need.

### Example

Bad:

```java
interface Worker {
    void work();
    void eat();
}

class Robot implements Worker {
    public void work() {}

    public void eat() {
        // robots do not eat
    }
}
```

Better:

```java
interface Workable {
    void work();
}

interface Eatable {
    void eat();
}

class Robot implements Workable {
    public void work() {}
}
```

## Dependency Inversion Principle (DIP)

Depend on ideas (abstractions), not on details.

### Example

A high-level class should depend on an interface instead of a concrete database class.

Bad:

```java
class UserService {
    private MySqlUserRepository repository = new MySqlUserRepository();
}
```

Better:

```java
interface UserRepository {
    User findById(int id);
}

class UserService {
    private UserRepository repository;

    UserService(UserRepository repository) {
        this.repository = repository;
    }
}
```

Now `UserService` can work with MySQL, PostgreSQL, an API, or a fake repository for tests.
