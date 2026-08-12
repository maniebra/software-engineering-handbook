# NPV Worked Example

This page works one economic feasibility case end to end: a small warehouse system, five years of cash flow, and the three numbers the approval committee asks for. The concepts behind it are in [Feasibility Analysis](Feasibility%20Analysis.md).

## The Scenario

A distributor wants to replace a manual stock-counting process with a warehouse tracking system.

- **Development cost**, all in year 0: 180,000 (salaries, hardware, licences).
- **Operational cost**, years 1 to 5: 30,000 a year (hosting, support, licence renewals), rising 5% a year with wages.
- **Tangible benefits**, years 1 to 5: 90,000 in year 1 from reduced stock write-offs and fewer counting hours, growing 10% a year as more warehouses adopt it.
- **Discount rate**: 8%, the rate the finance team uses for internal projects.

The benefit growth and cost inflation are assumptions, not facts. They are the first things to challenge in review, and the first things to revise when the numbers turn out wrong.

## Step 1: Lay Out the Cash Flow

| Year | Costs | Benefits | Net cash flow | Cumulative |
| ---: | ---: | ---: | ---: | ---: |
| 0 | 180,000 | 0 | −180,000 | −180,000 |
| 1 | 30,000 | 90,000 | 60,000 | −120,000 |
| 2 | 31,500 | 99,000 | 67,500 | −52,500 |
| 3 | 33,075 | 108,900 | 75,825 | 23,325 |
| 4 | 34,729 | 119,790 | 85,061 | 108,386 |
| 5 | 36,465 | 131,769 | 95,304 | 203,690 |
| **Total** | **345,769** | **549,459** | **203,690** | |

## Step 2: Return on Investment

$$\mathrm{ROI} = \frac{\text{Total benefits} - \text{Total costs}}{\text{Total costs}} = \frac{549{,}459 - 345{,}769}{345{,}769} \approx 0.589$$

A 58.9% return over the five years. Note what this number cannot see: it treats the 180,000 spent in year 0 as equivalent to money spent in year 5.

## Step 3: Break-Even Point

The cumulative column turns positive during year 3. Interpolating within that year:

$$\text{Break-even} = 2 + \frac{52{,}500}{75{,}825} \approx 2.69 \text{ years}$$

So the project pays for itself about eight months into year 3. This matters politically as much as financially: a break-even beyond the sponsor's planning horizon is a project that gets defunded halfway.

## Step 4: Net Present Value

Each year's net cash flow is discounted at 8%:

$$\mathrm{NPV} = \sum_{t=0}^{5} \frac{B_t - C_t}{(1 + 0.08)^t}$$

| Year | Net cash flow | Discount factor $1/1.08^t$ | Present value |
| ---: | ---: | ---: | ---: |
| 0 | −180,000 | 1.0000 | −180,000 |
| 1 | 60,000 | 0.9259 | 55,556 |
| 2 | 67,500 | 0.8573 | 57,870 |
| 3 | 75,825 | 0.7938 | 60,193 |
| 4 | 85,061 | 0.7350 | 62,522 |
| 5 | 95,304 | 0.6806 | 64,864 |
| | | **NPV** | **121,005** |

An NPV of roughly 121,000 at an 8% discount rate. Positive, so the project beats putting the same money into the alternative the 8% represents.

## Step 5: Read the Three Together

| Measure | Value | What it says | What it hides |
| --- | ---: | --- | --- |
| ROI | 58.9% | The project returns more than it costs | Timing; ignores the discount rate entirely |
| Break-even | 2.69 years | The sponsor waits under three years | Everything after break-even, including a benefit collapse in year 4 |
| NPV | 121,005 | Positive after accounting for the cost of money | Sensitivity; one set of assumptions produces one number |

Reported alone, each is easy to game. A project with a huge year-5 benefit looks good on ROI and bad on break-even. Report all three.

## Step 6: Test the Assumptions

The NPV is a single point on a curve. Before approval, re-run it against pessimistic inputs. Here, with benefits flat instead of growing 10% a year:

| Scenario | NPV | Break-even |
| --- | ---: | ---: |
| Base case | 121,005 | 2.69 years |
| Benefits flat at 90,000 | 55,830 | 3.29 years |
| Benefits flat, costs +20% | 22,600 | 3.95 years |
| Benefits 25% below plan | −18,700 | never within 5 years |

The project survives two of the three pessimistic cases and fails the third. That is the useful output: not "NPV is 121,005", but "this is worth doing unless benefits land more than about a fifth below plan, so measure realised benefits from year 1 and be ready to stop."

<quiz>
The base case NPV is 121,005 and total net cash flow is 203,690. Why is the NPV so much lower?

- [x] Later cash flows are discounted, so the benefits arriving in years 3 to 5 are worth less today than their face value
> Correct. The discount factor falls from 1.0 in year 0 to 0.68 in year 5, so the largest benefits are shrunk the most.
- [ ] NPV excludes the development cost in year 0
> The year 0 cost is included at full value, since its discount factor is 1.0.
- [ ] NPV counts only tangible benefits while net cash flow counts intangible ones too
> Neither figure here includes intangible benefits, they were never assigned a value.
- [ ] The 8% rate is subtracted from the total as a flat fee
> Discounting is compounded per year, not a one-off deduction.
</quiz>

<quiz>
The sensitivity table shows a negative NPV when benefits land 25% below plan. What is the right conclusion for the feasibility study?

- [ ] Reject the project, because one scenario is negative
> A single pessimistic scenario failing is normal. It defines a threshold, not a verdict.
- [ ] Ignore it, because the base case is comfortably positive
> Ignoring the failure case is how projects get approved on their most optimistic numbers.
- [x] Approve with a named benefit threshold and a plan to measure realised benefits early enough to stop
> Correct. The sensitivity analysis converts a point estimate into a monitoring condition the sponsor can act on.
- [ ] Re-run the analysis with a lower discount rate so the NPV stays positive
> Choosing the rate to reach a desired answer makes the whole analysis theatre.
</quiz>
