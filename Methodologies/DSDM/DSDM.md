# DSDM

**DSDM** (Dynamic Systems Development Method) is an [agile](../Agile/index.md)
methodology that predates the Agile Manifesto. Its distinguishing bet: **time, cost and
quality are fixed, and scope is the variable**. A DSDM project never slips its date, it
drops lower-priority requirements instead.

## The principles

- Active user involvement is imperative.
- DSDM teams must be empowered to make decisions.
- The focus is on frequent delivery of products.
- Fitness for business purpose is the essential criterion for acceptance of deliverables.
- Iterative and incremental development is necessary to converge on an accurate business solution.
- All changes during development are reversible.
- Requirements are baselined at a high level.
- Testing is integrated throughout the life-cycle.
- Collaboration and cooperation between all stakeholders is essential.

## MoSCoW prioritization

Fixing the date only works if priorities are explicit. DSDM's contribution to the wider
industry is **MoSCoW**:

| Category | Meaning | Budget guidance |
|---|---|---|
| **Must have** | Without it, the delivery is useless or illegal | ≤ 60% of effort |
| **Should have** | Painful to leave out, but there is a workaround | ~20% |
| **Could have** | Desirable, dropped first when time runs short | ~20% |
| **Won't have (this time)** | Explicitly out of scope for this timebox | 0% |

Keeping *Must haves* at 60% or less is what leaves the contingency that makes a fixed
date credible. If everything is a Must have, the date is a wish.

## Timeboxes

Work is delivered in fixed timeboxes, each ending with something that is *fit for
business purpose*, DSDM's acceptance criterion, deliberately weaker than
"perfect" and stronger than "demo-able".

"All changes during development are reversible" is what makes exploratory work safe:
a timebox that goes the wrong way can be rolled back rather than defended.

## Pages in this section

- [MoSCoW Prioritization](MoSCoW.md), the technique that makes a fixed date credible.
- [DSDM Phases and Roles](DSDM%20Phases%20and%20Roles.md), the lifecycle and who decides what.

## Compared to the others

| | DSDM | [Scrum](../Scrum/index.md) | [XP](../Extreme%20Programming/index.md) |
|---|---|---|---|
| Fixed | Time, cost, quality | Time (Sprint length) | Time (iteration) |
| Variable | Scope, via MoSCoW | Scope of the Sprint | Scope of the iteration |
| Emphasis | Business governance | Team process | Engineering practices |
| Documentation | Prescribed products and roles | Minimal | Minimal, tests as spec |

## Check Your Understanding

<quiz>
A DSDM timebox will not fit all its planned requirements. What gives?

- [ ] The date, which is extended until the Must haves are complete
- [x] Scope, the Could haves are dropped first, and the delivery date holds
> Correct. DSDM fixes time, cost and quality, so scope is the only remaining variable. MoSCoW decides the order things fall out.
- [ ] Quality, by deferring testing to a later timebox
- [ ] Cost, by adding developers to the timebox
</quiz>

<quiz>
Why does DSDM cap "Must have" items at roughly 60% of the effort in a timebox?

- [ ] Because teams are only productive 60% of the time
- [ ] Because the user representative reviews only 60% of the work
- [x] The remaining Should/Could haves are the contingency that lets the fixed date absorb estimation error
> Correct. With 100% Must haves there is nothing left to drop, and the fixed date becomes unachievable on any surprise.
- [ ] Because the remaining 40% is reserved for documentation
</quiz>

## Assessment

Work through the [Practices and Governance assessment](../../Assessments/Methodologies/XP%20DSDM%20and%20Scaling%20Quiz.md) once you have read this section.
