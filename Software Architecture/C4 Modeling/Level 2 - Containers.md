# Level 2 - Containers

A **Container diagram** zooms into the system box from level 1 and shows the separately runnable or deployable things inside it, the technology each one uses, and how they communicate. It is the most valuable C4 diagram: it is the first picture that shows shape, and it is stable enough to stay true for months.

### What counts as a container

A container is anything that hosts code or stores data and can be started and stopped on its own:

| Container kind | Examples |
| --- | --- |
| Server-side application | Spring Boot service, Django app, Rails app, Lambda function |
| Client-side application | Single-page application, mobile app, desktop app |
| Data store | Relational schema, document store, blob storage, cache |
| Infrastructure with your code or data in it | Message broker topic set, search index, file system |

Not containers: a library or JAR (that is code inside a container), a class, a Kubernetes namespace, a VM, an availability zone. Deployment topology is a *Deployment diagram*, a separate supplementary view.

### The example

```mermaid
C4Container
    title Container diagram for Internet Banking System

    Person(customer, "Personal Banking Customer", "A customer of the bank")

    Container_Boundary(ib, "Internet Banking System") {
        Container(spa, "Single-Page Application", "TypeScript, React", "Account and payment UI in the customer's browser")
        Container(mobile, "Mobile App", "Kotlin, Swift", "Limited account and payment functionality")
        Container(web, "Web Application", "Java, Spring MVC", "Serves static content and the SPA bundle")
        Container(api, "API Application", "Java, Spring Boot", "Banking functionality over a JSON/HTTPS API")
        ContainerDb(db, "Database", "PostgreSQL", "Stores users, hashed credentials, audit log")
    }

    System_Ext(mainframe, "Mainframe Banking System", "Core banking data")
    System_Ext(email, "E-mail System", "Microsoft Exchange")

    Rel(customer, web, "Visits bank.com using", "HTTPS")
    Rel(customer, spa, "Views accounts, makes payments using")
    Rel(customer, mobile, "Views accounts, makes payments using")
    Rel(web, spa, "Delivers to the customer's browser")
    Rel(spa, api, "Makes API calls to", "JSON/HTTPS")
    Rel(mobile, api, "Makes API calls to", "JSON/HTTPS")
    Rel(api, db, "Reads from and writes to", "TCP/IP")
    Rel(api, mainframe, "Gets account information from", "XML/HTTPS")
    Rel(api, email, "Sends e-mail using", "SMTP")

    UpdateLayoutConfig($c4ShapeInRow="3", $c4BoundaryInRow="1")
```

Three things this diagram makes obvious that level 1 could not: the browser app talks to the API directly rather than through the web server; the database is reachable only from the API; and the mainframe integration has exactly one caller.

### The same view in PlantUML

```plantuml
@startuml
skinparam shadowing false
skinparam componentStyle rectangle
actor Customer as c

rectangle "Internet Banking System" {
  component "Single-Page Application\n[React]" as spa
  component "Mobile App\n[Kotlin/Swift]" as mob
  component "Web Application\n[Spring MVC]" as web
  component "API Application\n[Spring Boot]" as api
  database "Database\n[PostgreSQL]" as db
}

component "Mainframe Banking System" as mf #999999
component "E-mail System" as mail #999999

c --> web : HTTPS
c --> spa
c --> mob
web --> spa : delivers
spa --> api : JSON/HTTPS
mob --> api : JSON/HTTPS
api --> db : TCP/IP
api --> mf : XML/HTTPS
api --> mail : SMTP
@enduml
```

### Synchronous and asynchronous edges look different

C4 has no required notation for this, so pick one and put it in the legend. Dashed arrows for asynchronous messaging is the common choice.

```mermaid
flowchart LR
    api["API Application<br/><i>[Spring Boot]</i>"]
    broker[["Message Broker<br/><i>[Container: Kafka]</i>"]]
    worker["Payment Worker<br/><i>[Container: Java]</i>"]
    db[("Database<br/><i>[PostgreSQL]</i>")]

    api -->|"Reads/writes<br/>[TCP/IP], synchronous"| db
    api -. "Publishes PaymentRequested<br/>[Kafka], asynchronous" .-> broker
    broker -. "Delivers PaymentRequested" .-> worker
    worker -->|"Reads/writes"| db
```

The distinction matters architecturally, not cosmetically: synchronous edges multiply failure probability and add latency, asynchronous edges buy availability at the price of eventual consistency. See [Event-Driven Architecture](../Architectural%20Patterns/EDA.md).

### Container diagrams expose the architectural style

The same system drawn at level 2 reveals immediately whether it is a monolith, a modular monolith, or microservices.

```mermaid
flowchart TB
    subgraph mono["Monolith"]
        M1[Web + API + Domain<br/><i>one deployable</i>] --> MD[(Single schema)]
    end
    subgraph micro["Microservices"]
        S1[Accounts Service] --> D1[(Accounts DB)]
        S2[Payments Service] --> D2[(Payments DB)]
        S3[Notifications Service] --> D3[(Notifications DB)]
        S1 -. events .-> S2
    end
```

This is why the container diagram is the one to bring to a design review: the number of boxes is the deployment cost, the number of arrows is the coupling, and the number of data stores is the consistency story.

### How to keep it honest

- **One diagram per system, not per team.** If it does not fit on one page, the system is probably several systems.
- **Name the technology in every box.** "Service" tells the reader nothing; "Service [Go 1.22, gRPC]" tells them how to run it.
- **Draw the data stores.** Diagrams that hide databases hide the hardest coupling in the system.
- **Include the things you are ashamed of**: the cron box, the shared FTP directory, the legacy admin app.

### Deployment is a different diagram

A **Deployment diagram** maps containers onto infrastructure nodes. It is a supplementary C4 view, and it changes far more often than the container diagram, so keep them separate.

```mermaid
flowchart TB
    subgraph aws["AWS eu-west-1"]
        subgraph az1["Availability Zone 1"]
            n1["EKS node<br/>API Application ×3"]
        end
        subgraph az2["Availability Zone 2"]
            n2["EKS node<br/>API Application ×3"]
        end
        rds[("RDS PostgreSQL<br/>primary + standby")]
        cdn["CloudFront<br/>SPA static assets"]
    end
    n1 --> rds
    n2 --> rds
```

Next: [Level 3, Components](Level%203%20-%20Components.md).

## Check Your Understanding

<quiz>
Which of these is a C4 container?

- [x] A PostgreSQL schema that stores the system's data
> Correct. A data store is separately runnable and hosts the system's data, so it is a container.
- [ ] A shared validation library packaged as a JAR
- [ ] The `PaymentService` class
- [ ] The Kubernetes namespace the services are deployed into
</quiz>

<quiz>
Why is the container diagram usually the most useful C4 diagram?

- [x] It is the first view that shows deployable units, their technologies, and their communication paths, which is what design reviews argue about
> Correct. Box count is deployment cost, arrow count is coupling, and data stores expose the consistency story.
- [ ] It is the only level that permits labelled relationships
- [ ] It replaces the need for a system context diagram
- [ ] It shows how containers map onto servers and regions
</quiz>
