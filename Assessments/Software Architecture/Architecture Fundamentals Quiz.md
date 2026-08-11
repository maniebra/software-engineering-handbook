# Architecture Fundamentals Quiz

14 questions on the [Rules of Software Architecture](../../Software%20Architecture/Rules%20of%20Software%20Architecture.md):
trade-offs, context, change, failure, and how decisions get communicated.

## Trade-offs and context

<quiz>
Two architects propose different designs for the same system and each can defend theirs. What does the first rule of software architecture say about this?

- [x] Everything is a trade-off, so the question is which characteristics each design favours and which it sacrifices
> Correct. There is no universally best design, only a set of consequences that fit the context better or worse.
- [ ] One of them must have misunderstood the requirements
- [ ] The design with fewer components is correct by definition
- [ ] The decision should be deferred until the code proves one right
</quiz>

<quiz>
A team copies an architecture that worked well at a company 100 times their size. What rule are they most directly breaking?

- [x] The best decision is context-dependent, since the constraints that justified that design are absent here
> Correct. Architecture is a response to constraints; copying the response without the constraints imports the cost and none of the benefit.
- [ ] Naming things matters
- [ ] Favor composition over inheritance
- [ ] Feedback loops improve design
</quiz>

<quiz>
An architecture document lists which framework, database, and message broker were chosen, but not why. What is the practical consequence?

- [x] Future teams cannot tell which decisions are still valid when the constraints change, so they either freeze everything or rewrite everything
> Correct. "Why is more important than how": the rationale is what lets a later team re-decide safely.
- [ ] The document is fine, since tool choices are the architecture
- [ ] The system will fail its performance targets
- [ ] Nothing, as long as the code compiles
</quiz>

<quiz>
Why is "code is easier to change than architecture" a useful rule when deciding how much to design up front?

- [x] Architectural decisions are expensive to reverse, so they deserve more analysis than decisions that live in a single module
> Correct. Effort should follow the cost of being wrong, which is what separates architectural from implementation decisions.
- [ ] It means architecture should never be documented
- [ ] It means all decisions should be deferred indefinitely
- [ ] It means refactoring code is always cheap and safe
</quiz>

## Designing for change and failure

<quiz>
"Architect for failure" implies which design stance?

- [x] Assume every dependency will be slow or unavailable at some point, and decide in advance how the system behaves when that happens
> Correct. Timeouts, fallbacks, and degradation are decided at design time, not improvised during an incident.
- [ ] Prevent all failures by using only highly reliable components
- [ ] Log every error and let operators intervene manually
- [ ] Retry every failed call until it succeeds
</quiz>

<quiz>
A team adds a plugin system, a rules engine, and a multi-tenant abstraction to a product with one customer and no confirmed roadmap. Which two rules does this violate most directly?

- [x] Avoid overengineering, and simplicity is the ultimate sophistication
> Correct. Flexibility that no requirement asked for is pure cost, and it makes the system harder to change in the directions actually needed.
- [ ] Design for change, and understand the domain deeply
- [ ] Be technology-agnostic, and validate assumptions continuously
- [ ] Naming things matters, and consistency beats cleverness
</quiz>

<quiz>
How does "design for change" differ from building maximum flexibility everywhere?

- [x] It means identifying which axes of change are likely and making those cheap, while accepting rigidity elsewhere
> Correct. Flexibility is not free, so it is targeted at the parts the domain says will move.
- [ ] It means every class must be behind an interface
- [ ] It means all configuration must be runtime-editable
- [ ] They are the same thing, described differently
</quiz>

<quiz>
An architect claims "we optimised the whole data path for throughput before the first user arrived." What is the risk?

- [x] The optimisation targets guesses rather than measurements, and it usually costs clarity that would have made later, real optimisation easier
> Correct. Premature optimisation trades certain complexity for uncertain gain.
- [ ] Optimising early always produces slower systems
- [ ] Performance work is never an architectural concern
- [ ] Throughput cannot be measured before launch
</quiz>

## Prioritisation and communication

<quiz>
Stakeholders ask for maximum security, maximum performance, maximum flexibility, and the earliest possible launch. What is the architect's job here?

- [x] Make the conflicts explicit and force a priority order, since you cannot have it all
> Correct. Unstated priorities get resolved silently, usually by whoever writes the code first.
- [ ] Accept all four and resolve the conflicts during implementation
- [ ] Choose the two that are cheapest to implement
- [ ] Escalate to the vendor with the best tooling
</quiz>

<quiz>
A design assumes the partner API can sustain 500 requests per second. Which rule tells you what to do with that number?

- [x] Validate assumptions continuously: measure it, and re-check it as the system and the partner change
> Correct. An unvalidated assumption is a design defect with a delayed failure date.
- [ ] Make implicit decisions explicit, then stop
- [ ] Be technology-agnostic and avoid depending on the number
- [ ] Nothing, as long as the number came from the partner's documentation
</quiz>

<quiz>
Two teams solve the same problem in the system in two different but equally reasonable ways. What does "consistency beats cleverness" recommend?

- [x] Converge on one approach, because the cost of a second pattern is paid by every reader and every future change
> Correct. Local optimality that fragments the codebase is a net loss.
- [ ] Keep both, so teams can choose per situation
- [ ] Pick whichever is measurably faster, regardless of style
- [ ] Let each team keep its own approach and document both
</quiz>

<quiz>
Which practice best embodies "make implicit decisions explicit"?

- [x] Recording each significant decision, its context, alternatives, and consequences, in an architecture decision record
> Correct. Decisions that live only in someone's head cannot be reviewed, challenged, or safely revisited.
- [ ] Adding more comments to the implementation code
- [ ] Holding a weekly architecture meeting with no notes
- [ ] Choosing tools that impose their own conventions
</quiz>

<quiz>
Why does "understand the domain deeply" appear in a list of architecture rules at all?

- [x] Because module boundaries, consistency needs, and failure behaviour all derive from the domain, and a wrong domain model cannot be fixed by good technology
> Correct. Architecture is domain structure expressed in software; misreading the domain misplaces every boundary.
- [ ] Because architects are expected to write the requirements
- [ ] Because domain knowledge replaces the need for testing
- [ ] Because it makes stakeholder meetings shorter
</quiz>

<quiz>
An architecture is technically sound but the delivery teams keep building something different. Which rule was neglected?

- [x] Communicate decisions clearly, since an architecture nobody understands is not the architecture that gets built
> Correct. Architecture exists only insofar as it is shared, understood, and reflected in the code.
- [ ] Don't optimize prematurely
- [ ] Favor composition over inheritance
- [ ] Architect for failure
</quiz>
