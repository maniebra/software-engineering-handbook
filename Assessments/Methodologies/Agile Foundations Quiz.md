# Agile Foundations Quiz

16 questions covering the [Agile](../../Methodologies/Agile/index.md) values and
principles, agility itself, [user stories](../../Methodologies/Agile/User%20Stories.md),
[estimation](../../Methodologies/Agile/Estimation%20and%20Velocity.md) and
[anti-patterns](../../Methodologies/Agile/Agile%20Anti-patterns.md).

## Values and principles

<quiz>
The Agile Manifesto values "responding to change over following a plan". What does the phrase "over" mean here?

- [x] Both have value, and when the two conflict, the left-hand item wins
> Correct. The manifesto states this explicitly in its closing line, which is the part most often dropped when it is quoted.
- [ ] The right-hand item has no value in agile projects
- [ ] The left-hand item replaces the right-hand item entirely
- [ ] The team may choose either, depending on the Sprint
</quiz>

<quiz>
Which of the four values is most directly violated by a team that communicates only through a ticketing system?

- [ ] Working software over comprehensive documentation
- [ ] Customer collaboration over contract negotiation
- [ ] Responding to change over following a plan
- [x] Individuals and interactions over processes and tools
> Correct. This is also principle 6, which names face-to-face conversation as the most efficient method of conveying information.
</quiz>

<quiz>
Agile principle 10 says "simplicity, the art of maximizing the amount of work not done, is essential." What practice does it most directly justify?

- [ ] Writing detailed specifications before coding
- [ ] Adding configuration options for every foreseeable variation
- [x] YAGNI, building only what is needed now instead of speculative flexibility
> Correct. Simple design in XP applies exactly this principle at the code level.
- [ ] Documenting every class and method
</quiz>

<quiz>
A team maintains a constant pace with no overtime, but delivers no working software for four months. Which principle is being violated?

- [ ] Principle 8, sustainable development
- [x] Principle 1 and 3, early and continuous delivery of valuable software
> Correct. Sustainable pace is necessary but not sufficient. The measure of progress is working software delivered frequently.
- [ ] Principle 11, self-organizing teams
- [ ] Principle 5, motivated individuals
</quiz>

## Agility

<quiz>
Which statement best describes agility?

- [x] The ability to respond to change effectively, both rapidly and adaptively, with the customer inside the team
> Correct. Speed without adaptation is just fast delivery of possibly wrong software.
- [ ] The ability to deliver software faster than competitors
- [ ] The absence of documentation and up-front planning
- [ ] The practice of working in two-week iterations
</quiz>

<quiz>
Why does short-iteration delivery make "welcome changing requirements" economically viable?

- [ ] Because customers change their minds less often when releases are frequent
- [ ] Because estimates become accurate in short cycles
- [ ] Because short iterations reduce the total amount of work required
- [x] Because short increments, automated tests and continuous integration flatten the cost-of-change curve
> Correct. In a plan-driven process a late change ripples through artifacts finished long ago, which is what makes late change expensive.
</quiz>

<quiz>
An agile process "recognizes that plans are short-lived." What follows from that?

- [ ] Planning is skipped so the team can start building sooner
- [ ] Only the Product Owner is permitted to plan
- [x] Plans are made, then revised as each increment reveals new information
> Correct. Planning is continuous rather than absent, which is a distinction cargo cult adoptions usually lose.
- [ ] Plans are replaced by estimates in story points
</quiz>

## User stories

<quiz>
Which part of a user story is most often dropped, and why does it matter?

- [ ] The "As a" clause, which identifies the user
- [x] The "so that" clause, because without the underlying need the team cannot propose a cheaper or better solution
> Correct. Losing the reason quietly turns a negotiable story into a fixed specification.
- [ ] The "I want" clause, which states the feature
- [ ] The acceptance criteria, which define testability
</quiz>

<quiz>
In INVEST, what does "Negotiable" mean?

- [x] The story describes a need rather than a prescribed implementation, so how it is built remains open
> Correct. It is the property that lets developers offer alternatives that meet the same need for less cost.
- [ ] The delivery date for the story can be moved
- [ ] The estimate can be revised by the team
- [ ] Priority can be traded with the Product Owner
</quiz>

<quiz>
Which is a valid split of a story that is too large?

- [ ] "Build the backend" and "build the frontend"
- [ ] "Write the code" and "write the tests"
- [ ] "Design the schema" and "populate the tables"
- [x] "Search by product name" and "search with filters and sorting"
> Correct. Splitting by behavior keeps each part independently valuable, which is what makes it releasable.
</quiz>

<quiz>
Where do cross-cutting requirements such as a latency budget or a compliance rule belong?

- [ ] In a user story written from the perspective of an attacker
- [ ] In the Sprint Goal for the Sprint that introduces them
- [x] In the Definition of Done or a separate constraints document, since they apply to every item rather than one
> Correct. Forcing a global constraint into a single story means it stops being enforced as soon as that story is closed.
- [ ] In the acceptance criteria of the first story that touches them
</quiz>

## Estimation

<quiz>
Why does the story point scale widen as values grow (1, 2, 3, 5, 8, 13, 20)?

- [ ] Because larger stories are always exactly twice as risky
- [x] Because precision is a fiction for large items, so the scale stops offering it
> Correct. It also nudges teams to split anything above 13 rather than estimate it more carefully.
- [ ] Because the Fibonacci sequence models developer productivity
- [ ] Because it makes velocity easier to compute
</quiz>

<quiz>
What is the actual value of Planning Poker?

- [x] Divergent estimates reveal that team members understand the item differently, which is discovered before the Sprint rather than during it
> Correct. The number is a by-product. The conversation triggered by disagreement is the deliverable.
- [ ] It produces the most accurate possible estimate
- [ ] It prevents senior developers from dominating the discussion permanently
- [ ] It converts story points into hours reliably
</quiz>

<quiz>
Two teams report velocities of 20 and 60. What can you conclude?

- [ ] The second team is three times more productive
- [ ] The second team has three times more developers
- [ ] The first team has a stricter Definition of Done
- [x] Nothing, because story points are unit-free and team-local, so the numbers are not comparable
> Correct. Comparing velocities is like comparing currencies by the number printed on the notes.
</quiz>

<quiz>
A burndown chart has been flat for a week. What are the two possible explanations?

- [ ] The team is blocked, or the chart is not being updated
- [ ] Estimates were too low, or the Sprint Goal changed
- [x] Nothing was completed, or as much scope was added as was completed
> Correct. A burndown cannot distinguish the two, which is why a burnup plotting scope separately is preferred for release tracking.
- [ ] The Definition of Done was tightened, or testing is late
</quiz>

## Anti-patterns

<quiz>
Which of these is the clearest symptom of Water-Scrum-Fall?

- [ ] The team holds a Retrospective only once a month
- [x] A long requirements phase up front and a hardening phase at the end, with Sprints only in the middle
> Correct. The team is agile only in the part of the process that was never the bottleneck, so the first Increment still reaches users months late.
- [ ] Velocity varies significantly between Sprints
- [ ] The Product Owner attends the Daily Scrum
</quiz>
