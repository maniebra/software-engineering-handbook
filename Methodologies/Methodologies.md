# Methodologies

A **methodology** is the set of values, roles, events and practices a team uses to
turn requirements into working software. A [process model](../Process%20Models/Waterfall%20Model.md)
describes the *shape* of the work (phases, ordering, feedback points), and a methodology
describes *how a team actually works day to day* inside that shape.

## The families

| Family | Core bet | Typical cadence | Notes |
|---|---|---|---|
| [Agile](Agile/index.md) | Change is cheaper to absorb than to prevent | Weeks | An umbrella of values and principles, not a process |
| [Scrum](Scrum/index.md) | Fixed-length timeboxes create rhythm and feedback | 1–4 week Sprints | Roles, events, artifacts are prescribed |
| [Extreme Programming](Extreme%20Programming/index.md) | Engineering discipline drives agility | Days to weeks | Prescribes technical practices (TDD, pairing, CI) |
| [DSDM](DSDM/index.md) | Time and cost are fixed, scope flexes | Timeboxes | Business-focused, formal governance |

Scrum, XP and DSDM are all *agile* methodologies: they are concrete instances of the
values described in [The Definition of Agility](Agile/The%20Definition%20of%20Agility.md).
Teams routinely mix them, taking Scrum for the management frame and XP for the engineering
practices.

## Choosing one

- **Requirements are volatile, customer is available** → Agile family.
- **Small, co-located, quality-critical team** → XP practices.
- **Deadline and budget are immovable** → DSDM, drop scope instead of slipping.
- **Requirements are stable, regulated, contract-bound** → a plan-driven
  [process model](../Process%20Models/Waterfall%20Model.md) is often the safer fit.

## Check Your Understanding

<quiz>
What is the difference between a process model and a methodology?

- [ ] They are the same thing under two names
- [x] A process model describes the ordering of phases and feedback, and a methodology describes how a team works day to day inside it
> Correct. The Incremental Model says "deliver in increments". Scrum says who is in the room, for how long, and with which artifacts.
- [ ] A methodology only applies to agile teams, a process model only to plan-driven teams
- [ ] A process model is documentation, a methodology is code
</quiz>
