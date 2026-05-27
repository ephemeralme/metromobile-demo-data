# Metromobile Demo Data

Synthetic datasets for a broadband analytics exercise. Metromobile is modeled as a ~500k-subscriber ISP; these demo files contain **50,000** customer records scaled for practice analysis.

## Files

| File | Description |
|------|-------------|
| `demo_customers.csv` | Subscriber base: plan, tenure, revenue, CLV |
| `demo_churns.csv` | Disconnect events by type and reason |
| `demo_calls.csv` | Contact center calls and repeat flags |
| `demo_campaigns.csv` | Acquisition campaign test/control results by ZIP |
| `demo_market.csv` | ZIP-level market and competitive context |

## Branches

| Branch | Purpose |
|--------|---------|
| `master` | Data + [PROMPTS.txt](PROMPTS.txt) only |
| **`demo`** | Cursor capabilities demo: rules, skills, `demo-mode` scripts |

## Cursor demo (branch `demo`)

Compare **Raw → Rules → Skills** on the same prompts:

```powershell
git checkout demo
.\scripts\demo-mode.ps1 raw     # Act 1 — no .cursor/
.\scripts\demo-mode.ps1 rules   # Act 2 — domain guardrails
.\scripts\demo-mode.ps1 skills  # Act 3 — ROI playbooks
```

Reload Cursor after each switch. Facilitator guide: [DEMO_SCRIPT.md](DEMO_SCRIPT.md).

## Period

Most event data spans **October 2025 – March 2026**.
