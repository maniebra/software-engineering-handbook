# Structural and Cross-cutting Characteristics Quiz

15 questions on the characteristics felt by the people changing the system, and on the
ones that constrain all of it:
[maintainability](../../Software%20Architecture/Architectural%20Characteristics/Maintainability.md),
[modularity](../../Software%20Architecture/Architectural%20Characteristics/Modularity.md),
[testability](../../Software%20Architecture/Architectural%20Characteristics/Testability.md),
[deployability](../../Software%20Architecture/Architectural%20Characteristics/Deployability.md),
[configurability](../../Software%20Architecture/Architectural%20Characteristics/Configurability.md),
[security](../../Software%20Architecture/Architectural%20Characteristics/Security.md),
[observability](../../Software%20Architecture/Architectural%20Characteristics/Observability.md),
[usability](../../Software%20Architecture/Architectural%20Characteristics/Usability.md),
[portability](../../Software%20Architecture/Architectural%20Characteristics/Portability.md) and
[interoperability](../../Software%20Architecture/Architectural%20Characteristics/Interoperability.md).

## Structure

<quiz>
Which measurement is the most honest proxy for maintainability?

- [x] How long it takes a new engineer to ship a small change safely
> Correct. It integrates comprehension, coupling, test confidence, and pipeline friction into one observable number.
- [ ] Total lines of code in the repository
- [ ] Number of classes per package
- [ ] Percentage of code covered by comments
</quiz>

<quiz>
A feature request consistently requires edits in the controller layer, the service layer, and the repository layer. What does this indicate?

- [x] The modules are aligned with technical layers rather than with the axis along which the system changes
> Correct. Domain-aligned modules localise a change; layer-aligned ones spread every change across all layers.
- [ ] The layers are too thin and should be merged into one
- [ ] The team needs more integration tests
- [ ] This is unavoidable in any layered system
</quiz>

<quiz>
Connascence of position is discovered between two modules that communicate across a service boundary. What is the recommended direction of change?

- [x] Weaken it, for example by replacing positional arguments with a named structure, since strong connascence should stay local
> Correct. The two rules are: keep strong connascence local, and weaken whatever crosses a boundary.
- [ ] Strengthen it so both sides stay in sync
- [ ] Merge the two modules into one
- [ ] Nothing, since connascence only applies within a class
</quiz>

<quiz>
A "common" library is shared by every service and changes weekly. What has effectively happened?

- [x] The services are coupled through the shared library, which reintroduces monolithic release coordination
> Correct. Shared code is coupling; a little duplication is often cheaper than a lot of shared change.
- [ ] The architecture has become properly DRY
- [ ] Deployability has improved through reuse
- [ ] Nothing, since each service still deploys separately
</quiz>

<quiz>
A team's test suite is dominated by slow end-to-end tests, and unit tests are rare. What is the most likely architectural cause?

- [x] Business logic is entangled with I/O, so it cannot be exercised without running the whole system
> Correct. An inverted pyramid is usually a design symptom rather than a discipline problem.
- [ ] The team dislikes writing unit tests
- [ ] End-to-end tests were chosen because they are more accurate
- [ ] The CI runners are too slow for unit tests
</quiz>

<quiz>
Which change most improves controllability and determinism in tests?

- [x] Injecting the clock, the ID generator, and the random source instead of calling them directly
> Correct. Hidden global state is the classic source of untestable, flaky logic.
- [ ] Increasing test timeouts so slow tests pass
- [ ] Adding retries around failing assertions
- [ ] Sharing one staging database across all test runs
</quiz>

<quiz>
Why is building one artefact and promoting it through environments better than rebuilding per environment?

- [x] Because what was tested is exactly what reaches production, with only configuration differing
> Correct. Rebuilding creates differences that silently invalidate all earlier testing.
- [ ] Because it is always faster to build once
- [ ] Because container registries cannot be shared
- [ ] Because configuration must be compiled into the artefact
</quiz>

<quiz>
The four DORA metrics measure throughput and stability. What does the evidence say about their relationship?

- [x] They improve together, because small frequent changes carry less risk each
> Correct. Speed and stability are not opposites; large batched releases hurt both.
- [ ] Improving deployment frequency necessarily raises change failure rate
- [ ] Stability can only be bought by slowing releases
- [ ] They measure the same underlying quantity
</quiz>

<quiz>
Which schema change is safe to deploy alongside a rolling release?

- [x] Adding a new nullable column while both old and new code continue to work
> Correct. Expand then contract: two versions run simultaneously during a rolling deployment, so changes must be backward compatible.
- [ ] Renaming a column in place
- [ ] Dropping an unused column at the same time as the new code
- [ ] Adding a NOT NULL column with no default
</quiz>

<quiz>
What is the main testability cost of adding many independent feature flags?

- [x] The number of behaviour combinations grows as 2ⁿ, so almost none of them are ever tested together
> Correct. Flags need owners, expiry dates, and removal, or they become permanent untested branches.
- [ ] Each flag slows the application at runtime
- [ ] Flags prevent rolling deployments
- [ ] Flags require a separate database per environment
</quiz>

## Cross-cutting

<quiz>
An authenticated request from user A asks for order 5001, which belongs to user B. Where must this be stopped?

- [x] In the service, by a per-resource authorisation check, regardless of what the gateway validated
> Correct. Authentication is not permission; skipping the resource check is the insecure-direct-object-reference flaw.
- [ ] At the gateway, which should have rejected the token
- [ ] Nowhere, since the token was valid
- [ ] In the database, through row-level encryption
</quiz>

<quiz>
An authorisation check throws an unexpected exception. What must the outcome be?

- [x] Denial, since failing securely means errors never fall through to allow
> Correct. Error paths are the most commonly overlooked authorisation bypass.
- [ ] Allow, then log the exception for review
- [ ] Retry the check until it returns a result
- [ ] Escalate to an administrator for manual approval
</quiz>

<quiz>
During an incident, what makes logs from a distributed system actually usable?

- [x] A correlation or trace ID propagated through every hop, including message headers
> Correct. Without shared identity, per-service logs cannot be joined into one request's story.
- [ ] Verbose DEBUG logging enabled in production
- [ ] Free-form prose messages that read naturally
- [ ] A separate log store per service, queried individually
</quiz>

<quiz>
Which alerting policy is most likely to keep on-call engineers responsive?

- [x] Page on user-visible symptoms such as error rate and latency, and keep resource metrics as diagnostic dashboards
> Correct. Cause-based alerts fire without user impact and train people to ignore alerts.
- [ ] Page whenever CPU exceeds 80% on any instance
- [ ] Page on every application exception
- [ ] Page only when a customer opens a support ticket
</quiz>

<quiz>
A team builds a full database abstraction layer so they "could switch engines later", with no migration planned. Which characteristic did they over-buy, and at what cost?

- [x] Portability, paid for with permanent complexity and the loss of engine-specific capabilities
> Correct. Speculative portability is a standing tax for an event that usually never occurs; isolate the platform behind ports only when there is a concrete reason to move.
- [ ] Interoperability, paid for with slower partner integrations
- [ ] Modularity, paid for with too few services
- [ ] Configurability, paid for with more environment variables
</quiz>
