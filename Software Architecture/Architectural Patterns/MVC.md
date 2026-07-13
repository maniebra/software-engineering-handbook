
#  Model-View-Controller (MVC)

MVC separates application logic into three components: **Model**, **View**, and **Controller**.

### Components:

- **Model**: Manages data, business logic, and state.
- **View**: Displays data to the user (UI components).
- **Controller**: Handles user input, interacts with model, updates view.

### Interaction Flow:

```
User → Controller → Model → View → User
```

### Example:

A blog application can follow MVC:

- **Model**: `Post`, `Comment`, and `User` objects plus rules such as publishing status.
- **View**: HTML pages that show the post list, post detail, and comment form.
- **Controller**: Handles requests such as creating a post, loading comments, or updating a draft.

When a user submits a new comment, the controller receives the request, updates the model, and returns a refreshed view.

### Pros:

- Clear separation of concerns.
- Easier testing and maintenance.

### Cons:

- Controller can become overly complex.
- Can lead to tight coupling between Controller and View.

### When to use:

- Web applications (e.g., Django, Ruby on Rails).
- Applications where UI and logic are clearly separated.

---


---



---


---

# 5. Onion Architecture

Similar to Clean Architecture; it's layered, focused on decoupling external dependencies from core logic.

### Layers:

- **Domain Layer**: Core domain logic and entities.
- **Application Services Layer**: Use cases and business logic orchestration.
- **Infrastructure Layer**: External resources (database, file system, etc.).
- **Presentation/UI Layer**: User interfaces and controllers.

### Structure:

```
Presentation/UI → Application Services → Domain ← Infrastructure
```

### Example:

A banking application can use Onion Architecture:

- **Domain Layer**: Account, transaction, and balance rules.
- **Application Services Layer**: Use cases such as transfer money, open account, or freeze card.
- **Infrastructure Layer**: Database repositories, payment gateway clients, and email services.
- **Presentation/UI Layer**: REST controllers, admin dashboard, or mobile app endpoints.

The money-transfer rule stays in the domain even if the database, API framework, or payment provider changes.

### Pros:

- Strong decoupling and testability.
- Easier to maintain domain purity.

### Cons:

- Requires clear discipline to avoid domain pollution.
- Can be overly structured for simpler apps.

### When to use:

- Complex applications with evolving business logic.
- Enterprise apps with strong domain models.
