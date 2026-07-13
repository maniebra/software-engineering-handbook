# Message Queues

A message queue is a communication system that lets services send messages to each other asynchronously.

Instead of one service calling another service directly and waiting for the work to finish, it can place a message in a queue. Another service can read the message later and process it.

## Basic Structure

```text
Producer -> Message Queue -> Consumer
```

- **Producer**: The service that sends a message.
- **Message Queue**: Stores messages until they are processed.
- **Consumer**: The service that reads and handles messages.

## Why Use Message Queues?

- Decouple services from each other.
- Handle traffic spikes.
- Run slow work in the background.
- Improve fault tolerance.
- Retry failed operations.
- Make systems more scalable.

## Example

Suppose an online store receives an order.

Without a message queue:

```text
Order Service -> Payment Service
              -> Inventory Service
              -> Email Service
```

The order request may become slow because it waits for every service to finish.

With a message queue:

```text
Order Service -> Queue -> Payment Worker
                       -> Inventory Worker
                       -> Email Worker
```

The order service can save the order and publish messages. Other workers process payment, inventory, and email in the background.

## Queue vs Pub/Sub

### Queue

In a queue, each message is usually processed by one consumer.

Example:

```text
Queue -> Worker 1
      -> Worker 2
      -> Worker 3
```

If there are many workers, they share the work. This is useful for background jobs.

### Publish/Subscribe

In pub/sub, one message can be delivered to many subscribers.

Example:

```text
OrderPlaced Event -> Payment Service
                  -> Inventory Service
                  -> Notification Service
```

This is useful when several services need to react to the same event.

## Common Use Cases

- Sending emails.
- Processing images or videos.
- Handling payment events.
- Updating search indexes.
- Sending notifications.
- Running background jobs.
- Collecting logs or analytics events.

## Delivery Guarantees

### At-most-once Delivery

The message is delivered zero or one time.

It is fast, but a message can be lost.

Use it when losing some messages is acceptable.

### At-least-once Delivery

The message is delivered one or more times.

It avoids message loss, but the same message may be processed more than once.

Consumers should be idempotent, meaning processing the same message multiple times should not create incorrect results.

### Exactly-once Delivery

The message is processed exactly one time.

This is difficult and often expensive to guarantee in distributed systems. Many systems use at-least-once delivery with idempotent consumers instead.

## Acknowledgement

An acknowledgement tells the queue that a message was processed successfully.

Basic flow:

```text
Consumer reads message
Consumer processes message
Consumer sends acknowledgement
Queue removes message
```

If the consumer crashes before acknowledging the message, the queue can deliver the message again.

## Retries

Retries allow failed messages to be processed again.

Example:

- A payment API is temporarily unavailable.
- The consumer fails to process the message.
- The queue retries the message later.

Retries should usually have limits. Retrying forever can overload the system.

## Dead-letter Queue

A dead-letter queue stores messages that cannot be processed successfully after several attempts.

Example:

```text
Main Queue -> Retry -> Retry -> Retry -> Dead-letter Queue
```

Dead-letter queues help teams inspect failed messages without blocking the main queue.

## Ordering

Some systems need messages to be processed in order.

Example:

```text
OrderCreated -> OrderPaid -> OrderShipped
```

Maintaining strict order can reduce scalability because messages may need to be handled by the same partition or consumer.

## Backpressure

Backpressure happens when producers create messages faster than consumers can process them.

Signs of backpressure:

- Queue length keeps growing.
- Message processing becomes delayed.
- Consumers use too much CPU or memory.

Common solutions:

- Add more consumers.
- Slow down producers.
- Increase processing capacity.
- Split work into multiple queues.

## Popular Message Queue Systems

- RabbitMQ
- Apache Kafka
- Amazon SQS
- Google Pub/Sub
- Azure Service Bus
- Redis Streams

## Benefits

- Services become less tightly coupled.
- Slow work can run in the background.
- Traffic spikes can be absorbed by the queue.
- Failed work can be retried.
- Consumers can be scaled independently.

## Limitations

- Adds operational complexity.
- Messages can be duplicated.
- Debugging asynchronous flows can be harder.
- Ordering is not always guaranteed.
- Queue growth can hide downstream problems.

## Summary

Message queues are important in system design because they help services communicate asynchronously. They improve scalability and reliability, but they require careful handling of retries, duplicate messages, ordering, and failed messages.
