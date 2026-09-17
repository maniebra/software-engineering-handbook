# System Design and Analysis Quiz

15 questions on [feasibility analysis](../System%20Design/Planning/Feasibility%20Analysis.md)
and the [system-design](../System%20Design/index.md) building blocks: scale,
traffic routing, data, asynchronous work, resilience, and operations.

## Analysis and feasibility

<quiz>
A proposed system has a positive financial return, but depends on an unfamiliar platform and must integrate with several legacy vendor systems. Which conclusion is most useful?

- [x] It may be economically feasible, but its technical feasibility is risky and needs investigation, prototypes, or mitigation
> Correct. Economic and technical feasibility answer different questions. Familiarity and compatibility are technical-risk drivers even when the projected return is attractive.
- [ ] It is feasible because a positive financial return settles every feasibility question
- [ ] It is infeasible because legacy integrations always fail
- [ ] Its only remaining concern is whether users like the interface
</quiz>

<quiz>
Which cost is easiest to miss when estimating the lifetime cost of a new hosted application?

- [x] Recurring operating costs such as support, maintenance, hosting, and licence renewals
> Correct. Development is a one-off cost; operating costs can continue for years and must be included in the cash flow.
- [ ] The initial development salaries
- [ ] Hardware bought specifically for the first release
- [ ] A consultant hired for the migration
</quiz>

<quiz>
Why should a feasibility study record an important benefit even when it cannot be reliably expressed in money?

- [x] It may be a real intangible benefit, such as better customer service, and omitting it would distort the decision
> Correct. Intangible benefits should be estimated where possible and explicitly listed where they are not, rather than silently treated as worth zero.
- [ ] Only monetary benefits can affect a project decision
- [ ] It allows the project team to count the benefit twice in ROI
- [ ] It removes the need to estimate costs
</quiz>

<quiz>
A project has low technical risk and strong strategic alignment, but the frontline users oppose the redesigned workflow. What should happen next?

- [x] Treat organisational feasibility as a material risk and plan user involvement, training, a phased rollout, or workflow changes
> Correct. Adoption is part of feasibility. Resistance is information for the plan, not a reason to ignore the affected users.
- [ ] Proceed unchanged because technical feasibility is more important than adoption
- [ ] Remove users from the stakeholder list so their resistance cannot delay approval
- [ ] Recalculate only the database capacity estimate
</quiz>

<quiz>
What does a negative net present value (NPV) mean for a proposed project at the chosen discount rate?

- [x] Its discounted future benefits do not cover its discounted costs, so the investment is not justified on that financial basis
> Correct. NPV compares cash flows in present-value terms; a negative result means the money has a better use under the stated assumptions.
- [ ] The project will never have any revenue
- [ ] The project has no technical risks
- [ ] The project breaks even immediately
</quiz>

## Designing for scale and traffic

<quiz>
During a design review, what should be established before choosing a database, cache, or queue?

- [x] The goals, main features, expected traffic and data scale, read/write ratio, latency needs, and important constraints
> Correct. Requirements and rough estimates give component choices a purpose; the architecture should grow from pressures rather than a technology checklist.
- [ ] The cloud provider's most popular managed services
- [ ] The exact number of microservices the team will deploy
- [ ] A complete list of every possible failure mode
</quiz>

<quiz>
An API has many requests that take widely different amounts of time. Which load-balancing approach most directly accounts for that difference?

- [x] Least connections, which sends new work to the server with the fewest active connections
> Correct. It is useful when long-running requests make a simple request count a poor approximation of current load.
- [ ] Round robin, because it always selects the fastest server
- [ ] IP hash, because it measures each request's execution time
- [ ] Sticky sessions, because they distribute load evenly
</quiz>

<quiz>
Why should application servers generally avoid keeping user session state only in local memory when they sit behind a load balancer?

- [x] Any healthy server should be able to serve a request; a shared session store supports this and avoids dependence on sticky routing
> Correct. Server-local sessions make scaling and failover harder because subsequent requests may reach a different server.
- [ ] Local memory is slower than a network call
- [ ] A load balancer cannot forward HTTP requests
- [ ] Shared session stores prevent all application errors
</quiz>

<quiz>
A service must route `/images` to a static-content service and `/api/orders` to an orders service. What capability is needed?

- [x] Layer 7 load balancing, because it can inspect HTTP paths and other application-level information
> Correct. Layer 4 routing uses transport information such as IP addresses and ports; path-based routing needs Layer 7 awareness.
- [ ] Layer 4 load balancing, because paths are part of TCP
- [ ] Database replication, because it routes requests by URL
- [ ] A dead-letter queue, because it stores unmatched requests
</quiz>

## Data, asynchronous work, and operations

<quiz>
An application uses cache-aside for a product catalogue. What is the normal sequence after a cache miss?

- [x] The application reads the database, returns the value, and stores it in the cache for later requests
> Correct. With cache-aside, the application owns the loading logic and populates the cache after a miss.
- [ ] The database reads from the cache and deletes the source record
- [ ] The cache accepts the write and never uses durable storage
- [ ] The load balancer retries the request on every server
</quiz>

<quiz>
Thousands of cache keys expire at exactly the same moment and the database suddenly receives all the resulting reads. What is this called, and what is one defence?

- [x] A cache stampede; add TTL jitter or coalesce refresh requests so only one request reloads a key
> Correct. Coordinating refreshes, staggering expiration, or serving briefly stale data prevents simultaneous misses from overwhelming the source.
- [ ] Backpressure; add sticky sessions
- [ ] Write-through; add a read replica
- [ ] A dead-letter queue; acknowledge every cache hit
</quiz>

<quiz>
A customer places an order, but sending the confirmation email should not delay the order response. Which design is most appropriate?

- [x] Save the order and publish an event or message for a background email worker
> Correct. A queue decouples slow, non-critical work from the request path while letting workers process it asynchronously.
- [ ] Call the email service synchronously and wait indefinitely for success
- [ ] Store the email only in the application server's memory
- [ ] Route email through a read replica
</quiz>

<quiz>
Why must consumers usually be idempotent when a queue provides at-least-once delivery?

- [x] A message can be delivered again after a crash or missing acknowledgement, so repeated processing must not produce an incorrect result
> Correct. At-least-once delivery reduces message loss by allowing duplicates; the consumer must make duplicates safe.
- [ ] Each message is guaranteed to be processed exactly once
- [ ] Idempotence makes acknowledgements unnecessary
- [ ] It ensures messages are received in global order
</quiz>

<quiz>
What is the main purpose of a dead-letter queue?

- [x] Keep repeatedly failing messages for inspection or special handling without blocking the main queue
> Correct. After bounded retries, moving a poison message aside protects normal throughput and leaves evidence for diagnosis.
- [ ] Copy every successful message for long-term analytics
- [ ] Ensure every consumer receives each message
- [ ] Replace health checks for failed servers
</quiz>

<quiz>
Which observation most strongly indicates that a system's consumers cannot keep up with producers?

- [x] Queue depth and message delay keep increasing over time
> Correct. A growing backlog is backpressure: work arrives faster than it is completed. Add capacity, slow producers, or split the workload after finding the bottleneck.
- [ ] The cache hit rate is high
- [ ] A health check returns 200
- [ ] The primary database has a read replica
</quiz>
