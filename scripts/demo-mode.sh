#!/usr/bin/env bash
# Usage: ./scripts/demo-mode.sh raw|rules|skills
set -euo pipefail

MODE="${1:?Usage: demo-mode.sh raw|rules|skills}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MODES_DIR="$ROOT/_cursor_modes"
ACTIVE="$ROOT/.cursor"

echo "Metromobile demo mode: $MODE"
echo "Project root: $ROOT"

rm -rf "$ACTIVE"

if [[ "$MODE" == "raw" ]]; then
  echo ""
  echo "[raw] No rules or skills — agent runs on prompts + CSVs only."
else
  SRC="$MODES_DIR/$MODE/.cursor"
  if [[ ! -d "$SRC" ]]; then
    echo "Mode template not found: $SRC" >&2
    exit 1
  fi
  cp -R "$SRC" "$ACTIVE"
  RULES=$(find "$ACTIVE/rules" -name '*.mdc' 2>/dev/null | wc -l | tr -d ' ')
  SKILLS=$(find "$ACTIVE/skills" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
  echo ""
  echo "[$MODE] Installed .cursor/  Rules: $RULES  Skills: $SKILLS"
fi

echo ""
echo ">>> Reload Cursor window before running prompts."
