
# Definition

## The "formal" definition

> The Decorator Pattern attaches additional responsibilities to an object dynamically. Decorators provide a flexible alternative to sub-classing for extending functionality.



# How does it work

A coffee order: each optional extra is a wrapper that implements the same
interface as the drink it wraps, so wrappers stack in any order.

=== "Java"

    ```java
    public interface Coffee {
        String getDescription();
        double getCost();
    }

    public class PlainCoffee implements Coffee {
        @Override
        public String getDescription() {
            return "Plain Coffee";
        }

        @Override
        public double getCost() {
            return 2.0;
        }
    }

    // The base decorator forwards everything; subclasses override what they change.
    public abstract class CoffeeDecorator implements Coffee {
        protected final Coffee decoratedCoffee;

        public CoffeeDecorator(Coffee decoratedCoffee) {
            this.decoratedCoffee = decoratedCoffee;
        }

        @Override
        public String getDescription() {
            return decoratedCoffee.getDescription();
        }

        @Override
        public double getCost() {
            return decoratedCoffee.getCost();
        }
    }

    public class MilkDecorator extends CoffeeDecorator {
        public MilkDecorator(Coffee decoratedCoffee) {
            super(decoratedCoffee);
        }

        @Override
        public String getDescription() {
            return decoratedCoffee.getDescription() + ", Milk";
        }

        @Override
        public double getCost() {
            return decoratedCoffee.getCost() + 0.5;
        }
    }

    public class SugarDecorator extends CoffeeDecorator {
        public SugarDecorator(Coffee decoratedCoffee) {
            super(decoratedCoffee);
        }

        @Override
        public String getDescription() {
            return decoratedCoffee.getDescription() + ", Sugar";
        }

        @Override
        public double getCost() {
            return decoratedCoffee.getCost() + 0.2;
        }
    }

    public class Main {
        public static void main(String[] args) {
            Coffee coffee = new SugarDecorator(new MilkDecorator(new PlainCoffee()));

            System.out.println(coffee.getDescription()); // Plain Coffee, Milk, Sugar
            System.out.println(coffee.getCost());        // 2.7
        }
    }
    ```

=== "C#"

    ```csharp
    public interface ICoffee
    {
        string Description { get; }
        decimal Cost { get; }
    }

    public class PlainCoffee : ICoffee
    {
        public string Description => "Plain Coffee";
        public decimal Cost => 2.0m;
    }

    // The base decorator forwards everything; subclasses override what they change.
    public abstract class CoffeeDecorator : ICoffee
    {
        protected readonly ICoffee Inner;

        protected CoffeeDecorator(ICoffee inner) => Inner = inner;

        public virtual string Description => Inner.Description;
        public virtual decimal Cost => Inner.Cost;
    }

    public class MilkDecorator : CoffeeDecorator
    {
        public MilkDecorator(ICoffee inner) : base(inner) { }

        public override string Description => $"{Inner.Description}, Milk";
        public override decimal Cost => Inner.Cost + 0.5m;
    }

    public class SugarDecorator : CoffeeDecorator
    {
        public SugarDecorator(ICoffee inner) : base(inner) { }

        public override string Description => $"{Inner.Description}, Sugar";
        public override decimal Cost => Inner.Cost + 0.2m;
    }

    ICoffee coffee = new SugarDecorator(new MilkDecorator(new PlainCoffee()));
    Console.WriteLine(coffee.Description); // Plain Coffee, Milk, Sugar
    Console.WriteLine(coffee.Cost);        // 2.7
    ```

=== "C++"

    ```cpp
    #include <iostream>
    #include <memory>
    #include <string>

    class Coffee {
    public:
        virtual ~Coffee() = default;
        virtual std::string description() const = 0;
        virtual double cost() const = 0;
    };

    class PlainCoffee : public Coffee {
    public:
        std::string description() const override { return "Plain Coffee"; }
        double cost() const override { return 2.0; }
    };

    // The base decorator owns the wrapped drink and forwards to it.
    class CoffeeDecorator : public Coffee {
    public:
        explicit CoffeeDecorator(std::unique_ptr<Coffee> inner)
            : inner_(std::move(inner)) {}

        std::string description() const override { return inner_->description(); }
        double cost() const override { return inner_->cost(); }

    protected:
        std::unique_ptr<Coffee> inner_;
    };

    class MilkDecorator : public CoffeeDecorator {
    public:
        using CoffeeDecorator::CoffeeDecorator;

        std::string description() const override {
            return inner_->description() + ", Milk";
        }
        double cost() const override { return inner_->cost() + 0.5; }
    };

    class SugarDecorator : public CoffeeDecorator {
    public:
        using CoffeeDecorator::CoffeeDecorator;

        std::string description() const override {
            return inner_->description() + ", Sugar";
        }
        double cost() const override { return inner_->cost() + 0.2; }
    };

    int main() {
        std::unique_ptr<Coffee> coffee = std::make_unique<SugarDecorator>(
            std::make_unique<MilkDecorator>(std::make_unique<PlainCoffee>()));

        std::cout << coffee->description() << '\n'; // Plain Coffee, Milk, Sugar
        std::cout << coffee->cost() << '\n';        // 2.7
    }
    ```

