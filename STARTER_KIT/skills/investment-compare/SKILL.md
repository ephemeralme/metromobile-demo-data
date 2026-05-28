---
name: investment-compare
description: Use when the user asks where to invest $2M, asks for a comparison across acquisition vs churn prevention vs repeat reduction, or asks for a recommendation on the growth budget.
---

# Investment comparison playbook

Use this when the user wants to compare three investment options for the same $2M decision.

## Steps

For each of the three options, compute annual value (net where program costs are known):

1. **Acquisition** — use the `campaign-roi` skill. Report Year-1 net and lifetime net after $2M spend.
2. **Churn prevention** — use the `churn-retention` skill. Report annualized net.
3. **Repeat reduction** — use the `repeat-reduction` skill. Report total annual benefit (A + B).

## Required output

A markdown table:

| Investment option | Annual value ($) | Confidence | Time to impact | Key risk |
|---|---|---|---|---|
| Acquisition | … | … | … | … |
| Churn prevention | … | … | … | … |
| Repeat reduction | … | … | … | … |

Then a short **recommendation paragraph**:

- Where to put the $2M (and the expected outcome in dollars)
- What you are explicitly **not** recommending and why
- Two sensitivity points the user should sanity-check next week

## Expected recommendation pattern (on demo data)

Do **not** lead with acquisition — its Year-1 net is negative on these unit economics. Prefer churn prevention (~$3M net) and repeat reduction (~$5M case), with explicit assumptions called out.
