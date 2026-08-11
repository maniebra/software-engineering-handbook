# Definition of Done

The **Definition of Done** (DoD) is the shared, explicit checklist that turns "I
finished coding" into "this is releasable". It is the commitment attached to the
[Increment](Scrum%20Artifacts.md), and it is the single most effective defence against
accumulating invisible work.

## A worked example

```text
An item is Done when:
  [ ] Code reviewed and merged to main
  [ ] Unit and integration tests written and passing in CI
  [ ] No new static-analysis or security warnings
  [ ] Documentation and API reference updated
  [ ] Feature flag configured, with a rollback path
  [ ] Deployed to staging and verified against acceptance criteria
  [ ] Product Owner has seen it working
```

Notice what is not on the list: "developer says it works". Every line is verifiable by
someone other than its author.

## Rules of thumb

- **One DoD per team, at minimum.** If several teams work on one product, the DoD is
  the product's, and teams may add to it but never subtract.
- **It only tightens over time.** As automation improves, items move from the DoD into
  the pipeline and new quality bars take their place.
- **It is not the acceptance criteria.** Acceptance criteria are per item and describe
  *what* the feature must do. The DoD is global and describes *how finished* any item
  must be.

## Definition of Ready

Some teams keep a mirror-image checklist for items entering a Sprint: estimated, small
enough, dependencies known, acceptance criteria written. Useful as a guideline,
dangerous as a gate, because a strict Definition of Ready quietly recreates a
requirements phase in front of every Sprint.

## Undone work

Whatever the DoD leaves out does not disappear, it accumulates. A team whose DoD
excludes performance testing is building a debt that will be paid in a hardening
Sprint, which is exactly the phase-based delivery Scrum was meant to replace.

## Check Your Understanding

<quiz>
What is the difference between acceptance criteria and the Definition of Done?

- [ ] They are the same checklist under two names
- [x] Acceptance criteria are per item and describe what it must do, while the Definition of Done is global and describes how finished any item must be
> Correct. One is about behavior, the other is about quality and completeness across every item.
- [ ] Acceptance criteria are written by the team, the Definition of Done by stakeholders
- [ ] The Definition of Done applies only at release time
</quiz>

<quiz>
A team's Definition of Done excludes performance testing to move faster. What is the predictable result?

- [ ] Velocity becomes more accurate over time
- [ ] Nothing, as long as stakeholders accept the Increments
- [ ] The Product Owner takes over performance testing
- [x] Undone work accumulates until a hardening phase is needed, reintroducing the phase-based delivery Scrum was meant to remove
> Correct. Excluded work is deferred, never cancelled, and it comes back at a worse exchange rate.
</quiz>
