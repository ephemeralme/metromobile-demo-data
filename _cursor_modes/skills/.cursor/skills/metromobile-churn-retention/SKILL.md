---
name: metromobile-churn-retention
description: >-
  Voluntary churn and retention offer NPV for Metromobile using demo_churns,
  demo_market has_fiber_competitor, and demo_customers CLV. Use for voluntary churn,
  competitive ZIPs, fiber competitor, retention offer, save rate, or churn prevention ROI.
---

# Metromobile churn & retention

## Steps

1. Filter `demo_churns.csv` to **`disconnect_type = 'voluntary'`** (dedupe `customer_id`).
2. Build ZIP flag: `has_fiber_competitor` from `demo_market.csv` (max by zip).
3. Compare voluntary churn rate: competitive (fiber=1) vs non-competitive subscribers at period start.
4. For retention offer on **voluntary churners in competitive ZIPs**:
   - Saved = churners × save_rate (default 30% if user provides it)
   - CLV preserved = saved × avg CLV of that cohort
   - Offer cost = churners × offer amount (default $200)
   - **Net** = CLV preserved − offer cost
5. **Annualize** 6-month cohort with ×2; label Q1 vs full-period if churn spikes in Jan–Mar.

## Output (required)

- Table: segment, base, voluntary churned, monthly churn rate
- Retention math line-by-line with **assumptions called out**
- Net annual value (not gross only)

## Expected ballpark

- Competitive ZIP voluntary churn ~2× non-competitive
- Annualized net retention (30% save, $200 offer): **~$2.6M–$3.0M** depending on period
