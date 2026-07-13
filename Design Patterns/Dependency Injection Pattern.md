# Dependency Injection Pattern

## Definition

Dependency Injection (DI) is a design pattern where an object receives the objects it needs from the outside instead of creating them by itself.

In simple words, a class should not build its own dependencies. It should ask for them.

## Why Use Dependency Injection?

- It makes classes easier to test.
- It reduces tight coupling between classes.
- It makes code easier to change and extend.
- It supports the Dependency Inversion Principle from SOLID.

## Without Dependency Injection

In this example, `OrderService` creates its own email service.

```csharp
class EmailService
{
    public void SendEmail(string message)
    {
        Console.WriteLine("Email: " + message);
    }
}

class OrderService
{
    private EmailService emailService = new EmailService();

    public void PlaceOrder()
    {
        // place order
        emailService.SendEmail("Order placed successfully.");
    }
}
```

This works, but `OrderService` is tightly coupled to `EmailService`. If we want to send SMS messages instead, we must edit `OrderService`.

## With Dependency Injection

Now `OrderService` depends on an abstraction, and the dependency is passed from the outside.

```csharp
interface INotificationService
{
    void Send(string message);
}

class EmailService : INotificationService
{
    public void Send(string message)
    {
        Console.WriteLine("Email: " + message);
    }
}

class SmsService : INotificationService
{
    public void Send(string message)
    {
        Console.WriteLine("SMS: " + message);
    }
}

class OrderService
{
    private INotificationService notificationService;

    public OrderService(INotificationService notificationService)
    {
        this.notificationService = notificationService;
    }

    public void PlaceOrder()
    {
        // place order
        notificationService.Send("Order placed successfully.");
    }
}
```

Usage:

```csharp
public class Program
{
    public static void Main(string[] args)
    {
        INotificationService notificationService = new EmailService();
        OrderService orderService = new OrderService(notificationService);

        orderService.PlaceOrder();
    }
}
```

Now we can replace `EmailService` with `SmsService` without changing the `OrderService` class.

## Common Types of Dependency Injection

### Constructor Injection

The dependency is passed through the constructor.

```csharp
class UserService
{
    private IUserRepository userRepository;

    public UserService(IUserRepository userRepository)
    {
        this.userRepository = userRepository;
    }
}
```

Use this when the dependency is required for the class to work.

### Setter Injection

The dependency is passed through a setter method.

```csharp
class UserService
{
    private IUserRepository userRepository;

    public void SetUserRepository(IUserRepository userRepository)
    {
        this.userRepository = userRepository;
    }
}
```

Use this when the dependency is optional or can change after object creation.

### Interface Injection

The class receives the dependency through a method defined by an interface.

```csharp
interface IRepositoryInjector
{
    void InjectRepository(IUserRepository userRepository);
}

class UserService : IRepositoryInjector
{
    private IUserRepository userRepository;

    public void InjectRepository(IUserRepository userRepository)
    {
        this.userRepository = userRepository;
    }
}
```

This style is less common than constructor injection and setter injection.

## Real-world Examples

- A service receives a repository instead of creating a database connection directly.
- A controller receives a service instead of creating the service itself.
- A class receives a logger instead of constructing a specific logger.
- A test passes a fake dependency to check behavior without using a real database or API.

## When to Use?

- When a class depends on another class to do its work.
- When you want to replace implementations easily.
- When you want to write unit tests with fake or mock dependencies.
- When object creation should be handled in one place.

## When Not to Use?

- Very small programs where extra interfaces add unnecessary complexity.
- Simple value objects that do not depend on external services.
- Code where the dependency will never change and testing does not need replacement.

## Summary

Dependency Injection helps keep classes flexible and testable by moving dependency creation outside the class that uses them.
