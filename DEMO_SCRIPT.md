# Metromobile Cursor Demo — 40-Minute Facilitator Script (English)

**You do not need to be a data analyst.** You are showing one idea: *same data, same questions — better answers when Cursor has context (rules) and playbooks (skills).*

**Branch:** `demo` on https://github.com/ephemeralme/metromobile-demo-data

---

## The one sentence story (say this once at the start)

> “Metromobile is a fake broadband company in five CSV files. We’ll ask Cursor the same business questions three times — with nothing extra, then with **rules**, then with **skills** — and you’ll see how the answers change.”

---

## Before the room arrives (10 min early)

1. Open folder in Cursor: `metromobile-demo-data` (branch **demo**).
2. Open in a second window (your eyes only): `ANSWER_KEY.md` — do **not** share screen on this file.
3. Open terminal in project folder.
4. Test once:

```powershell
.\scripts\demo-mode.ps1 raw
```

5. Confirm: no `.cursor` folder in the project (raw mode).
6. Put this file on a second monitor or print pages 2–3 (prompts to paste).

---

## The only technical move you repeat 3 times

```powershell
.\scripts\demo-mode.ps1 raw      # Act 1
.\scripts\demo-mode.ps1 rules    # Act 2
.\scripts\demo-mode.ps1 skills   # Act 3
```

After **each** command:

1. **Ctrl+Shift+P** → type **Reload Window** → Enter  
2. **New Chat** in Cursor (do not reuse old chat)  
3. Tell the room which act you’re on (Raw / Rules / Skills)

---

## 40-minute timeline

| Time | What you do |
|------|-------------|
| 0:00–5:00 | Intro + show the 5 CSV files + run Act 1 setup |
| 5:00–15:00 | **Act 1 — Raw** (2 prompts) |
| 15:00–18:00 | Explain Rules vs Raw (no agent yet) |
| 18:00–28:00 | **Act 2 — Rules** (2 prompts) |
| 28:00–31:00 | Explain Skills (no agent yet) |
| 31:00–38:00 | **Act 3 — Skills** (2 prompts) |
| 38:00–40:00 | Wrap-up + Q&A |

---

## 0:00–5:00 — Intro (talk, minimal typing)

**Say:**

- “This is synthetic demo data, not a real customer.”
- “50,000 subscribers in the file; slides may say 500k for story purposes.”
- “We’ll use **Agent chat** only — no coding required from me.”

**Show in Explorer:** `demo_customers.csv`, `demo_churns.csv`, `demo_calls.csv`, `demo_campaigns.csv`, `demo_market.csv`

**Run:**

```powershell
.\scripts\demo-mode.ps1 raw
```

Reload Window → New Chat.

---

## 5:00–15:00 — Act 1: RAW (~10 min)

**Say:** “No rules, no skills — just the AI and the files.”

### Prompt A (~5 min agent time) — paste all of this:

```
How many customers churned in the last 3 months? What's the monthly churn rate? What's the total annual revenue at risk if this continues?
```

**While it runs, say:** “Notice it’s counting churn events — it may not split voluntary vs collections yet.”

**You want to hear / see roughly:**

- ~4,650–5,000 churns (all types)
- ~3% monthly churn
- A big “revenue at risk” number (often $1M–$5M range)

**If it goes wrong:** “That’s fine — raw mode is supposed to be messy. We’ll fix context in Act 2.”

---

### Prompt B (~5 min agent time) — paste:

```
Join calls to churns (voluntary only). Segment customers by call volume: Light (1-2), Medium (3-5), High (6-10), Heavy (10+). What's the churn rate for each segment?
```

**You want:**

- Light ~3%, Heavy ~25%
- Language like “drive” or “cause” churn (that’s the teaching moment for later)

**Say after:** “Heavy callers look scary. In Act 2 we’ll see how **rules** change the framing without changing the data.”

---

## 15:00–18:00 — Bridge: what are Rules? (talk only)

**Say:**

- “**Rules** = how our company wants questions interpreted — always on, every chat.”
- “Example: lead with **voluntary churn** (what retention can fix), separate **non-payment** (collections).”
- “Example: calls and churn are **correlated**, not automatically causal.”

