# Interoperability

Interoperability is the system's ability to exchange information and work correctly with other systems: internal services, partner APIs, legacy platforms, regulators, including systems you do not control and cannot change.

### Levels of interoperability

1. **Technical**: the systems can connect at all (protocol, transport, encoding).
2. **Syntactic**: they agree on message structure (JSON schema, Protobuf, XML).
3. **Semantic**: they agree on what fields *mean* (is `amount` in cents? is `date` the order date or the ship date? which time zone?).
4. **Organisational**: processes, ownership, and support agreements line up.

Most costly integration failures are semantic, not technical. Two systems both speaking valid JSON over HTTPS can still corrupt a ledger.

### Design tactics

- **Publish an explicit contract.** OpenAPI, AsyncAPI, Protobuf, or JSON Schema, machine-readable, versioned, and generated from or verified against the implementation.
- **Version deliberately, evolve compatibly.** Add optional fields; never repurpose or remove one in place. Support the previous version for a stated window.
- **Postel's law, carefully.** Be conservative in what you send. Be liberal in what you accept, but only about *unknown* fields, never about invalid values.
- **Anti-corruption layer.** Translate an external model into your own at the boundary so a partner's odd model never leaks into your domain. This is the standard defence when integrating a legacy system.
- **Contract tests** in both directions, so a provider change that would break a consumer fails in CI rather than in production. See [Testability](Testability.md).
- **Canonical data model where it pays.** Useful across many internal systems; harmful when forced onto every external partner.
- **Idempotent, replayable endpoints**, because partners will retry, duplicate, and reorder.
- **Standards over bespoke formats**: ISO 8601 for dates, ISO 4217 with minor units for money, UTC for timestamps, UUIDs for identity.

```mermaid
flowchart LR
    P[Partner system<br/>their model] --> ACL[Anti-corruption layer<br/>translate + validate]
    ACL --> D[Our domain model]
    D --> ACL2[Published contract<br/>versioned] --> C[Consumers]
```

### Trade-offs

- Against **evolvability**: a published contract is a promise that constrains your internal changes; keep the exposed surface as small as it can be.
- Against **performance**: translation layers and general-purpose formats cost time relative to internal binary shortcuts.
- Against **simplicity**: supporting several versions concurrently is real, ongoing work, set deprecation dates and enforce them.

### Fitness functions

- Consumer-driven contract tests running in the provider's pipeline.
- A schema-compatibility check (backward/forward) failing the build on breaking changes.
- Automated verification that the published specification matches the deployed behaviour.

## Check Your Understanding

<quiz>
Two services exchange valid JSON over HTTPS, yet the integration produces wrong balances. Which level of interoperability failed?

- [x] Semantic: they agree on structure but not on what the values mean (units, time zone, which date)
> Correct. Technical and syntactic agreement say nothing about shared meaning.
- [ ] Technical, because the protocol is wrong
- [ ] Syntactic, because JSON is untyped
- [ ] Organisational, because support hours differ
</quiz>

<quiz>
Why put an anti-corruption layer in front of a legacy partner system?

- [x] To translate their model into yours at the boundary, so their design does not leak into and distort your domain
> Correct. It confines the foreign model to one replaceable place.
- [ ] To encrypt traffic to the partner
- [ ] To cache partner responses for performance
- [ ] To allow skipping contract versioning
</quiz>
