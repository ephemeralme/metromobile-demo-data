---
name: repeat-reduction
description: Use when the user asks about contact center repeat call rate, heavy callers and churn, 5pp repeat reduction case, or repeat-reduction ROI. Works with demo_calls.csv and demo_churns.csv.
---

# Repeat reduction business case

Two components: direct call-cost savings (A) and indirect churn savings (B).

## A — Direct savings

1. Annual calls = rows in `demo_calls.csv` × 2 (6-month data).
2. Calls avoided = annual calls × **5pp** (0.05) reduction in repeat rate.
3. Direct savings = calls avoided × **$8/call**.

## B — Indirect savings (voluntary churn only)

1. Count calls per customer; segments: Light (1–2), Medium (3–5), High (6–9), **Heavy (10+)**.
2. Voluntary churn rate per segment (use `disconnect_type = 'voluntary'`).
3. Excess rate = Heavy rate − non-heavy rate.
4. Indirect (period) = excess rate × heavy customer count × average CLV of heavy callers × **50% causal discount**.
5. Annualize with ×2.

## Required output

| Component | Annual value |
|---|---|
| A — Direct | $… |
| B — Indirect (after 50% causal discount) | $… |
| **Total** | $… |

Then list assumptions: 5pp repeat reduction, 50% causal discount on heavy-caller churn, voluntary churn only.

**Do not** claim repeat calls cause churn without the 50% discount; this is correlation in the data.

## Expected ballpark

- A ≈ $160,000
- B ≈ $4.9M
- Total ≈ $5.1M
