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

## Check Your Understanding

<quiz>
What problem does the Singleton Pattern solve?

- [ ] It creates a family of related objects without naming their concrete classes
- [x] It guarantees a class has exactly one instance and a global access point to it
> Correct. Singleton restricts instantiation to a single object shared for the whole application life-cycle.
- [ ] It copies an existing object instead of building a new one
- [ ] It lets an object change its behaviour when its internal state changes
</quiz>
