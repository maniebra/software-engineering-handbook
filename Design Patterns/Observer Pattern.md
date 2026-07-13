
# Definition

## The "**formal**" definition

> The Observer Pattern defines a one-to-many dependency between objects so that when one object changes state, all of its dependents are notified and updated automatically.

## What it actually means

Suppose you have a waitperson at a restaurant holding an important meeting. This server will make the arrangements and synchronize all the entities (including guests and other wait-people). You can tell them to add something (like a drink) to your bill, and the waitperson will track all the information from all the entities across the restaurant. The observer pattern does the same thing. It keeps track of the data needed globally across the program.d


## The meaning of "loose coupling"

When two objects are loosely coupled, they can interact but they have little-to-no knowledge of one another.

## How can loose coupling help us?

Loosely coupled designs allow us to build flexible object oriented systems that can handle change because they minimize the inter-dependency between objects.

# Practical Examples

- The **event listeners** in a web app follow this pattern.

# Java Example

```java
public interface Observer {
    void update(String news);
}
```

and then:

```java
public class EmailSubscriber implements Observer {
    private String name;

    public EmailSubscriber(String name) {
        this.name = name;
    }

    @Override
    public void update(String news) {
        System.out.println("Email to " + name + ": " + news);
    }
}

public class SmsSubscriber implements Observer {
    private String phoneNumber;

    public SmsSubscriber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public void update(String news) {
        System.out.println("SMS to " + phoneNumber + ": " + news);
    }
}
```

then we need a subject:

```java
public interface Subject {
    void attach(Observer o);
    void detach(Observer o);
    void notifyObservers();
}
```

```java
import java.util.ArrayList;
import java.util.List;

public class NewsAgency implements Subject {
    private List<Observer> observers = new ArrayList<>();
    private String latestNews;

    public void setNews(String news) {
        this.latestNews = news;
        notifyObservers();
    }

    @Override
    public void attach(Observer o) {
        observers.add(o);
    }

    @Override
    public void detach(Observer o) {
        observers.remove(o);
    }

    @Override
    public void notifyObservers() {
        for (Observer o : observers) {
            o.update(latestNews);
        }
    }
}
```