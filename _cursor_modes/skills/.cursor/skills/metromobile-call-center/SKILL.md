---
name: metromobile-call-center
description: >-
  Call repeat rates and contact center cost for Metromobile demo_calls.csv.
  Use for is_repeat_7d, repeat rate, queue breakdown, handle time, or $8/call cost.
---

# Metromobile call center analysis

## Steps

1. Load `demo_calls.csv`. Use column **`is_repeat_7d`** (not is_repeat_d).
2. Overall repeat rate = mean(`is_repeat_7d`) or repeat calls / total calls.
3. Break down repeat rate by **`queue`** (table sorted by rate desc).
4. Annual calls = count × (12 / months in data) — default **×2** for 6 months.
5. Annual cost = annual calls × **$8/call** (when provided).

## Output table (required)

| Queue | Calls | Repeat calls | Repeat rate | Period cost | Annual cost |

Include overall row.

## Expected ballpark

- Overall repeat ~39%; Technical_Support highest
- Annual cost ~**$3.2M** at $8/call (400k calls/year)
