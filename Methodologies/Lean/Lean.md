# Lean Software Development

**Lean** adapts the Toyota Production System to software. Where
[Scrum](../Scrum/index.md) prescribes a team process and
[XP](../Extreme%20Programming/index.md) prescribes engineering practices, Lean is a set
of **thinking tools** aimed at the whole value stream, from idea to production.

Its central question is not "how fast is the team", it is "how much of what we do
actually produces value for a customer".

## The seven principles

| Principle | Meaning |
|---|---|
| **Eliminate waste** | Anything that does not add customer value is waste |
| **Build quality in** | Do not inspect defects out at the end, prevent them at the source |
| **Create knowledge** | Development is a learning process, so keep learning cheap and fast |
| **Defer commitment** | Decide at the last responsible moment, when you know the most |
| **Deliver fast** | Short cycle times reduce risk and inventory |
| **Respect people** | The people doing the work design the work |
| **Optimize the whole** | Local optimums usually make the whole system worse |

## The seven wastes of software

| Manufacturing waste | Software equivalent |
|---|---|
| Inventory | Partially done work, unmerged branches, unreleased features |
| Over-production | Features nobody asked for, speculative generality |
| Extra processing | Unnecessary documents, re-entering data, ceremony without value |
| Transportation | Handoffs between specialists and teams |
| Waiting | Waiting for approval, review, environments, or another team |
| Motion | Task switching, hunting for information |
| Defects | Bugs, and the rework they cause |

Partially done work is the expensive one. It has consumed cost, produced no value, and
can be invalidated at any moment by a change in priority.

## The last responsible moment

Deferring commitment is not procrastination. It is deciding when the cost of deciding
later first exceeds the value of the information you would gain by waiting.

Choosing a database on day one commits you before you know the access patterns.
Choosing it after the first production traffic is often cheaper, provided the code was
written so the decision stays reversible. This is the same argument behind
[Hexagonal Architecture](../../Software%20Architecture/Architectural%20Patterns/Hexagonal.md).

## Optimize the whole

The classic failure: a team is measured on how many features it ships, so it ships
fast and leaves operations to absorb the defects. Local throughput rose, and total
delivered value fell. Optimizing the whole means measuring the flow from customer
request to working software, not the productivity of one station in the line.

## Lean and Kanban

[Kanban](../Kanban/index.md) is the practical implementation of much of Lean thinking:
visualize the value stream, limit inventory, measure flow, and improve the system in
small experiments.

## Check Your Understanding

<quiz>
Why is partially done work considered the most expensive waste in software?

- [ ] Because it is difficult to estimate
- [ ] Because it blocks other developers from committing
- [x] Because it has already consumed cost, produced no value yet, and can still be invalidated by a change in priority
> Correct. It is inventory. Reducing work in progress is therefore a direct attack on the most expensive category of waste.
- [ ] Because it always contains more defects than finished work
</quiz>

<quiz>
"Defer commitment to the last responsible moment" means what in practice?

- [ ] Delay decisions until someone escalates them
- [x] Make each decision at the point where waiting longer would cost more than the information gained by waiting
> Correct. It is a deliberate trade of information against the cost of delay, not an excuse to avoid deciding.
- [ ] Never make architectural decisions up front under any circumstances
- [ ] Let the customer make all technical decisions
</quiz>

<quiz>
A team doubles its feature throughput, and production incidents triple. Which Lean principle was violated?

- [ ] Respect people
- [ ] Create knowledge
- [x] Optimize the whole, since local throughput improved while total delivered value fell
> Correct. Optimizing one station and pushing the cost downstream is the classic local optimum.
- [ ] Defer commitment
</quiz>

## Assessment

Work through the [Flow, Kanban and Lean assessment](../../Assessments/Methodologies/Kanban%20and%20Lean%20Quiz.md) once you have read this section.
