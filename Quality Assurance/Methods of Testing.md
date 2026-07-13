# Methods of Testing

Testing methods describe how testers design and perform tests.

They are different from testing levels such as unit testing, integration testing, and system testing. A testing level explains where the test is applied. A testing method explains how the test is designed or executed.

## Static Testing

Static testing checks software artifacts without running the program.

Examples:

- Reviewing requirements.
- Reviewing design documents.
- Code reviews.
- Static code analysis.
- Checking coding standards.

Use static testing to find defects early, before the software is executed.

## Dynamic Testing

Dynamic testing checks the software by running it.

Examples:

- Running unit tests.
- Running the application manually.
- Testing API responses.
- Testing a complete user flow.

Use dynamic testing to check real behavior and runtime results.

## Manual Testing

Manual testing is performed by a person without relying fully on automation.

Examples:

- A tester checks a login form by entering valid and invalid data.
- A tester explores the UI to find unexpected behavior.
- A product owner verifies whether a feature matches the requirement.

Manual testing is useful when human judgment, usability, or visual inspection is important.

## Automated Testing

Automated testing uses scripts or tools to run tests automatically.

Examples:

- Unit tests in a test framework.
- API tests in Postman or automated test suites.
- End-to-end tests using browser automation.
- Regression tests in CI/CD pipelines.

Automated testing is useful for repetitive tests that must be run often.

## Black-box Testing

Black-box testing checks the system from the outside without looking at internal code.

The tester focuses on inputs and outputs.

Example:

- Input: username and password.
- Expected output: user logs in successfully or receives an error message.

Common black-box techniques:

- Equivalence partitioning.
- Boundary value analysis.
- Decision table testing.
- State transition testing.

## White-box Testing

White-box testing checks the internal structure of the code.

The tester uses knowledge of code, branches, paths, and conditions.

Example:

- Testing every branch of an `if` statement.
- Testing error-handling paths.
- Checking whether all important code paths are executed.

Common white-box techniques:

- Statement coverage.
- Branch coverage.
- Path coverage.
- Condition coverage.

## Gray-box Testing

Gray-box testing combines black-box and white-box testing.

The tester has partial knowledge of the internal system but still tests from the user's or API's point of view.

Example:

- A tester knows how the database schema works and uses that knowledge to design better API tests.
- A tester understands the authentication flow and tests token expiration from the outside.

Gray-box testing is useful for integration, API, and security testing.

## Exploratory Testing

Exploratory testing is a flexible method where the tester learns, designs, and executes tests at the same time.

Instead of following a fixed script, the tester investigates the system and follows interesting behavior.

Example:

- A tester explores a checkout page and tries unusual combinations of coupons, addresses, and payment methods.

Use exploratory testing when requirements are unclear, the feature is new, or you want to discover unexpected defects.

## Scripted Testing

Scripted testing follows predefined test cases.

Example:

- Step 1: Open login page.
- Step 2: Enter valid username.
- Step 3: Enter valid password.
- Step 4: Click login.
- Expected result: Dashboard is displayed.

Scripted testing is useful when repeatability and documentation are important.

## Risk-based Testing

Risk-based testing prioritizes tests based on the probability and impact of failure.

High-risk features are tested first and more deeply.

Examples of high-risk areas:

- Payment.
- Authentication.
- Data deletion.
- Security permissions.
- Critical business workflows.

Use risk-based testing when time is limited and not everything can be tested equally.

## Model-based Testing

Model-based testing designs tests from a model of the system's expected behavior.

The model can be a state diagram, flowchart, decision table, or business process model.

Example:

- A state diagram for an order: `Created -> Paid -> Shipped -> Delivered`.
- Tests are designed to check valid and invalid transitions between states.

Model-based testing is useful for workflows with clear states and rules.

## Regression Testing Method

Regression testing checks whether existing functionality still works after a change.

Example:

- After changing the payment module, run tests for checkout, invoices, refunds, and order history.

Regression testing can be manual or automated, but it is usually a strong candidate for automation.

## Choosing a Testing Method

| Situation | Useful Method |
| --- | --- |
| Requirements need review | Static testing |
| Behavior must be checked at runtime | Dynamic testing |
| UI needs human judgment | Manual testing |
| Tests must run often | Automated testing |
| Only inputs and outputs are known | Black-box testing |
| Code paths must be checked | White-box testing |
| Tester has partial internal knowledge | Gray-box testing |
| Feature is new or unclear | Exploratory testing |
| Tests must be repeatable | Scripted testing |
| Time is limited | Risk-based testing |
| Workflow has clear states | Model-based testing |

## Summary

Testing methods help teams choose the right way to inspect software. Good QA usually combines several methods instead of relying on only one.
