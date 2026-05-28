---
name: churn-retention
description: Use when the user asks about voluntary churn, fiber competitor ZIPs, retention offers, save rates, or churn prevention ROI. Works with demo_churns.csv, demo_market.csv, demo_customers.csv.
---

# Churn retention playbook

## Steps

1. Filter `demo_churns.csv` to `disconnect_type = 'voluntary'`. Dedupe by `customer_id` keeping earliest event.
2. From `demo_market.csv`, build a ZIP-level `has_fiber_competitor` flag (use max across months for stability).
3. Compare voluntary monthly churn rate in competitive (fiber=1) vs non-competitive ZIPs, using active subscribers at period start as the denominator.
4. Model a retention offer aimed at voluntary churners in competitive ZIPs:
   - Saved customers = churners × save_rate (default **30%** unless user provides one)
   - CLV preserved = saved × average CLV of this cohort (from `demo_customers.csv`)
   - Offer cost = churners × offer amount (default **$200** per churner offered)
   - **Net** = CLV preserved − offer cost
5. Annualize with ×2 if working from the 6-month window. If only using the last 3 months (Jan–Mar 2026), annualize with ×4 and call out that Q1 churn is elevated.

## Required output

| Segment | Active base | Voluntary churned | Monthly rate | Avg CLV |

Then the offer math line-by-line, with **assumptions explicitly stated**. End with annualized net value and one-line confidence (medium — depends on save-rate assumption).

## Expected ballpark

- Competitive ZIP voluntary churn ~2× non-competitive
- Annualized net retention value: **~$2.6M–$3.0M**
