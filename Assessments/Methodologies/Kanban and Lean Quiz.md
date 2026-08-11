# Flow: Kanban and Lean Quiz

14 questions covering [Kanban](../../Methodologies/Kanban/index.md),
[WIP limits and flow metrics](../../Methodologies/Kanban/WIP%20Limits%20and%20Flow%20Metrics.md)
and [Lean software development](../../Methodologies/Lean/index.md).

## Kanban practices

<quiz>
Which statement about Kanban is true?

- [x] It prescribes no roles, no iterations and no ceremonies, and starts from whatever process the team already runs
> Correct. That non-disruptive starting point is why Kanban adoptions often survive where a full process replacement would be rejected.
- [ ] It replaces the existing process with a defined set of roles and events
- [ ] It requires all work items to be the same size
- [ ] It forbids any form of planning cadence
</quiz>

<quiz>
"Make process policies explicit" exists to fix which problem?

- [ ] Teams forgetting to update the board
- [ ] Managers not understanding story points
- [ ] Items being pulled in the wrong priority order
- [x] Rules such as what "ready for review" means living as folklore, so each person applies a different standard
> Correct. Undocumented policies cannot be inspected, and therefore cannot be improved deliberately.
</quiz>

<quiz>
A developer finishes an item, and the Dev column is at its WIP limit. What should they do?

- [ ] Start the next backlog item anyway, since idle time is waste
- [ ] Ask the Product Owner to raise the WIP limit
- [x] Help move an item out of a downstream column, since finishing work now outranks starting work
> Correct. This is the mechanism by which limits convert individual busyness into collective flow.
- [ ] Split the next item so it fits within the limit
</quiz>

<quiz>
A team sets WIP limits so generous that nothing ever blocks. What is wrong?

- [ ] Nothing, an unblocked board is the goal
- [x] The limits are too loose to reveal bottlenecks, which is the reason for having them
> Correct. The point of a limit is that hitting it makes a queue visible. A limit that never binds teaches nothing.
- [ ] Throughput will drop because people are idle
- [ ] Cycle time cannot be measured without blocking
</quiz>

<quiz>
When is Kanban a better fit than Scrum?

- [x] When work arrives unpredictably and cannot wait for the next Sprint boundary, as in support or operations
> Correct. Sprint commitments assume work can be batched, and randomly arriving urgent work breaks that assumption every Sprint.
- [ ] When the team wants stronger commitment to a shared goal
- [ ] When items are uniform in size and well understood
- [ ] When the organization wants to replace its current process wholesale
</quiz>

## Flow metrics

<quiz>
A team has 24 items in progress and completes 6 per week. What is the average cycle time?

- [ ] 6 weeks, since throughput divides the week
- [ ] 24 weeks, one per item in progress
- [ ] It cannot be derived from these two numbers
- [x] 4 weeks, because cycle time equals work in progress divided by throughput
> Correct. This is Little's Law, and it is why cutting WIP shortens delivery without anyone working faster.
</quiz>

<quiz>
Which pair of numbers describes what a customer experiences?

- [ ] Throughput and work in progress
- [ ] Cycle time and flow efficiency
- [x] Lead time, measured from request to delivery including the backlog wait
> Correct. Cycle time starts when work begins, so it hides the queue the customer was actually waiting in.
- [ ] Velocity and Sprint length
</quiz>

<quiz>
A team measures 15% flow efficiency. What does that indicate?

- [ ] The team is working at 15% of its capacity
- [x] Items spend roughly 85% of their cycle time waiting rather than being worked on
> Correct. Which means removing queues will usually shorten delivery far more than adding people.
- [ ] 15% of items miss their target date
- [ ] Only 15% of the backlog has been estimated
</quiz>

<quiz>
On a cumulative flow diagram, a band that steadily widens over time means what?

- [x] A queue is growing in that state, which locates a bottleneck
> Correct. The vertical thickness of a band is the work in progress in that state, so a widening band is accumulating inventory.
- [ ] The team's throughput is increasing
- [ ] Items in that state are being completed faster than they arrive
- [ ] The Definition of Done was tightened
</quiz>

<quiz>
Which forecast does a cycle time scatterplot support best?

- [ ] "This item will take exactly four days"
- [ ] "The team will complete 35 points next Sprint"
- [ ] "Every item is delivered within two weeks"
- [x] "85% of comparable items have completed within 11 days"
> Correct. Historical distributions support probabilistic statements, which carry their uncertainty visibly instead of hiding it in one number.
</quiz>

## Lean

<quiz>
Which is the software equivalent of manufacturing inventory?

- [ ] Automated test suites
- [ ] Documentation written during development
- [x] Partially done work, such as unmerged branches and unreleased features
> Correct. It has consumed cost, delivered no value, and can still be invalidated by a change in priority.
- [ ] Defects found in production
</quiz>

<quiz>
"Deferring commitment to the last responsible moment" means what?

- [ ] Delaying every decision until someone escalates it
- [x] Deciding at the point where waiting any longer costs more than the information waiting would gain
> Correct. It is a deliberate trade of information against the cost of delay, and it depends on keeping the decision reversible in the meantime.
- [ ] Never making architectural decisions before implementation
- [ ] Letting the customer make all technical decisions
</quiz>

<quiz>
A delivery team is measured only on features shipped per quarter. Incidents in production triple. Which Lean principle was violated?

- [x] Optimize the whole, since a local throughput gain pushed cost downstream and reduced total delivered value
> Correct. Measuring one station in the line is the classic route to a local optimum that damages the system.
- [ ] Respect people
- [ ] Defer commitment
- [ ] Create knowledge
</quiz>

<quiz>
Which Lean waste do handoffs between specialist teams most directly represent?

- [ ] Over-production
- [ ] Defects
- [ ] Extra processing
- [x] Transportation, along with the waiting that each handoff creates
> Correct. Every handoff adds a queue and loses context, which is why Lean favors cross-functional teams that own work end to end.
</quiz>