=== "Python"

    ```python
    from abc import ABC, abstractmethod


    class Coffee(ABC):
        @property
        @abstractmethod
        def description(self) -> str: ...

        @property
        @abstractmethod
        def cost(self) -> float: ...


    class PlainCoffee(Coffee):
        @property
        def description(self) -> str:
            return "Plain Coffee"

        @property
        def cost(self) -> float:
            return 2.0


    # The base decorator forwards everything; subclasses override what they change.
    class CoffeeDecorator(Coffee):
        def __init__(self, inner: Coffee) -> None:
            self._inner = inner

        @property
        def description(self) -> str:
            return self._inner.description

        @property
        def cost(self) -> float:
            return self._inner.cost


    class MilkDecorator(CoffeeDecorator):
        @property
        def description(self) -> str:
            return f"{self._inner.description}, Milk"

        @property
        def cost(self) -> float:
            return self._inner.cost + 0.5


    class SugarDecorator(CoffeeDecorator):
        @property
        def description(self) -> str:
            return f"{self._inner.description}, Sugar"

        @property
        def cost(self) -> float:
            return self._inner.cost + 0.2


    coffee = SugarDecorator(MilkDecorator(PlainCoffee()))
    print(coffee.description)  # Plain Coffee, Milk, Sugar
    print(round(coffee.cost, 2))  # 2.7
    ```

=== "Rust"

    ```rust
    trait Coffee {
        fn description(&self) -> String;
        fn cost(&self) -> f64;
    }

    struct PlainCoffee;

    impl Coffee for PlainCoffee {
        fn description(&self) -> String {
            "Plain Coffee".to_string()
        }
        fn cost(&self) -> f64 {
            2.0
        }
    }

    // Each decorator owns the drink it wraps; no base class needed.
    struct Milk {
        inner: Box<dyn Coffee>,
    }

    impl Coffee for Milk {
        fn description(&self) -> String {
            format!("{}, Milk", self.inner.description())
        }
        fn cost(&self) -> f64 {
            self.inner.cost() + 0.5
        }
    }

    struct Sugar {
        inner: Box<dyn Coffee>,
    }

    impl Coffee for Sugar {
        fn description(&self) -> String {
            format!("{}, Sugar", self.inner.description())
        }
        fn cost(&self) -> f64 {
            self.inner.cost() + 0.2
        }
    }

    fn main() {
        let coffee = Sugar {
            inner: Box::new(Milk { inner: Box::new(PlainCoffee) }),
        };

        println!("{}", coffee.description()); // Plain Coffee, Milk, Sugar
        println!("{}", coffee.cost());        // 2.7
    }
    ```

=== "TypeScript"

    ```typescript
    interface Coffee {
      description(): string;
      cost(): number;
    }

    class PlainCoffee implements Coffee {
      description(): string {
        return "Plain Coffee";
      }
      cost(): number {
        return 2.0;
      }
    }

    // The base decorator forwards everything; subclasses override what they change.
    abstract class CoffeeDecorator implements Coffee {
      protected constructor(protected readonly inner: Coffee) {}

      description(): string {
        return this.inner.description();
      }

      cost(): number {
        return this.inner.cost();
      }
    }

    class MilkDecorator extends CoffeeDecorator {
      constructor(inner: Coffee) {
        super(inner);
      }

      description(): string {
        return `${this.inner.description()}, Milk`;
      }

      cost(): number {
        return this.inner.cost() + 0.5;
      }
    }

    class SugarDecorator extends CoffeeDecorator {
      constructor(inner: Coffee) {
        super(inner);
      }

      description(): string {
        return `${this.inner.description()}, Sugar`;
      }

      cost(): number {
        return this.inner.cost() + 0.2;
      }
    }

    const coffee = new SugarDecorator(new MilkDecorator(new PlainCoffee()));
    console.log(coffee.description()); // Plain Coffee, Milk, Sugar
    console.log(coffee.cost());        // 2.7
    ```

As you can see, for each additional property that can be in a cup of coffee, we create a decorator class. This decorator class can alter other attributes of the main object (like `cost` and `description`). Using this pattern will able us to create extensions and removes the need to alter the original class.

## Check Your Understanding

<quiz>
What advantage does Decorator have over subclassing?

- [ ] It guarantees a single shared instance of the behaviour
- [x] Behaviour can be added and combined at runtime, without a subclass for every combination
> Correct. Each decorator wraps the same interface, so wrappers stack freely and the wrapped object never changes.
- [ ] It hides a complex subsystem behind one facade
- [ ] It converts one interface into another
</quiz>
