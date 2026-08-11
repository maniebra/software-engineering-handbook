# Kanban

**Kanban** is a method for managing work as a **continuous flow** rather than in
timeboxes. It came from Toyota's production system, where a *kanban* was a physical
card authorizing the next piece of work. Software Kanban keeps the core idea: **work
is pulled, never pushed**.

Kanban is not a development process. It defines no roles, no ceremonies and no
iterations. It is a set of practices layered on top of whatever a team already does,
which is why adopting it is non-disruptive.

## The core practices

1. **Visualize the workflow.** Every step from request to release becomes a column,
   and every item becomes a card. You cannot improve a process you cannot see.
2. **Limit work in progress.** Each column gets an explicit WIP limit. See
   [WIP Limits and Flow Metrics](WIP%20Limits%20and%20Flow%20Metrics.md).
3. **Manage flow.** Watch how work moves, hunt for where it waits, and reduce that.
4. **Make process policies explicit.** Write down what "ready for review" means, so
   the rules stop being folklore.
5. **Implement feedback loops.** Standups, replenishment and delivery reviews, on
   whatever cadence fits.
6. **Improve collaboratively, evolve experimentally.** Change the system in small
   measured steps, not in a reorganization.

## A board

```text
Backlog | Ready (3) | Dev (2) | Review (2) | Test (2) | Done
--------|-----------|---------|------------|----------|------
  ...   |  A  B  C  |  D  E   |  F         |  G  H    |  ...
```

The numbers are WIP limits. When Dev is full, a developer finishing an item cannot
start a new one. They go help move F out of Review instead. That is the mechanism:
limits convert individual busyness into collective flow.

## Kanban compared to Scrum

| | [Scrum](../Scrum/index.md) | Kanban |
|---|---|---|
| Cadence | Fixed Sprints | Continuous flow, optional cadences |
| Commitment | Sprint Goal per Sprint | No timebox commitment |
| Roles | Three prescribed | None prescribed |
| Change during work | Sprint scope is protected | Re-prioritize any time capacity frees up |
| Core metric | Velocity | Cycle time and throughput |
| Adoption | Replaces the current process | Starts from the current process |
| Best fit | Product development with a shared goal | Support, operations, and varied unplanned work |

Neither is stricter about quality. Both depend on the team's engineering practices.

## When Kanban fits better

- Work arrives unpredictably and cannot wait for the next Sprint, as in support,
  operations or incident response.
- Item sizes vary wildly, which makes Sprint commitments meaningless.
- The team is a service to many requesters rather than one product.
- A Scrum adoption would be too disruptive, and you want evolutionary change.

## Scrumban

Scrum's cadence and roles with Kanban's WIP limits and flow metrics. A common landing
spot for teams whose Sprint commitment keeps getting broken by urgent work, and who
want the interruptions made visible rather than pretended away.

## Check Your Understanding

<quiz>
What does a WIP limit actually change about how a team behaves?

- [x] When a column is full, finishing existing work becomes more valuable than starting new work, which pushes people to help unblock others
> Correct. The limit is what converts a board from a visualization into a control mechanism.
- [ ] It caps how many items may enter the backlog
- [ ] It sets how many items must be delivered per week
- [ ] It assigns each developer a maximum number of tasks per day
</quiz>

<quiz>
A support team handles unpredictable incidents alongside planned work. Which fits better?

- [ ] Scrum, because the Sprint Goal protects focus
- [x] Kanban, because work arrives continuously and cannot wait for the next Sprint boundary
> Correct. Sprint commitments assume work can be batched. When arrival is random and urgent, flow-based management is the better fit.
- [ ] Scrum, because velocity forecasts incident volume
- [ ] Neither, unpredictable work cannot be managed
</quiz>
