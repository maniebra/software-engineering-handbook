# Scrum Artifacts

Scrum has three artifacts, and each carries one **commitment** that makes it
measurable. Without the commitment, the artifact is just a list.

| Artifact | Commitment | Owned by |
|---|---|---|
| Product Backlog | Product Goal | Product Owner |
| Sprint Backlog | Sprint Goal | Developers |
| Increment | Definition of Done | Developers |

## Product Backlog

The single, ordered list of everything that might be needed in the product. Key
properties:

- **Ordered, not prioritized into buckets.** There is exactly one next item.
- **Emergent.** It changes as the product and market are understood.
- **Refined continuously.** Items near the top are small and clear, items further down
  can stay vague. This is the classic "iceberg" shape.

Items are usually written as [user stories](../Agile/User%20Stories.md), though Scrum
does not require any particular format.

The **Product Goal** is the long-term objective the backlog is working toward, a
target the team can aim several Sprints at.

## Sprint Backlog

The Sprint Goal, plus the items chosen for the Sprint, plus the plan for delivering
them. It belongs entirely to the Developers, who update it daily as they learn.

It is not a contract with stakeholders. It is the Developers' own working plan, and
scope inside it is expected to be renegotiated with the Product Owner as reality
lands.

## Increment

A concrete step toward the Product Goal. Multiple Increments can be created in one
Sprint, and an Increment is usable the moment it meets the **Definition of Done**.
Work that does not meet it is not part of the Increment, is not shown at the Review,
and is not counted as done.

## Transparency and its failures

| Failure | Consequence |
|---|---|
| Backlog nobody has refined | Sprint Planning becomes a discovery session and runs long |
| Sprint Backlog kept in someone's head | The team cannot self-manage against it |
| "Done except for testing" | Undone work accumulates as invisible debt, and forecasts stop meaning anything |
| Two competing backlogs from two stakeholders | The team, not the Product Owner, ends up deciding priority |

## Check Your Understanding

<quiz>
Why is the Product Backlog ordered rather than grouped into priority buckets?

- [ ] Because tooling cannot represent priority levels
- [ ] Because stakeholders are not allowed to compare items
- [x] Because an ordered list always answers "what is next", while ten items all marked "high" answer nothing
> Correct. Ordering forces the Product Owner to make the trade-off explicitly rather than deferring it to the team.
- [ ] Because Scrum forbids estimating items
</quiz>

<quiz>
Work is finished but untested at the end of the Sprint. Is it part of the Increment?

- [x] No, work that does not meet the Definition of Done is not in the Increment and returns to the Product Backlog
> Correct. Counting undone work as done is how invisible technical debt and unreliable forecasts get created.
- [ ] Yes, as long as it is demonstrated at the Sprint Review
- [ ] Yes, if the Product Owner accepts it verbally
- [ ] Only if the tests are written in the following Sprint
</quiz>
