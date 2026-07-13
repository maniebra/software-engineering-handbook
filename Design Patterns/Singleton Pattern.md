## Definition
The Singleton Pattern ensures that a class has only one instance throughout the application's life-cycle and provides a global point of access to that instance. Remember:

- A singleton object is not a "glorified" global variable!
- Prefer **dependency injection** over direct singleton usage if possible.

## When to Use?

- You need exactly one instance of an object across your system.
- Having multiple instances will cause redundancy, corruption, or conflict.

## Use-case Examples (Real-world Applications)
- Logger
- Database Connection Pool

## Example
### Java
```java
public class Singleton {
    private static Singleton instance;

    private Singleton() {}

    public static synchronized Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton();
        }
        return instance;
    }
}

```
