---
name: metromobile-campaign-roi
description: >-
  Analyze Metromobile demo_campaigns.csv test vs control connect rates, unit costs,
  incremental connects, and $2M acquisition ROI. Use for campaigns, connect rate,
  door-to-door, digital ads, CAC, or growth budget requests.
---

# Metromobile campaign ROI

## Steps

1. Load `demo_campaigns.csv` and `demo_customers.csv`.
2. Aggregate **prospects** and **connects** by `channel` × `group` (test vs control).
3. Compute **connect rate** = connects / prospects per channel and group.
4. **Incremental lift** = test rate − control rate (pp and relative %).
5. **Incremental connects** on test prospects = test connects − (test prospects × control rate).
6. **Test campaign cost**: door_to_door prospects × $80 + digital_ads prospects × $15 (test group only unless asked otherwise).
7. **Cost per incremental connect** = test cost / incremental connects (by channel and blended).
8. **$2M projection**: use historical test channel mix; prospects = spend / unit cost; incremental connects = prospects × incremental rate.
9. **Revenue**: incremental connects × avg `monthly_revenue` from campaign ZIP customers × 12 (Year 1); also incremental connects × avg `clv` for lifetime.
10. **Net**: subtract $2M spend. State clearly if ROI < 1 in Year 1.

## Output table (required)

| Channel | Control rate | Test rate | Lift (pp) | Incr. connects | Cost / incr. connect |
|---------|--------------|-----------|-----------|----------------|----------------------|

Then: $2M → prospects, incremental connects, Year-1 gross, net after spend, lifetime CLV net.

## Expected ballpark (demo data)

- Incremental connects from $2M: ~500–550
- Year-1 gross ~$450–500k; **net Year-1 negative** after $2M
- Lifetime net slightly positive to breakeven on CLV