**Do not open** `.cursor/rules` on screen unless audience asks — optional.

**Run:**

```powershell
.\scripts\demo-mode.ps1 rules
```

Reload → New Chat.

---

## 18:00–28:00 — Act 2: RULES (~10 min)

**Say:** “Same questions — watch what changes.”

### Prompt A — same as Act 1 Prompt A (copy again):

```
How many customers churned in the last 3 months? What's the monthly churn rate? What's the total annual revenue at risk if this continues?
```

**You want:**

- **Voluntary churn first** (~2,100–2,200 in last 3 months)
- Lower “at risk” than Act 1 headline
- Mention of other disconnect types

**Say:** “Same CSVs — different **priorities** because of rules.”

---

### Prompt B — paste (new):

```
Wait - break down the churns by disconnect_type. What percentage is each type? What's the average revenue and CLV for each?
```

**You want:**

- ~49% voluntary, ~37% non_payment, ~10% involuntary, ~5% relocation
- Non-payment lower revenue — **collections track**, not retention offers

**Say:** “Rules don’t run the big ROI spreadsheet — that’s what **skills** are for.”

---

## 28:00–31:00 — Bridge: what are Skills? (talk only)

**Say:**

- “**Skills** = step-by-step playbooks for specific analyses (campaign ROI, retention offer, investment compare).”
- “Rules = judgment; Skills = recipes and tables.”

**Run:**

```powershell
.\scripts\demo-mode.ps1 skills
```

Reload → New Chat.

**Optional show in Explorer:** `.cursor/skills/` has 5 folders — names only, don’t read them all.

---

## 31:00–38:00 — Act 3: SKILLS (~7 min + buffer)

### Prompt C (~4 min) — paste:

```
Build the final repeat reduction case:
	A. Direct savings = reduce repeat rate by 5pp x $8/call, annualized
	B. Indirect = heavy callers excess churn rate x heavy caller count x avg CLV x 50% causal discount.
Give me both numbers and total.
```

**You want:**

- A ≈ **$160,000**
- B ≈ **$4.9M**
- Total ≈ **$5.1M**
- Assumptions listed (5pp, 50% causal)

---

### Prompt D (~4 min) — paste:

```
Build a comparison table: Investment option, Annual value ($), confidence level, time to impact, key risk. Do the analysis for all three plans - acquisition, churn prevention, repeat reduction

What's your recommendation on where to invest the $2M and expected outcome
```

**You want:**

- Table with 3 rows
- Recommendation: **not** lead with $2M acquisition; prefer churn prevention / repeat reduction

---

## 38:00–40:00 — Close

**Say:**

| Layer | Analogy | What changed today |
|-------|---------|-------------------|
| Raw | New hire, files only | Big scary churn $, loose language |
| Rules | Employee handbook | Voluntary-first, collections separate, careful wording |
| Skills | Playbooks | Dollar ROI, tables, recommendation |

**Optional if time:** “Where should $2M go?” — you already answered in Prompt D.

**Q&A backup line:** “If answers look identical, we forgot to reload window or we reused the old chat.”

---

## Emergency cheatsheet

| Problem | Fix |
|---------|-----|
| Same answer as last act | `demo-mode` again → Reload → **New Chat** |
| Agent slow | Talk through “what we expect” from ANSWER_KEY |
| Wrong numbers | Direction matters more than exact $ — compare Act 1 vs 2 headline |
| You’re lost | Read the one-sentence story and run the next prompt |

---

## What’s in Rules vs Skills (if someone asks)

**Rules (2 files):**

- `metromobile-domain.mdc` — voluntary first, disconnect types, `is_repeat_7d`, fiber flag
- `metromobile-analytics-standards.mdc` — gross vs net, annualize ×2, confidence/risks

**Skills (5 playbooks):**

- campaign-roi · churn-retention · call-center · repeat-reduction-case · investment-compare

**Raw:** none of the above.

---

## Optional stretch (if you finish early)

**Prompt 5** (retention NPV) — skills mode only — see PROMPTS.txt.

Do **not** try to run all 9 prompts in 40 minutes.
