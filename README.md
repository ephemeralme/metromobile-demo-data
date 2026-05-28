# Metromobile — Cursor Demo for Analytics

A 40-minute live demo showing how Cursor + agentic AI can turn 5 CSV files into a board-ready business recommendation. Built for UCLA MSBA students.

## The scenario

**Metromobile** is a synthetic broadband ISP. Leadership has **$2M** to invest. Growth wants to spend it on acquisition campaigns. Your job as the new analyst: tell them whether that's the right call.

By the end of the demo, students see Cursor's **Agent**, **Rules**, **Skills**, **Commands**, and **Plan mode** working together on this exact question — and they leave with a checklist for using all of these in their own projects.

## Files

| File | What it contains |
|---|---|
| `demo_customers.csv` | 50,000 subscriber records: plan, tenure, revenue, CLV |
| `demo_churns.csv` | Disconnect events with `disconnect_type` and reason |
| `demo_calls.csv` | Contact center calls with `is_repeat_7d` flag |
| `demo_campaigns.csv` | Test/control acquisition campaigns by ZIP and channel |
| `demo_market.csv` | ZIP-level competitive context (`has_fiber_competitor`) |

Period: October 2025 – March 2026.

## Demo materials

| File | Purpose |
|---|---|
| `DEMO_SCRIPT.md` | Minute-by-minute facilitator guide |
| `Metromobile_Demo.pptx` | 16-slide student deck (with speaker notes) |
| `STARTER_KIT/` | Pre-written rules, skills, and commands (safety net + finale loader) |

## Quick start (facilitator)

1. Open this folder in Cursor.
2. Confirm there is **no** `.cursor/` folder (we start raw).
3. Open `DEMO_SCRIPT.md` on a second monitor.
4. Open `Metromobile_Demo.pptx` for the audience.
5. Follow the script. Build rules and skills live; if you need a safety net, copy from `STARTER_KIT/`.

## What students see

| Round | Cursor capability | Output |
|---|---|---|
| 1 | Agent only (no context) | Generic, all-types churn answer |
| 2 | + 1 Rule (built live) | Voluntary churn first, non-payment separated |
| 3 | + 1 Skill (built live) | Structured $2M campaign ROI analysis |
| 4 | + Command + Plan mode | Quick recap button + multi-step planning |
| 5 | + 3 more skills (loaded from kit) | $2M three-way comparison + recommendation |
