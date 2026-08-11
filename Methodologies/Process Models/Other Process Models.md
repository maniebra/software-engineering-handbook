- Component based development (CBD): the process to apply when reuse is a development objective.
- Formal methods: emphasizes the mathematical specification of requirements
- Aspect-oriented Software Design (AOSD): provides a process and methodological approach for defining, specifying, designing, and constructing aspects

## The Spiral Model

Risk-driven and iterative. Each loop covers four activities, and the spiral grows
outward as more is committed.

```mermaid
graph LR
    O[1. Determine objectives and constraints] --> R[2. Identify and resolve risks]
    R --> D[3. Develop and verify this loop's deliverable]
    D --> P[4. Plan the next loop]
    P --> O
```

The distinctive step is 2. Each loop attacks the highest remaining risk first, so an
unbuildable idea fails early and cheaply rather than at acceptance testing.

## Prototyping

```mermaid
graph LR
    RQ[Rough requirements] --> PR[Build a prototype]
    PR --> EV[User evaluates it]
    EV -->|refine| PR
    EV -->|understood| BUILD[Build the real system]
```

The risk is obvious and common: a prototype gets shipped as a product, and its
throwaway internals become the production codebase.
