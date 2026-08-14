# Strategic DDD

**Strategic design** is the half of [DDD](../index.md) that decides *where the
boundaries go* and *what deserves effort*. It operates above the code, on the scale of
teams, systems and business capability.

It is also the half that matters most. Tactical patterns applied inside a wrong boundary
produce a well-crafted model that still resists every change, while a system with
correct boundaries and mediocre internals can be improved one context at a time.

## Two questions

| Question | Tool |
|---|---|
| Where does one model stop and another begin? | [Bounded Contexts](Bounded%20Contexts.md), and the [Context Map](Context%20Maps.md) recording how they relate |
| Which parts of the business justify the investment? | [Subdomains](Subdomains.md), split into [Core](Core%20Domain.md) and [Supporting and Generic](Supporting%20and%20Generic%20Domains.md) |

The two are different lenses on the same system. A **subdomain** is a part of the
*problem space*, meaning the business as it exists. A **bounded context** is a part of
the *solution space*, meaning a boundary you chose to draw in software.

```mermaid
graph TD
    subgraph Problem space, the business
        SD1[Core subdomain]
        SD2[Supporting subdomain]
        SD3[Generic subdomain]
    end
    subgraph Solution space, the software
        BC1[Bounded context A]
        BC2[Bounded context B]
        BC3[Bought product]
    end
    SD1 --> BC1
    SD2 --> BC2
    SD3 --> BC3
```

Aim for one context per subdomain. Where they diverge, usually because a legacy system
spans three subdomains, that mismatch is exactly where the pain is, and naming it is the
first step to fixing it.

## Why boundaries beat models

An enterprise-wide "one true model" fails predictably. Every team needs one more field,
every change risks every consumer, and the vocabulary becomes so generic that nobody
recognises their own business in it. Bounded contexts accept that unification is the
wrong goal, and make translation between models explicit instead.

The same reasoning drives service boundaries: contexts are the most defensible way to
split [microservices](../../Architectural%20Patterns/Microservice%20Architecture.md),
because they align with how the business changes rather than with technical layers.

## Contexts and teams

Conway's law applies in both directions. A context maintained by three teams drifts
until it is really three models sharing a schema, and a team owning five contexts starts
merging them for convenience. The workable default is **one team owning one or more
whole contexts**, and never a context split across teams.

## Where to start

1. Talk to domain experts and listen for terms that mean different things to different
   groups. Those are candidate boundaries.
2. Identify the [core domain](Core%20Domain.md), because that is where the modelling
   budget goes.
3. Draw the [context map](Context%20Maps.md), including the political relationships, not
   just the protocols.
4. Only then open an editor.

## Check Your Understanding

<quiz>
What is the difference between a subdomain and a bounded context?

- [ ] They are two names for the same thing
- [x] A subdomain is a part of the problem space, meaning the business itself, while a bounded context is a boundary you draw in the solution space, meaning the software
> Correct. Ideally they line up one to one, and where they do not, the mismatch usually marks the painful part of the system.
- [ ] A subdomain is a microservice, a bounded context is a module
- [ ] A bounded context exists before the software is written, a subdomain after
</quiz>

<quiz>
Why is strategic design considered more important than the tactical patterns?

- [ ] Because it requires less code
- [x] Because boundaries are expensive and disruptive to change later, while the internals of one context can be refactored incrementally
> Correct. Aggregates inside the wrong context still leave a system that fights every change.
- [ ] Because tactical patterns are optional in every project
- [ ] Because only strategic design applies to distributed systems
</quiz>
