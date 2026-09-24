#!/bin/bash
# SessionStart hook for Claude Code on the web.
# This is a static GitHub Pages site with no dependency manifests, so there is
# nothing to install for the site itself. The hook only provides tooling so
# cloud sessions can lint HTML and syntax-check the runtime scripts.
set -euo pipefail

# Only run in remote (cloud) sessions.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# HTML linter (idempotent: skipped when already present).
if ! command -v html-validate >/dev/null 2>&1; then
  npm install -g html-validate >/dev/null 2>&1 || echo "warning: could not install html-validate"
fi

# Quick sanity checks so a broken environment is visible at startup.
node --version
python3 --version
command -v html-validate >/dev/null 2>&1 && html-validate --version

echo "Session start hook complete."
echo "Lint HTML:      html-validate index.html viz/*.html"
echo "Check scripts:  node --check assets/js/support.js assets/js/image-slot.js"
echo "Preview site:   python3 -m http.server 8000"
