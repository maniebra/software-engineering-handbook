## Definition

The Factory Pattern defines an interface for creating an object but lets subclasses decide which class to instantiate. It encapsulates object creation logic, promoting loose coupling between the client and the concrete classes it uses.

- Think of it as a **"virtual constructor"**.
- It helps in managing and centralizing object creation logic.


##  When to Use?

- You need to create objects without exposing the instantiation logic to the client.
- You want to manage or control the types of objects being created.
- The exact type of the object might change based on input, configuration, or context.

## Use-case Examples (Real-world Applications)

- UI components creation (buttons for Windows, Mac, Linux)
- Document parsers (CSVParser, JSONParser, XMLParser)

## Example

A notification sender, where the caller asks for a kind of notification and the
factory decides which concrete class answers.

=== "Java"

    ```java
    public interface Notification {
        void send(String message);
    }

    public class EmailNotification implements Notification {
        public void send(String message) {
            System.out.println("Sending Email: " + message);
        }
    }

    public class SmsNotification implements Notification {
        public void send(String message) {
            System.out.println("Sending SMS: " + message);
        }
    }

    // The factory: the one place that knows the concrete classes.
    public class NotificationFactory {
        public static Notification createNotification(String type) {
            return switch (type.toUpperCase()) {
                case "EMAIL" -> new EmailNotification();
                case "SMS" -> new SmsNotification();
                default -> throw new IllegalArgumentException("Unknown type: " + type);
            };
        }
    }

    public class Main {
        public static void main(String[] args) {
            Notification notification = NotificationFactory.createNotification("EMAIL");
            notification.send("Hello, World!");
        }
    }
    ```

=== "C#"

    ```csharp
    public interface INotification
    {
        void Send(string message);
    }

    public class EmailNotification : INotification
    {
        public void Send(string message) => Console.WriteLine($"Sending Email: {message}");
    }

    public class SmsNotification : INotification
    {
        public void Send(string message) => Console.WriteLine($"Sending SMS: {message}");
    }

    public static class NotificationFactory
    {
        public static INotification Create(string type) => type.ToUpperInvariant() switch
        {
            "EMAIL" => new EmailNotification(),
            "SMS" => new SmsNotification(),
            _ => throw new ArgumentException($"Unknown type: {type}"),
        };
    }

    INotification notification = NotificationFactory.Create("EMAIL");
    notification.Send("Hello, World!");
    ```

=== "C++"

    ```cpp
    #include <iostream>
    #include <memory>
    #include <stdexcept>
    #include <string>

    class Notification {
    public:
        virtual ~Notification() = default;
        virtual void send(const std::string& message) = 0;
    };

    class EmailNotification : public Notification {
    public:
        void send(const std::string& message) override {
            std::cout << "Sending Email: " << message << '\n';
        }
    };

    class SmsNotification : public Notification {
    public:
        void send(const std::string& message) override {
            std::cout << "Sending SMS: " << message << '\n';
        }
    };

    // Returning unique_ptr keeps ownership of the product explicit.
    std::unique_ptr<Notification> createNotification(const std::string& type) {
        if (type == "EMAIL") return std::make_unique<EmailNotification>();
        if (type == "SMS") return std::make_unique<SmsNotification>();
        throw std::invalid_argument("Unknown type: " + type);
    }

    int main() {
        auto notification = createNotification("EMAIL");
        notification->send("Hello, World!");
    }
    ```

=== "Python"

    ```python
    from abc import ABC, abstractmethod


    class Notification(ABC):
        @abstractmethod
        def send(self, message: str) -> None: ...


    class EmailNotification(Notification):
        def send(self, message: str) -> None:
            print(f"Sending Email: {message}")


    class SmsNotification(Notification):
        def send(self, message: str) -> None:
            print(f"Sending SMS: {message}")


    # A dict of constructors is the usual Python factory: classes are values.
    _REGISTRY: dict[str, type[Notification]] = {
        "EMAIL": EmailNotification,
        "SMS": SmsNotification,
    }


    def create_notification(kind: str) -> Notification:
        try:
            return _REGISTRY[kind.upper()]()
        except KeyError:
            raise ValueError(f"Unknown type: {kind}") from None


    create_notification("EMAIL").send("Hello, World!")
    ```

=== "Rust"

    ```rust
    trait Notification {
        fn send(&self, message: &str);
    }

    struct EmailNotification;
    struct SmsNotification;

    impl Notification for EmailNotification {
        fn send(&self, message: &str) {
            println!("Sending Email: {message}");
        }
    }

    impl Notification for SmsNotification {
        fn send(&self, message: &str) {
            println!("Sending SMS: {message}");
        }
    }

    // Box<dyn Trait> is how Rust returns "some implementation of this trait".
    fn create_notification(kind: &str) -> Result<Box<dyn Notification>, String> {
        match kind.to_uppercase().as_str() {
            "EMAIL" => Ok(Box::new(EmailNotification)),
            "SMS" => Ok(Box::new(SmsNotification)),
            other => Err(format!("Unknown type: {other}")),
        }
    }

    fn main() {
        let notification = create_notification("EMAIL").unwrap();
        notification.send("Hello, World!");
    }
    ```

=== "TypeScript"

    ```typescript
    interface Notification {
      send(message: string): void;
    }

    class EmailNotification implements Notification {
      send(message: string): void {
        console.log(`Sending Email: ${message}`);
      }
    }

    class SmsNotification implements Notification {
      send(message: string): void {
        console.log(`Sending SMS: ${message}`);
      }
    }

    type NotificationType = "EMAIL" | "SMS";

    // The union type makes an unknown kind a compile error, not a throw.
    export function createNotification(type: NotificationType): Notification {
      switch (type) {
        case "EMAIL":
          return new EmailNotification();
        case "SMS":
          return new SmsNotification();
      }
    }

    createNotification("EMAIL").send("Hello, World!");
    ```

## Check Your Understanding

<quiz>
Why use a Factory instead of calling a constructor directly?

- [x] The caller depends on an interface, and the factory decides which concrete class to instantiate
> Correct. Object creation is moved behind one method, so adding a new product does not touch every call site.
- [ ] It guarantees only one instance of the product ever exists
- [ ] It converts an incompatible interface into the one the client expects
- [ ] It stores and restores the previous state of an object
</quiz>
