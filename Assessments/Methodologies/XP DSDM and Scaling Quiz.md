# Practices and Governance Quiz

16 questions covering [XP practices](../../Methodologies/Extreme%20Programming/XP%20Practices.md),
[DSDM](../../Methodologies/DSDM/index.md) and [MoSCoW](../../Methodologies/DSDM/MoSCoW.md),
[scaling](../../Methodologies/Scaling%20Agile.md) and
[choosing a methodology](../../Methodologies/Choosing%20a%20Methodology.md).

## XP practices

<quiz>
Why must a TDD test be observed failing before the code is written?

- [ ] Because the build system requires a failing state to record coverage
- [ ] Because refactoring is only legal after a failure
- [x] A test that has never failed may pass for reasons unrelated to the code it claims to cover
> Correct. The red step is the only evidence that the test actually exercises the new behavior.
- [ ] Because it produces a more accurate estimate for the item
</quiz>

<quiz>
Which best describes the cost of pair programming?

- [ ] Two people for twice as long, so four times the cost
- [x] Two people on one task, offset by continuous review, faster defect detection and wider knowledge
> Correct. The comparison to make is against solo work plus a separate review cycle, not against solo work with no review at all.
- [ ] No cost, since paired work is always twice as fast
- [ ] It cannot be measured, so it is adopted on faith
</quiz>

<quiz>
A team adopts collective code ownership without continuous integration or tests. What happens?

- [x] Changes break code elsewhere with nothing to catch it, since no automated check runs on every integration
> Correct. XP's practices are mutually supporting, and removing one takes away the safety net another depends on.
- [ ] Ownership disputes increase between developers
- [ ] Nothing, the practices are independent
- [ ] Refactoring becomes impossible to schedule
</quiz>

<quiz>
Long-lived feature branches are, in Lean terms, what?

- [ ] Extra processing
- [ ] Motion
- [ ] Over-production
- [x] Inventory, since divergence accumulates until merging becomes its own project
> Correct. Continuous integration exists specifically to keep this queue near zero.
</quiz>

<quiz>
In XP's planning game, which side decides estimates?

- [ ] The customer, who owns the budget
- [ ] The coach, who balances the two sides
- [x] The developers, while the customer decides scope and priority
> Correct. Separating the two authorities is what prevents both imposed deadlines and developer-driven gold-plating.
- [ ] Both jointly, by consensus vote
</quiz>

<quiz>
XP treats sustained overtime as what?

- [ ] Evidence of team commitment
- [x] A planning defect, because tired developers produce defects costing more than the hours gained
> Correct. Sustainable pace is a hard rule in XP rather than an aspiration, which is Agile principle 8 applied at team level.
- [ ] A normal part of the release cycle
- [ ] A trade-off the customer may purchase
</quiz>

<quiz>
Which XP rule set describes simple design?

- [x] Passes all tests, reveals intention, no duplication, fewest elements, in that order
> Correct. Ordering matters. A design is not permitted to become clearer by breaking tests.
- [ ] Fewest classes, fewest methods, fewest lines, in that order
- [ ] Documented, layered, decoupled, and covered by tests
- [ ] Configurable, extensible, reusable, and abstract
</quiz>

## DSDM

<quiz>
DSDM fixes time, cost and quality. What flexes?

- [ ] Team size, which scales to protect the date
- [ ] Quality, through a reduced testing standard late in the timebox
- [ ] The delivery date, which moves only with sponsor approval
- [x] Scope, managed with MoSCoW so the trade-off is explicit and agreed in advance
> Correct. Something always flexes, and DSDM's contribution is naming which one and governing it formally.
</quiz>

<quiz>
What is the purpose of the Foundations phase?

- [ ] To produce a complete detailed specification before development begins
- [ ] To build the first working increment for the sponsor
- [x] To baseline scope at a high level, plus architecture and delivery approach, so that a fixed date is credible without pretending detail is knowable early
> Correct. It is the compromise that lets DSDM fix time and cost while leaving detail to emerge in the timeboxes.
- [ ] To appoint every named role in the project
</quiz>

<quiz>
Which question correctly tests whether a requirement is a Must have?

- [ ] Is it valuable to the customer?
- [x] Would we cancel the release rather than ship without it?
> Correct. Must have is about viability of the delivery, not importance or effort, which almost everything scores highly on.
- [ ] Would it be expensive to add later?
- [ ] Did a senior stakeholder request it?
</quiz>

<quiz>
Why does MoSCoW cap Must haves at around 60% of a timebox's effort?

- [x] The Should and Could haves are the contingency that absorbs estimation error, which is what makes a fixed date achievable
> Correct. With 100% Must haves there is nothing to drop, so any surprise moves the date, and the technique stops informing anything.
- [ ] Because teams are productive for only 60% of their time
- [ ] Because the remaining 40% is reserved for testing and documentation
- [ ] Because sponsors will only approve 60% of requested scope
</quiz>

<quiz>
Which DSDM role corresponds most closely to XP's on-site customer?

- [ ] Business Sponsor
- [ ] Technical Coordinator
- [ ] Team Leader
- [x] Business Ambassador
> Correct. A real user embedded in the team day to day, whose availability the method assumes rather than hopes for.
</quiz>

## Scaling and choosing

<quiz>
What should an organization address before adopting any scaling framework?

- [ ] Standardizing story point scales across teams
- [ ] Synchronizing every team to the same Sprint length
- [x] Cross-team dependencies and manual delivery, since most scaling pain is coordination created by them
> Correct. A framework laid over tangled architecture and risky releases scales the coordination overhead rather than the delivery.
- [ ] Appointing a central release manager
</quiz>

<quiz>
How do LeSS and SAFe differ most fundamentally?

- [ ] LeSS uses flow-based delivery while SAFe uses timeboxes
- [x] LeSS scales by removing structure and keeping one Product Owner and one backlog, while SAFe adds prescribed roles, layers and a planning cadence
> Correct. They sit at opposite ends of the prescriptiveness axis, which is the real decision an organization is making.
- [ ] LeSS suits regulated industries and SAFe does not
- [ ] LeSS applies only to two teams, SAFe to more
</quiz>

<quiz>
A team can only reach real users every six months because releases are manual and risky. What should change first?

- [x] The delivery pipeline, since no methodology produces agility when the feedback loop is six months long
> Correct. Sprints inside a six-month release cycle produce ceremony without the adaptation that gives the ceremony its value.
- [ ] Adopt Scrum with two-week Sprints
- [ ] Introduce velocity tracking to improve forecasts
- [ ] Adopt a scaling framework to coordinate the release
</quiz>

<quiz>
A regulated organization runs agile delivery inside a plan-driven governance wrapper. Is this viable?

- [ ] No, governance and agility are fundamentally incompatible
- [ ] Yes, but only with a relaxed Definition of Done
- [ ] No, unless the entire organization adopts SAFe
- [x] Yes, provided the wrapper does not force a full specification phase in front of every increment
> Correct. Governance and short feedback loops coexist fine. What kills the benefit is reintroducing a big up-front phase per increment.
</quiz>
