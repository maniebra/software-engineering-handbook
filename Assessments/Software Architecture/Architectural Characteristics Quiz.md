# Architectural Characteristics Quiz

14 questions on what [architectural characteristics](../../Software%20Architecture/Architectural%20Characteristics/index.md)
are, how they are identified, prioritised, measured, and continuously verified.

## Identifying characteristics

<quiz>
Which of these is an architectural characteristic rather than a feature?

- [x] "Any customer-facing page must render in under 300 ms at p95"
> Correct. It is non-domain, measurable, and it constrains structure through caching, read models, and topology.
- [ ] "A customer can save a payment method for later"
- [ ] "Invoices must include the company VAT number"
- [ ] "Refunds above $500 require a second approver"
</quiz>

<quiz>
A requirement can be satisfied without changing any structure, only by writing the code more carefully. Under the usual three criteria, is it an architectural characteristic?

- [x] No, because it does not influence structure, which makes it an implementation concern
> Correct. The three criteria are non-domain, structurally influential, and critical to success; all three must hold.
- [ ] Yes, because all quality attributes are architectural
- [ ] Yes, if a stakeholder called it important
- [ ] Only if it can be automated in CI
</quiz>

<quiz>
A regulated healthcare product lists "time to market" as its dominant business driver. Which characteristics does that most directly imply?

- [x] Deployability, testability, and maintainability, with security and auditability still required by the regulatory context
> Correct. Characteristics are derived from domain concerns, and a regulated domain carries implicit ones that must be stated anyway.
- [ ] Elasticity and portability above all else
- [ ] Only performance, since users judge speed first
- [ ] Interoperability, because healthcare uses standards
</quiz>

<quiz>
Why are implicit characteristics such as security and availability written down even when nobody asks for them?

- [x] Because unstated requirements are the ones silently designed away, and their absence is discovered in production
> Correct. Making them explicit turns an assumption into a testable constraint.
- [ ] Because standards require a fixed list of characteristics
- [ ] Because they are cheaper to add than domain features
- [ ] Because they replace the need for prioritisation
</quiz>

## Prioritising and trading off

<quiz>
A team's architecture document names 18 "critical" characteristics. What is the practical effect?

- [x] Nothing is actually prioritised, so conflicts get resolved arbitrarily during implementation
> Correct. Characteristics trade against each other, so a list that never says no provides no guidance.
- [ ] The system will support all 18 at higher cost
- [ ] The design becomes simpler because everything is covered
- [ ] Only the first five are typically implemented, which is fine
</quiz>

<quiz>
Which pairing correctly names a common trade-off?

- [x] Pushing availability through replication tends to cost consistency and money
> Correct. Replication buys uptime by accepting divergent data and duplicated infrastructure.
- [ ] Pushing security typically improves usability
- [ ] Pushing scalability typically improves debuggability
- [ ] Pushing configurability typically improves testability
</quiz>

<quiz>
Two required characteristics conflict directly in a specific design decision. What should the architecture have already established?

- [x] An explicit priority order, so the conflict is resolved by the stated top characteristic rather than by preference
> Correct. Naming the one or two dominant characteristics is what makes later decisions decidable.
- [ ] A rule that the cheaper option always wins
- [ ] A committee vote at the time of the conflict
- [ ] A requirement that both be fully satisfied
</quiz>

<quiz>
What does it mean to say a good architecture is the "least worst" set of trade-offs?

- [x] No design maximises every characteristic, so the goal is the compromise whose sacrifices matter least in this context
> Correct. Architecture selects which problems you would rather have.
- [ ] Architecture is inherently low quality and should be minimised
- [ ] The cheapest design is always the correct one
- [ ] Trade-offs disappear once the system is mature
</quiz>

## Measuring and verifying

<quiz>
"The system must be highly maintainable." Why is this unusable as stated?

- [x] It has no objective definition, so it can be claimed but never verified or refuted
> Correct. A characteristic that cannot be measured cannot be designed for or defended.
- [ ] Maintainability is not an architectural characteristic
- [ ] It is usable, since maintainability is universally understood
- [ ] It should be replaced with a coding standard document
</quiz>

<quiz>
Which is the better statement of an availability requirement?

- [x] "99.95% of requests succeed, measured monthly per region, excluding announced maintenance windows"
> Correct. It names the measure, the period, the scope, and the exclusions, so it can be tested and reported.
- [ ] "The system should essentially never be down"
- [ ] "Availability must be best in class for our industry"
- [ ] "Downtime should be minimised as far as reasonably possible"
</quiz>

<quiz>
What is a fitness function?

- [x] An automated check that measures how well the system meets a desired characteristic, run continuously like a test
> Correct. It converts a stated characteristic into a constraint the build or the runtime enforces.
- [ ] A formula for estimating project cost from characteristics
- [ ] A scoring model for comparing candidate architectures on paper
- [ ] A performance profiling tool used during incidents
</quiz>

<quiz>
Which of these is a fitness function for modularity rather than for performance?

- [x] A CI test asserting the domain package has no import from the persistence package
> Correct. Dependency rules verified in the build are the classic structural fitness function.
- [ ] A load test failing the build when p99 exceeds 300 ms
- [ ] A synthetic probe alerting on error-budget burn
- [ ] A chaos experiment terminating an instance
</quiz>

<quiz>
Why do fitness functions matter more than an architecture document for keeping the architecture intact?

- [x] Because the code changes continuously, and only an automated check keeps the intended constraints from eroding
> Correct. Documents describe intent; fitness functions enforce it on every commit.
- [ ] Because documents are always inaccurate when written
- [ ] Because they remove the need to state characteristics at all
- [ ] Because they make code review unnecessary
</quiz>

<quiz>
Which pair of characteristics belongs to the operational and structural families respectively?

- [x] Elasticity and deployability
> Correct. Operational characteristics concern the running system; structural ones concern the code and how it is changed and shipped.
- [ ] Security and usability
- [ ] Maintainability and testability
- [ ] Availability and recoverability
</quiz>
