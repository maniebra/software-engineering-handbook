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

Every language solves the "exactly one instance" problem differently: some need
explicit locking, others get the guarantee from the runtime or the type system.

=== "Java"

    ```java
    // The enum constant is created once by the class loader, which makes this
    // form thread-safe and serialization-safe without any locking.
    public enum Singleton {
        INSTANCE;

        public void doWork() {
            System.out.println("working");
        }
    }

    // Lazy variant when the instance is expensive and may never be needed.
    public class LazySingleton {
        private LazySingleton() {}

        private static class Holder {
            static final LazySingleton INSTANCE = new LazySingleton();
        }

        public static LazySingleton getInstance() {
            return Holder.INSTANCE; // initialized on first access, once
        }
    }
    ```

=== "C#"

    ```csharp
    public sealed class Singleton
    {
        // Lazy<T> is thread-safe by default, so no double-checked locking.
        private static readonly Lazy<Singleton> _instance =
            new(() => new Singleton());

        private Singleton() { }

        public static Singleton Instance => _instance.Value;

        public void DoWork() => Console.WriteLine("working");
    }
    ```

=== "C++"

    ```cpp
    class Singleton {
    public:
        // Since C++11 the initialization of a function-local static is
        // guaranteed to happen exactly once, even with concurrent callers.
        static Singleton& instance() {
            static Singleton instance;
            return instance;
        }

        Singleton(const Singleton&) = delete;
        Singleton& operator=(const Singleton&) = delete;

        void doWork() { std::cout << "working\n"; }

    private:
        Singleton() = default;
    };
    ```

=== "Python"

    ```python
    # A module is already a singleton: it is imported and executed once.
    # Prefer this over a Singleton class in Python.
    _instance = None


    def get_logger() -> "Logger":
        global _instance
        if _instance is None:
            _instance = Logger()
        return _instance


    # The class-based form, when a class is really wanted.
    class Singleton:
        _instance = None

        def __new__(cls):
            if cls._instance is None:
                cls._instance = super().__new__(cls)
            return cls._instance
    ```

=== "Rust"

    ```rust
    use std::sync::OnceLock;

    pub struct Config {
        pub name: String,
    }

    // OnceLock initializes at most once, no matter how many threads race.
    static CONFIG: OnceLock<Config> = OnceLock::new();

    pub fn config() -> &'static Config {
        CONFIG.get_or_init(|| Config { name: "app".to_string() })
    }
    ```

=== "TypeScript"

    ```typescript
    // A module-level constant is the idiomatic singleton: ES modules are
    // evaluated once per program.
    class Logger {
      log(message: string): void {
        console.log(message);
      }
    }

    export const logger = new Logger();

    // The explicit form, when lazy creation is required.
    export class Singleton {
      private static instance?: Singleton;

      private constructor() {}

      static getInstance(): Singleton {
        return (Singleton.instance ??= new Singleton());
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
