# Operational Characteristics Quiz

15 questions on the characteristics that concern the running system:
[availability](../../Software%20Architecture/Architectural%20Characteristics/Availability.md),
[performance](../../Software%20Architecture/Architectural%20Characteristics/Performance.md),
[scalability](../../Software%20Architecture/Architectural%20Characteristics/Scalability.md),
[elasticity](../../Software%20Architecture/Architectural%20Characteristics/Elasticity.md),
[reliability](../../Software%20Architecture/Architectural%20Characteristics/Reliability.md) and
[recoverability](../../Software%20Architecture/Architectural%20Characteristics/Recoverability.md).

## Availability and reliability

<quiz>
A service targets 99.99% availability. Roughly how much downtime does that allow in a 30-day month?

- [x] About 4 minutes
> Correct. Four nines leaves roughly 4 minutes 20 seconds per month, which effectively rules out manual failover.
- [ ] About 43 minutes
- [ ] About 22 minutes
- [ ] About 26 seconds
</quiz>

<quiz>
A request requires four services in series, each independently 99.95% available. What is the approximate availability of the request?

- [x] About 99.8%, since availabilities multiply along the chain
> Correct. 0.9995⁴ ≈ 0.998, so each synchronous dependency lowers the ceiling.
- [ ] 99.95%, set by the weakest link
- [ ] 99.99%, since redundancy compounds
- [ ] It cannot be estimated from these numbers
</quiz>

<quiz>
Which change most improves availability once a system is already at three nines?

- [x] Cutting MTTR with automated detection and failover
> Correct. At scale failures are inevitable, so recovery time dominates the remaining budget.
- [ ] Raising MTBF by buying more reliable hardware
- [ ] Adding a second reviewer to every pull request
- [ ] Increasing client-side request timeouts
</quiz>

<quiz>
A payment service always responds within 100 ms but occasionally charges a customer twice. Which characteristic is deficient?

- [x] Reliability, since responses are fast but not correct
> Correct. Availability is about answering; reliability is about answering correctly, every time.
- [ ] Availability, since duplicate charges imply downtime
- [ ] Elasticity, since duplicates come from scaling
- [ ] Recoverability, since the charge can be refunded
</quiz>

<quiz>
Why do idempotency keys appear in almost every reliable distributed design?

- [x] Because retries and redelivery are unavoidable, and idempotency makes repeated delivery harmless
> Correct. Exactly-once delivery is impractical; exactly-once *effect* through deduplication is achievable.
- [ ] Because they encrypt the request payload
- [ ] Because they remove the need for transactions
- [ ] Because they guarantee message ordering
</quiz>

<quiz>
A downstream dependency becomes slow rather than unavailable. Without circuit breakers and timeouts, what typically happens to the caller?

- [x] Threads and connections pile up waiting, and the caller fails too, spreading the outage
> Correct. Slow dependencies exhaust pools; failing fast and shedding load contains the blast radius.
- [ ] The caller automatically routes around the dependency
- [ ] Only the affected requests fail, with no wider effect
- [ ] Latency improves as the queue absorbs the delay
</quiz>

## Performance, scalability, elasticity

<quiz>
Which requirement is properly specified for performance?

- [x] "Checkout submission completes in under 400 ms at p99, at 2000 concurrent users, in production"
> Correct. It names the operation, the percentile, the load, and the environment.
- [ ] "The average response time must be under one second"
- [ ] "The system must feel fast to users"
- [ ] "No endpoint may ever exceed 400 ms"
</quiz>

<quiz>
A team moves email sending, invoicing, and analytics off the request path onto a queue. Which statement is most accurate?

- [x] Perceived latency improves because the response no longer waits for work that does not need to be synchronous
> Correct. Moving work off the request path is the standard latency tactic, at the cost of eventual completion semantics.
- [ ] Total system throughput necessarily drops
- [ ] The system becomes strongly consistent
- [ ] Latency is unchanged because the work still happens
</quiz>

<quiz>
A design requires five sequential cross-continent round trips per request. What does this tell you?

- [x] There is a latency floor of several hundred milliseconds that no code tuning will remove; the interaction pattern must change
> Correct. Physical round trips are relocated or eliminated, never optimised away.
- [ ] A faster runtime or language will solve it
- [ ] Adding more instances will fix the latency
- [ ] Caching database queries is sufficient
</quiz>

<quiz>
Why must instances be stateless for horizontal scaling to work well?

- [x] So any instance can serve any request, letting instances be added, replaced, or destroyed freely
> Correct. In-process state forces sticky routing and prevents free redistribution of load.
- [ ] Because stateless request handling is inherently faster
- [ ] Because load balancers cannot maintain TCP connections otherwise
- [ ] Because databases reject concurrent writers otherwise
</quiz>

<quiz>
5% of a workload runs inside a global lock. What is the ceiling on speedup from adding workers?

- [x] About 20×, because the serial fraction bounds the achievable speedup
> Correct. Amdahl's law: the limit is 1/s, so 1/0.05 = 20.
- [ ] Unbounded, since the other 95% parallelises
- [ ] About 5×, matching the serial percentage
- [ ] About 95×, matching the parallel percentage
</quiz>

<quiz>
A ticketing system handles steady traffic but must absorb a 20× spike within two minutes when sales open. Which characteristic is being demanded?

- [x] Elasticity, the ability to acquire capacity automatically at spike speed
> Correct. Scalability is about sustained growth; elasticity is about sudden bursts.
- [ ] Scalability, since more users must be supported
- [ ] Availability, since the site must stay up
- [ ] Recoverability, since the spike may cause failures
</quiz>

<quiz>
Which autoscaling signal is usually best for an I/O-bound service that spends most of its time waiting on downstream calls?

- [x] Concurrency or requests in flight, since CPU stays low while the service is saturated
> Correct. The signal must reflect the real bottleneck, and for I/O-bound work CPU is misleading.
- [ ] CPU utilisation, as the platform default
- [ ] Memory usage, which tracks connection buffers
- [ ] Instance count, kept stable to avoid churn
</quiz>

## Recoverability

<quiz>
"We can tolerate 15 minutes of downtime but no more than 1 minute of lost data." Which objectives are these?

- [x] RTO of 15 minutes and RPO of 1 minute
> Correct. RTO bounds downtime and drives failover strategy; RPO bounds data loss and drives replication mode.
- [ ] RPO of 15 minutes and RTO of 1 minute
- [ ] MTBF of 15 minutes and MTTR of 1 minute
- [ ] An availability SLO of 99.9% with a 1-minute alert threshold
</quiz>

<quiz>
Which recovery mechanism protects against the most common real-world "disaster"?

- [x] A fast, rehearsed rollback of the release that was just deployed
> Correct. Most incidents originate in the latest change, so reversibility of deployments has the highest recovery value per unit of effort.
- [ ] Cross-region active-active replication
- [ ] Quarterly offsite tape archives
- [ ] A larger standby database instance
</quiz>
