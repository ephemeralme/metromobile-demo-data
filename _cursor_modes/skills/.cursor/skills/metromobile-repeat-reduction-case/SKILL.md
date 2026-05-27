---
name: metromobile-repeat-reduction-case
description: >-
  Build repeat-reduction business case for Metromobile: direct call savings plus
  indirect CLV from heavy callers. Use for 5pp repeat reduction, causal discount,
  heavy caller churn, or repeat reduction ROI.
---

# Metromobile repeat reduction case

## Steps

### A — Direct savings

- Annual calls = `demo_calls` row count × 2 (6-month data).
- **Calls avoided** = annual calls × **5pp** (0.05) reduction in repeat rate.
- **Direct savings** = calls avoided × **$8/call**.

### B — Indirect (voluntary churn only)

1. Call volume per customer; segments: Light 1–2, Medium 3–5, High 6–9, **Heavy 10+**.
2. Voluntary churn rate per segment (`disconnect_type = voluntary`).
3. **Excess rate** = Heavy rate − non-heavy rate (or vs Light).
4. **Indirect (period)** = excess rate × heavy customer count × avg CLV of heavy callers × **50% causal discount**.
5. **Annualize** indirect with ×2.

### Total

**A + B** with assumptions section (5pp, 50% causal, voluntary only).

## Output (required)

| Component | Annual value |
|-----------|-------------|
| A Direct | $… |
| B Indirect | $… |
| **Total** | $… |

## Expected ballpark

- A ~**$160k**
- B ~**$4.9M** (after 50% discount)
- Total ~**$5.1M**

Do **not** claim repeats cause churn without the 50% discount on part B.
