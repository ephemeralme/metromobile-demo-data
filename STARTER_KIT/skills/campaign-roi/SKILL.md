---
name: campaign-roi
description: Use when the user asks about acquisition campaign ROI, connect rate, test vs control, incremental lift, cost per connect, or what $2M will buy. Works with demo_campaigns.csv.
---

# Campaign ROI playbook

When triggered, run this analysis end-to-end. Do not ask the user for clarification — use defaults below.

## Steps

1. Load `demo_campaigns.csv` and `demo_customers.csv`.
2. Aggregate prospects and connects by `channel` × `group` (test vs control).
3. Connect rate = connects / prospects for each cell.
4. Incremental lift = test rate − control rate (percentage points and relative %).
5. Incremental connects on test prospects = test connects − (test prospects × control rate).
6. Test campaign cost: door_to_door prospects × **$80** + digital_ads prospects × **$15**.
7. Cost per incremental connect = test cost / incremental connects (per channel and blended).
8. Project a **$2M** budget using the same channel mix as the historical test campaigns: prospects = $2M × mix / unit_cost; incremental connects = prospects × incremental rate.
9. Revenue: incremental connects × average `monthly_revenue` from customers in campaign ZIPs × 12 = Year 1 gross. Lifetime = incremental connects × average `clv`.
10. Net: subtract the $2M spend. Flag clearly if Year 1 net is negative.

## Required output

A markdown table with these columns:

| Channel | Control rate | Test rate | Lift (pp) | Incr. connects | Cost / incr. connect |

Then a second block:

- $2M → prospects, incremental connects, Year-1 gross, Net after $2M, Lifetime CLV, Lifetime net
- One-line recommendation: is $2M worth it on these unit economics?

Always note: a "connect" is a sales outcome, not necessarily an installed subscriber.

## Expected ballpark (sanity check)

- ~500–550 incremental connects from $2M
- Year-1 gross ~$450–500k
- Year-1 net **negative** after $2M
- Lifetime net ~breakeven or slightly positive
