# Metromobile Cursor Demo — Facilitator Script

40 minutes. UCLA MSBA audience. The whole demo is one story: *Should Metromobile spend $2M on acquisition?* We answer that with Cursor, while showing how Rules, Skills, Commands, and Plan mode work along the way.

---

## Before students arrive (10 min)

1. Open this folder in Cursor.
2. Confirm there is **no** `.cursor/` folder. Run: `ls .cursor/` — should error or show nothing.
3. Open `Metromobile_Demo.pptx` for the audience.
4. Open this script on a second monitor (do not share).
5. Have `STARTER_KIT/` open in the file tree as your safety net.
6. **Close PowerPoint** before the session if anything was edited — keeps the file unlocked.
7. Open one terminal in the project folder.

> **Mental model:** You are playing "the analyst at Metromobile, day 1." Each round of the demo is a week of that analyst learning to use Cursor better.

---

## 0:00 – 5:00 — Setup (slide 1–5)

**Say:**
> "Metromobile is a fake broadband ISP. Their head of growth wants $2M for acquisition campaigns. Leadership wants you, the new analyst, to give a data-backed answer. You have 5 CSV files. Let's see how far Cursor takes us — and pick up Rules, Skills, Commands, and Plan mode along the way."

**Do:**
- Show the 5 CSVs in the file tree.
- Show the **mode selector** in the chat panel (Ask / Agent / Plan). Hover, don't click.
- Stay in **Agent mode**.

**Slides used:** 1 (title), 2 (scenario), 3 (what Cursor is), 4 (three modes), 5 (40-min plan).

---

## 5:00 – 13:00 — Round 1: Raw Agent (slide 6–7)

**Say:**
> "First, just the AI and the files. No rules, no skills. Let's see what we get."

**Do:**
1. Open a **new chat** (chat icon → +).
2. Confirm Agent mode is selected.
3. Paste this prompt:

```
How many customers churned in the last 3 months?
What is the monthly churn rate? What is the total annual
revenue at risk if this continues?
```

4. Let it run (~1–2 min). The agent will load CSVs, write Python or use its tools, and reply.

**What you expect:**
- Counts churn events (probably ~5,000) regardless of `disconnect_type`.
- Reports a high "revenue at risk" number — often $3M–$5M annualized.
- May mention disconnect types in passing, but treats them all the same.

**Slide 7 — critique out loud:**
> "Notice the agent lumped voluntary disconnects with non-payment writeoffs. Retention can fix one of those, not the other. The $5M headline isn't actionable — half of it is collections, not customers we can save with a retention offer. The AI doesn't know how Metromobile thinks about churn yet. That's what Rules are for."

---

## 13:00 – 20:00 — Round 2: Live-build a Rule (slide 8–10)

**Say:**
> "A Rule is persistent context. Like an employee handbook — read once, applied to every chat. Watch."

**Do:**
1. In Cursor, create a new file: `.cursor/rules/metromobile.mdc`.
   - Tip: use the file explorer right-click → New File, type the path.
2. Type the following live (or paste from `STARTER_KIT/rules/metromobile.mdc` if nervous):

```markdown
---
description: Metromobile analytics conventions
alwaysApply: true
---

# When analyzing Metromobile data

- Lead with `disconnect_type = 'voluntary'`. That's what retention can fix.
- Treat `non_payment` as a collections issue, not a retention target.
- Period is Oct 2025 – Mar 2026 (6 months). Annualize with ×2 and label it.
- Repeat-call column is `is_repeat_7d`.
- End $ recommendations with assumptions, confidence, and one key risk.
```

3. Save.
4. **Reload Cursor window:** `Ctrl+Shift+P` → type `Reload Window` → Enter.
5. Open a **new chat**.
6. Paste the **same prompt** as Round 1.

**What you expect:**
- Voluntary churn first (~2,100 in Jan–Mar).
- Non-payment called out as a separate, non-retention problem.
- Annualized number is smaller and labeled.
- Assumptions and confidence stated.

**Say:**
> "Same data, same question, much sharper answer. Five lines of context did all of that — and they apply to every chat in this project from now on."

---

## 20:00 – 28:00 — Round 3: Live-build a Skill (slide 11–13)

**Say:**
> "Rules guide how the agent thinks. Skills tell it what to *do*. A Skill is a playbook — multi-step, fires when the question matches. Let's build one for campaign ROI, since that's exactly the $2M question Growth is asking."

**Do:**
1. Create folder: `.cursor/skills/campaign-roi/`.
2. Inside it, create `SKILL.md`.
3. Type (or paste from `STARTER_KIT/skills/campaign-roi/SKILL.md`):

```markdown
---
name: campaign-roi
description: Use when the user asks about acquisition campaign ROI, $2M, test vs control, connect rate, or cost per connect.
---

# Campaign ROI playbook

## Steps
1. Load demo_campaigns.csv and demo_customers.csv.
2. Connect rate = connects / prospects, by channel × group.
3. Incremental lift = test rate − control rate.
4. Test campaign cost: door_to_door × $80 + digital_ads × $15.
5. Cost per incremental connect = cost / incremental connects.
6. $2M projection at same channel mix: prospects = $2M × mix / unit cost.
7. Year-1 revenue = incremental connects × avg monthly_revenue × 12.
8. Net = revenue − $2M.

## Required output
A table: channel, control rate, test rate, lift, cost per incremental connect.
Then $2M projection: prospects, incremental connects, Year-1 net, lifetime net.
End with: is $2M worth it on these unit economics? One sentence.
```

