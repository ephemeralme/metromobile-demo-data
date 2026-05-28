# STARTER_KIT — facilitator safety net

These are pre-written copies of the **rules, skills, and commands** you'll build live during the demo. Use them if:

- You're running out of time and want to paste instead of type
- You want to confirm exact wording before going on stage
- After the demo, students want to take the working set home

## How to use during the demo

The demo flow expects you to **build live** in the first round, then **paste the finale skills** for the $2M comparison.

### Round 2 — Live-build a Rule (recommended)
Read `STARTER_KIT/rules/metromobile.mdc` so you know what to type. Type it live into `.cursor/rules/metromobile.mdc`.

### Round 3 — Live-build a Skill (recommended)
Read `STARTER_KIT/skills/campaign-roi/SKILL.md` for the structure. Type the frontmatter and steps live into `.cursor/skills/campaign-roi/SKILL.md`.

### Round 4 — Live-build a Command (1 min)
Read `STARTER_KIT/commands/recap.md`. Type into `.cursor/commands/recap.md`.

### Round 5 — Load the finale (paste, don't type)
Copy three skills from `STARTER_KIT/skills/` into `.cursor/skills/`:
- `churn-retention/`
- `repeat-reduction/`
- `investment-compare/`

PowerShell:
```powershell
Copy-Item STARTER_KIT/skills/churn-retention -Destination .cursor/skills -Recurse
Copy-Item STARTER_KIT/skills/repeat-reduction -Destination .cursor/skills -Recurse
Copy-Item STARTER_KIT/skills/investment-compare -Destination .cursor/skills -Recurse
```

Then reload the Cursor window before running the finale prompt.

## If everything goes wrong

Copy the entire kit into `.cursor/`:
```powershell
Copy-Item STARTER_KIT/rules -Destination .cursor/rules -Recurse
Copy-Item STARTER_KIT/skills -Destination .cursor/skills -Recurse
Copy-Item STARTER_KIT/commands -Destination .cursor/commands -Recurse
```

Reload Cursor. Everything is now active. Move directly to the finale prompt.
