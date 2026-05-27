# Metromobile Cursor Demo — Facilitator Script

**Branch:** `demo`  
**Goal:** Same CSVs, same prompts — different answers when you change **Raw → Rules → Skills**.

## Before you start

1. Open this folder in Cursor on branch **`demo`**.
2. Run mode switch from project root (PowerShell):

```powershell
.\scripts\demo-mode.ps1 raw    # Act 1
.\scripts\demo-mode.ps1 rules  # Act 2
.\scripts\demo-mode.ps1 skills # Act 3
```

3. **Reload Window** after each switch (`Ctrl+Shift+P` → Developer: Reload Window).
4. Use prompts from [PROMPTS.txt](PROMPTS.txt). Do not open `ANSWER_KEY.md` in the agent chat.

---

## Act 1 — Raw (~8 min)

```powershell
.\scripts\demo-mode.ps1 raw
```

| Prompt | What to paste | What the audience should see |
|--------|---------------|------------------------------|
| **3** | Last 3 months churn + monthly rate + revenue at risk | **~5,400 events**, **~3%** monthly, **~$1.4–5M** “at risk” using **all** disconnect types; no voluntary filter |
| **7** | Call volume segments vs voluntary churn | **Heavy ~25%** vs light ~3%; agent may say repeats **“drive”** churn |

**Say:** “No rules, no skills — just the model and the files.”

---

## Act 2 — Rules (~8 min)

```powershell
.\scripts\demo-mode.ps1 rules
```

| Prompt | What changes |
|--------|----------------|
| **3** (same text) | Defaults to **voluntary** churn; lower “at risk”; mentions non-payment separately |
| **4** | Breakdown by `disconnect_type`; **non_payment = not addressable** |

**Say:** “Rules encode how *we* think about the business — always on, every chat.”

---

## Act 3 — Skills (~10 min)

```powershell
.\scripts\demo-mode.ps1 skills
```

| Prompt | What changes |
|--------|----------------|
| **5** or **8** | Full **NPV / repeat-reduction math** with tables; **50% causal** on prompt 8 only |
| **9** | Investment **comparison table** + clear **$2M recommendation** |

**Say:** “Skills are playbooks for specific analyses — formulas, outputs, ballpark checks.”

---

## Optional encore

Same **Prompt 2** across modes:

- **Raw:** optimistic revenue, weak ROI discipline  
- **Skills:** incremental connects, net Year-1 negative, lifetime breakeven  

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Answers look the same | Confirm `.cursor` removed in raw; reload window |
| Skills not firing | Mention “Metromobile” + topic (churn, campaigns, repeat reduction) |
| Wrong branch | `git checkout demo` |

See [ANSWER_KEY.md](ANSWER_KEY.md) for expected numbers.
