# Agile Principles

The twelve principles behind the [Agile Manifesto](index.md). They are the bridge
between the four abstract values and the concrete practices of
[Scrum](../Scrum/index.md), [XP](../Extreme%20Programming/index.md) and
[DSDM](../DSDM/index.md).

## Delivery

1. Our highest priority is to satisfy the customer through early and continuous delivery of valuable software.
2. Welcome changing requirements, even late in development. Agile processes harness change for the customer's competitive advantage.
3. Deliver working software frequently, from a couple of weeks to a couple of months, with a preference to the shorter timescale.

## Collaboration

4. Business people and developers must work together daily throughout the project.
5. Build projects around motivated individuals. Give them the environment and support they need, and trust them to get the job done.
6. The most efficient and effective method of conveying information to and within a development team is face-to-face conversation.

## Progress and pace

7. Working software is the primary measure of progress.
8. Agile processes promote sustainable development. The sponsors, developers, and users should be able to maintain a constant pace indefinitely.

## Craft

9. Continuous attention to technical excellence and good design enhances agility.
10. Simplicity, the art of maximizing the amount of work not done, is essential.

## Self-organization

11. The best architectures, requirements, and designs emerge from self-organizing teams.
12. At regular intervals, the team reflects on how to become more effective, then tunes and adjusts its behavior accordingly.

## Where each principle shows up

| Principle | Practice that implements it |
|---|---|
| 1, 3: frequent delivery | [Sprints](../Scrum/Sprints.md), [small releases](../Extreme%20Programming/index.md) |
| 2: welcome change | Product Backlog re-prioritized every Sprint |
| 4: daily collaboration | [On-site customer](../Extreme%20Programming/index.md), [Product Owner](../Scrum/Roles%20in%20Scrum.md) |
| 7: working software as measure | Definition of Done, Sprint Review |
| 9, 10: excellence and simplicity | TDD, refactoring, continuous integration |
| 12: reflect and adjust | Sprint Retrospective |

## Check Your Understanding

<quiz>
Principle 7 says "working software is the primary measure of progress." What does it rule out as a progress metric?

- [x] Percentage of phases or documents completed, when nothing runs yet
> Correct. A finished design document is not progress until it produces software that works.
- [ ] Counting the number of automated tests
- [ ] Demonstrating an increment to stakeholders
- [ ] Releasing to a subset of users
</quiz>

<quiz>
Principle 8 asks for a "constant pace indefinitely." Which practice violates it?

- [ ] Keeping Sprints the same length every time
- [x] Absorbing every mid-Sprint scope addition through overtime
> Correct. Sustainable pace means scope flexes, not the people. Sprint scope is fixed once the Sprint starts.
- [ ] Refactoring code as part of normal work
- [ ] Letting the team pull its own work in Sprint Planning
</quiz>