4. Save.
5. **Reload Cursor window.**
6. New chat. Paste:

```
Growth wants $2M for acquisition campaigns.
Using the campaign ROI playbook, tell me what $2M actually buys
and whether the unit economics support it.
```

**What you expect:**
- The skill fires (you'll see Cursor reference it).
- Structured table with control vs test rates by channel.
- ~$2,600 cost per incremental connect on digital, ~$6,900 on D2D.
- $2M → ~530 incremental connects → ~$496k Year-1 revenue → **Year-1 net is negative**.
- One-line verdict: don't lead with $2M acquisition on these economics.

**Say:**
> "That same prompt with no skill loaded would give you a 5-paragraph essay. With the skill, you get the table, the math, and the verdict — every time, in the same format."

---

## 28:00 – 33:00 — Round 4: Commands + Plan mode (slide 14)

**Say:**
> "Two more capabilities, fast. Commands are one-shot buttons for repeatable tasks. Plan mode is for jobs complex enough that you want the agent to design the work before doing it."

### Commands (2 min)

**Do:**
1. Create `.cursor/commands/recap.md` with:

```markdown
# /recap

Summarize the most recent analysis for leadership.
Output exactly this structure:

**Question:** one line
**Answer:** one or two sentences with the headline number
**Why we believe it:** 2–3 bullets on calculations or filters
**What to verify before deciding:** 1–2 bullets on assumptions or risks

Direct, quantitative, no filler.
```

2. In the chat, type `/recap` and press Enter.

**What you expect:** A clean 4-section leadership summary of the campaign analysis you just ran.

**Say:**
> "If you find yourself typing the same 3-sentence ask every day, make a command. Now it's a slash command."

### Plan mode (2 min)

**Do:**
1. Switch chat mode from Agent to **Plan**.
2. Paste:

```
Plan a multi-step analysis to identify which active subscribers
are most at risk of voluntary churn in the next 60 days.
Don't execute yet — just propose the plan.
```

**What you expect:** The agent produces a structured plan (data to pull, features, scoring approach, validation, output) **without writing code**. You can then approve to execute or iterate.

**Say:**
> "Plan mode is great when scope is ambiguous or stakes are high. It costs you 30 seconds to read the plan and saves you 20 minutes of fixing the wrong thing."

---

## 33:00 – 38:00 — Round 5: The $2M Finale (slide 15)

**Say:**
> "Now we put it together. I'm loading three more pre-built skills — churn retention, repeat reduction, and an investment-comparison playbook — and asking the question Growth is actually asking leadership."

**Do:**
1. In the terminal:

```powershell
Copy-Item STARTER_KIT/skills/churn-retention -Destination .cursor/skills -Recurse
Copy-Item STARTER_KIT/skills/repeat-reduction -Destination .cursor/skills -Recurse
Copy-Item STARTER_KIT/skills/investment-compare -Destination .cursor/skills -Recurse
```

2. **Reload Cursor window.**
3. New chat. Paste:

```
We have $2M to invest. Compare three options:
1) acquisition campaigns
2) voluntary churn prevention (retention offers in fiber ZIPs)
3) repeat-call reduction

For each: annual value in dollars, confidence, time to impact, and key risk.
End with a recommendation on where the $2M actually goes.
```

**What you expect:**
- A 3-row comparison table.
- Acquisition: ~$496k gross, **negative Year-1 net** — don't lead here.
- Churn prevention: ~$2.6–3.0M net annualized.
- Repeat reduction: ~$5.1M total ($160k direct + $4.9M after 50% causal discount).
- Recommendation: put $2M into a mix of churn prevention and repeat reduction; do not fund acquisition first.

**Say:**
> "Same 5 CSVs we started with. Different answer because the agent now has Metromobile's playbook in front of it. That's the gap Rules and Skills close."

---

## 38:00 – 40:00 — Take-home (slide 16)

**Say:**
> "Five things you'll do in your own projects:"

1. **Start in Agent mode** with your files loaded — explore.
2. **After the third time you give the same instruction**, turn it into a Rule.
3. **When the same analysis runs on different data**, turn it into a Skill.
4. **For your most frequent one-liner asks**, make a Command (`/name`).
5. **Use Plan mode** when you'd ask a junior analyst to write a one-pager first.

> "Repo: github.com/ephemeralme/metromobile-demo-data. Branch `demo`. Take it home. Build your own."

---

## Recovery — if anything goes wrong

| Problem | Move |
|---|---|
| Agent gives the same Round 1 answer in Round 2 | Reload Window. Open New Chat. |
| Rule didn't seem to fire | Check `.cursor/rules/metromobile.mdc` exists. Check `alwaysApply: true`. Reload. |
| Skill didn't fire | The user prompt didn't match the description. Reword to include "campaign ROI" or "$2M". |
| Live-typing the rule/skill is breaking | Stop typing. Copy from `STARTER_KIT/`. Keep the demo moving. |
| Agent is taking >3 min on a round | Talk to the slide. Or use the "Expected" section to tell the room what's about to appear. |
| Whole `.cursor/` setup is broken | Last resort: `Copy-Item STARTER_KIT/rules,STARTER_KIT/skills,STARTER_KIT/commands -Destination .cursor -Recurse`, Reload, jump to the finale. |

## Reset between rehearsals

```powershell
Remove-Item .cursor -Recurse -Force -ErrorAction SilentlyContinue
```

Reload Cursor. You're back to Round 1.
