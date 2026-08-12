# Level 4 - Code

A **Code diagram** zooms into one component and shows how it is implemented: classes, interfaces, and their relationships, usually as a UML class or sequence diagram. It is the optional level. Simon Brown's own advice is to draw it rarely, keep it out of version-controlled documentation, and generate it from an IDE when needed, because it is obsolete the moment someone refactors.

Draw one when the design is subtle and worth explaining: a state machine, a strategy hierarchy, a tricky concurrency protocol.

### The example: inside the Security Component

```plantuml
@startuml
skinparam shadowing false
skinparam classAttributeIconSize 0

interface AuthenticationService {
  +authenticate(username, password): AuthResult
}

class DatabaseAuthenticationService {
  -users: UserRepository
  -hasher: PasswordHasher
  +authenticate(username, password): AuthResult
}

interface UserRepository {
  +findByUsername(username): Optional<User>
}

class JdbcUserRepository {
  +findByUsername(username): Optional<User>
}

interface PasswordHasher {
  +matches(raw, hashed): boolean
}

class BcryptPasswordHasher

class User {
  -id: UUID
  -username: String
  -passwordHash: String
  -failedAttempts: int
  +isLocked(): boolean
}

DatabaseAuthenticationService ..|> AuthenticationService
JdbcUserRepository ..|> UserRepository
BcryptPasswordHasher ..|> PasswordHasher
DatabaseAuthenticationService --> UserRepository
DatabaseAuthenticationService --> PasswordHasher
UserRepository --> User
@enduml
```

Note the shape: the component exposes one interface to the rest of the container, and hides the rest. That is what makes it a component rather than a folder.

### Behaviour, not just structure

Class diagrams show what exists; sequence diagrams show what happens. For most level-4 explanations, the sequence is the interesting part.

```mermaid
sequenceDiagram
    autonumber
    participant C as Sign In Controller
    participant A as DatabaseAuthenticationService
    participant R as JdbcUserRepository
    participant H as BcryptPasswordHasher
    participant DB as PostgreSQL

    C->>A: authenticate("mani", "•••")
    A->>R: findByUsername("mani")
    R->>DB: SELECT ... WHERE username = ?
    DB-->>R: row
    R-->>A: User
    alt user locked
        A-->>C: AuthResult.locked()
    else not locked
        A->>H: matches(raw, user.passwordHash)
        H-->>A: false
        A->>R: recordFailedAttempt(user)
        A-->>C: AuthResult.invalidCredentials()
    end
```

The `alt` block carries the design decision worth documenting: lockout is checked before the hash comparison, so a locked account costs no bcrypt work. Structure alone would never have shown that.

### State, when the logic is a machine

```mermaid
stateDiagram-v2
    [*] --> Active
    Active --> Active: failed attempt (n < 5)
    Active --> Locked: 5th failed attempt
    Locked --> Active: lockout expires (15 min)
    Locked --> Active: admin unlock
    Active --> Disabled: account closed
    Disabled --> [*]
```

### When to draw level 4, and when not to

| Situation | Draw it? |
| --- | --- |
| Explaining a non-obvious algorithm or protocol to reviewers | Yes, in the pull request or an ADR |
| Onboarding someone into a subtle component | Yes, generated on the spot |
| Documenting every component of the system | No. It will be wrong before the sprint ends |
| Whiteboarding a design before writing it | Yes, then erase it |
| Repository documentation intended to stay accurate | No. Generate on demand instead |

The rule of thumb: **level 4 diagrams should be cheap enough to throw away.** If keeping one accurate would cost real effort, the code should be readable enough not to need it.

### Generate rather than maintain

```mermaid
flowchart LR
    code["Source code"] --> tool["IDE / doc generator<br/><i>IntelliJ diagrams, pyreverse,<br/>PlantUML parsers, Doxygen</i>"]
    tool --> diag["Class or sequence diagram<br/><i>correct by construction</i>"]
    hand["Hand-drawn level 4"] -.->|"drifts from code"| stale["Confidently wrong diagram"]
```

A hand-maintained level-4 diagram is worse than none: readers trust it, and it lies. This is the same failure mode as stale comments, at larger scale.

### How the four levels relate one last time

```mermaid
flowchart TB
    A["Level 1, Context<br/><i>Internet Banking System</i><br/>stable for years"]
    B["Level 2, Containers<br/><i>SPA, API, database</i><br/>stable for months"]
    C["Level 3, Components<br/><i>Security, Mainframe Facade</i><br/>stable for weeks; generate or test"]
    D["Level 4, Code<br/><i>DatabaseAuthenticationService</i><br/>stable for hours; generate on demand"]
    A --> B --> C --> D
```

Effort should be spent in inverse proportion to volatility: invest in levels 1 and 2, enforce level 3 with tests, and let level 4 be disposable.

## Check Your Understanding

<quiz>
What is the standard advice about level 4 code diagrams?

- [x] Draw them rarely and generate them on demand, because they go stale immediately and a stale diagram misleads
> Correct. Level 4 is optional and disposable; effort belongs at the more stable levels.
- [ ] Draw one per class so the documentation is complete
- [ ] Draw them first, since code is the foundation the other levels rest on
- [ ] Never draw them, since UML is incompatible with C4
</quiz>

<quiz>
A sequence diagram of the sign-in flow shows the lockout check happening before the password hash comparison. Why is that worth documenting at level 4?

- [x] Because it is a behavioural design decision, a locked account avoids expensive hashing, that a class diagram cannot express
> Correct. Structure shows what exists; behaviour shows the ordering decisions that carry the reasoning.
- [ ] Because C4 requires a sequence diagram for every component
- [ ] Because it defines the container boundary
- [ ] Because sequence diagrams replace class diagrams at level 4
</quiz>
