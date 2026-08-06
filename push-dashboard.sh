#!/bin/bash
# push-dashboard.sh
# Pushes the latest dashboard to GitHub Pages after any update.
# Called automatically by Hermes after reno files change.

set -e

DASHBOARD_DIR="$HOME/projects/dashboard"
TASKS="$HOME/.hermes/reno-tasks.md"
SHOPPING="$HOME/.hermes/reno-shopping.md"

cd "$DASHBOARD_DIR"

# Check if there are changes to push
if git diff --quiet HEAD index.html 2>/dev/null; then
  echo "No dashboard changes to push."
  exit 0
fi

git add index.html
git commit -m "dashboard: auto-update $(date '+%Y-%m-%d %H:%M')"
git push

echo "Dashboard pushed to https://mckgreen.github.io/dashboard"
