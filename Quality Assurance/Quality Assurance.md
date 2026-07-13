# Quality Assurance (QA)

Quality Assurance is the set of activities used to make sure software is built with the expected level of quality.

QA is not only testing. Testing is one part of QA, but QA also includes planning, standards, reviews, automation, process improvement, and defect prevention.

## QA vs QC

### Quality Assurance (QA)

QA focuses on preventing defects before they happen.

Examples:

- Defining coding standards.
- Reviewing requirements before development starts.
- Creating test plans.
- Setting up CI/CD checks.
- Improving the development process.

### Quality Control (QC)

QC focuses on finding defects in the finished or partially finished product.

Examples:

- Running manual tests.
- Running automated tests.
- Reporting bugs.
- Checking whether a feature matches requirements.
- Verifying a release build before deployment.

## Verification and Validation

### Verification

Verification asks:

> Are we building the product right?

It checks whether the software is being built according to specifications, standards, and design documents.

Examples:

- Code reviews.
- Static analysis.
- Architecture reviews.
- Checking implementation against design.

### Validation

Validation asks:

> Are we building the right product?

It checks whether the software solves the user's real problem.

Examples:

- User acceptance testing.
- Product demos.
- Usability testing.
- Checking behavior against user needs.

## Common Types of Testing

### Unit Testing

Tests a small piece of code, usually one function, method, or class.

Example:

- Testing a `CalculateDiscount()` method.

### Integration Testing

Tests whether multiple parts of the system work together.

Example:

- Testing whether an order service correctly saves data through a repository.

### System Testing

Tests the whole system as one complete product.

Example:

- Testing the full checkout flow in an online store.

### Acceptance Testing

Checks whether the system meets business or user requirements.

Example:

- A customer confirms that the checkout flow works as expected.

### Regression Testing

Checks whether new changes broke existing behavior.

Example:

- Running old tests after changing the payment module.

### Smoke Testing

A small set of quick tests that check whether the most important parts of the system still work.

Example:

- Checking login, dashboard loading, and basic navigation after deployment.

## Test Case Structure

A good test case usually includes:

- **Test case ID**: A unique identifier.
- **Title**: A short description of what is being tested.
- **Preconditions**: What must be true before the test starts.
- **Steps**: The actions needed to run the test.
- **Expected result**: What should happen if the software works correctly.
- **Actual result**: What happened during execution.
- **Status**: Pass, fail, or blocked.

## Bug Report Structure

A clear bug report usually includes:

- **Title**: Short and specific.
- **Environment**: Browser, OS, device, app version, or server version.
- **Steps to reproduce**: Exact steps that trigger the problem.
- **Expected result**: What should have happened.
- **Actual result**: What actually happened.
- **Severity**: How serious the impact is.
- **Priority**: How soon it should be fixed.
- **Evidence**: Screenshots, logs, videos, or error messages.

## RIPR Model

RIPR explains why some bugs are not found by a test, even when the faulty code is executed.

For a test to reveal a failure, four conditions must happen:

1. **Reachability**
2. **Infection**
3. **Propagation**
4. **Revealability**

If any of these conditions is missing, the test may pass even though a defect exists.

### R: Reachability

The test must execute the faulty code.

If the test never reaches the bug, it cannot expose it.

Example:

- A bug exists in the password reset feature.
- A test only checks login.
- The bug is not reached, so the test cannot fail because of it.

### I: Infection

After the faulty code runs, it must create an incorrect internal state.

If the bug is executed but the program state stays correct, there is no failure to observe.

Example:

```csharp
int Add(int a, int b)
{
    return a - b; // fault
}
```

Calling `Add(5, 0)` reaches the fault, but the result is still `5`. The state is not infected for this input.

Calling `Add(5, 2)` returns `3` instead of `7`, so the state becomes infected.

### P: Propagation

The incorrect internal state must affect the program output or visible behavior.

Sometimes a wrong internal value is overwritten or never used, so the user cannot see the failure.

Example:

```csharp
int discount = CalculateDiscount(user);
discount = 0;
return total - discount;
```

If `CalculateDiscount()` returns the wrong value, the state is infected. But the wrong value is overwritten before it affects the result, so the infection does not propagate.

### R: Revealability

The test must check the output or behavior that shows the failure.

A failure can happen, but the test will still pass if it does not assert the right thing.

Example:

```csharp
Order order = checkout.PlaceOrder(cart);

Assert.NotNull(order);
```

This test only checks that an order exists. If the order total is wrong, the test will not reveal the failure unless it also checks the total.

Better:

```csharp
Order order = checkout.PlaceOrder(cart);

Assert.Equal(120, order.Total);
```

## RIPR Example

Suppose this method has a bug:

```csharp
bool IsAdult(int age)
{
    return age > 18; // fault: should be age >= 18
}
```

Test:

```csharp
Assert.True(IsAdult(18));
```

RIPR analysis:

- **Reachability**: The test calls `IsAdult()`, so the faulty code is reached.
- **Infection**: For age `18`, the method returns `false` instead of `true`, so the state is infected.
- **Propagation**: The wrong return value becomes the output of the method, so the infection propagates.
- **Revealability**: The assertion expects `true`, so the failure is revealed.

If the test used age `20`, the fault would be reached, but the result would still be `true`. The test would not expose the bug because infection would not happen.

## Good QA Practices

- Start testing early.
- Make tests traceable to requirements.
- Automate repetitive checks.
- Review requirements before implementation.
- Write clear test cases and bug reports.
- Prioritize tests based on risk.
- Keep regression tests updated.
- Track defect patterns and use them to improve the process.

## Summary

QA helps teams build better software by preventing defects, finding defects, and improving the development process. RIPR is useful because it shows that executing faulty code is not enough; a test must reach the fault, infect the state, propagate the bad state, and reveal the failure.
