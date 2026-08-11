# Estimation and Velocity

Agile estimation exists to support **forecasting**, not to measure people. Every
technique below is worthless the moment velocity becomes a performance target.

## Story points

A story point is a **relative** measure combining effort, complexity and uncertainty.
Relative sizing is used because humans are far better at "this is about twice that"
than at "this will take 11 hours".

The Fibonacci-like scale (1, 2, 3, 5, 8, 13, 20, 40, 100) widens deliberately: as
items get bigger, precision is a fiction, so the scale stops pretending.

Anything above 13 is usually a signal to split the story rather than to estimate it.

## Planning Poker

1. The Product Owner reads the item.
2. Everyone picks a card privately.
3. All cards are revealed at once.
4. The high and low estimates explain their reasoning.
5. Re-estimate until the group converges.

The value is in step 4. Divergent estimates almost always mean the team has different
understandings of the item, and finding that out before the Sprint is the entire
point. The number is a by-product of the conversation.

## Velocity

Velocity is the number of story points a team completes per Sprint, averaged over the
last few Sprints. Its only legitimate use is forecasting:

```text
remaining backlog = 240 points
average velocity  =  30 points / Sprint
forecast          =  8 Sprints, plus or minus, and re-checked every Sprint
```

| Legitimate use | Abuse |
|---|---|
| Forecasting a release range | Comparing two teams |
| Spotting a sudden drop worth discussing in a Retrospective | Setting a velocity target |
| Sizing how much to pull into Sprint Planning | Tying velocity to individual performance reviews |

Velocity is team-specific and unit-free. Comparing teams by velocity is like comparing
two currencies by the number printed on the notes. Worse, any velocity target is
trivially met by inflating estimates, so the metric destroys itself the moment it is
used as a goal.

## Burndown and burnup

- **Burndown** shows work remaining against time. Simple, but a flat line is ambiguous
  because it hides whether work was added or simply not finished.
- **Burnup** plots completed work and total scope as two lines, so scope growth is
  visible instead of hidden. Prefer it for release-level tracking.

## Alternatives

- **#NoEstimates**: count stories instead of points. Works when the team splits stories
  to a consistently small size, and removes the estimation overhead entirely.
- **T-shirt sizes**: S, M, L, XL for coarse, longer-range planning.
- **Cycle time**: measure how long items actually take, empirically, and forecast from
  the distribution. This is the [Kanban](../Kanban/index.md) approach and it needs no
  estimates at all.

## Check Your Understanding

<quiz>
Why are story points relative rather than in hours?

- [x] People estimate relative size far more reliably than absolute duration, and relative units also avoid being read as a commitment of hours
> Correct. Points measure size, and velocity converts size into a time forecast empirically, using the team's own history.
- [ ] Because hours cannot be summed across a team
- [ ] Because managers are not allowed to see time estimates
- [ ] Because relative estimates are always more accurate in absolute terms
</quiz>

<quiz>
A manager sets a target of increasing velocity by 20%. What happens?

- [ ] The team delivers 20% more value
- [ ] Cycle time drops proportionally
- [x] Estimates inflate to meet the target, and velocity stops describing anything real
> Correct. Velocity is a unit-free, team-local forecasting input. Turning it into a goal makes it trivially gameable and destroys its forecasting use.
- [ ] The Definition of Done gets stricter
</quiz>

<quiz>
Why is a burnup chart usually preferred over a burndown chart for release tracking?

- [ ] It is easier for the team to update
- [ ] It shows individual contributions
- [x] It plots scope as its own line, so added scope is visible rather than hidden inside a flat remaining-work line
> Correct. On a burndown, "nothing got done" and "as much was added as was finished" look identical.
- [ ] It removes the need to estimate items
</quiz>
