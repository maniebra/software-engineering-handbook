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


```java
public interface Notification {
    void send(String message);
}
```

```java
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
```

```java
public class NotificationFactory {
    public static Notification createNotification(String type) {
        if (type.equalsIgnoreCase("EMAIL")) {
            return new EmailNotification();
        } else if (type.equalsIgnoreCase("SMS")) {
            return new SmsNotification();
        }
        throw new IllegalArgumentException("Unknown type: " + type);
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        Notification notification = NotificationFactory.createNotification("EMAIL");
        notification.send("Hello, World!");
    }
}
```