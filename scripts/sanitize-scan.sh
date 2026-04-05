#!/usr/bin/env bash
# sanitize-scan.sh — quick public-safety grep before publishing
set -euo pipefail

ROOT="${1:-.}"

echo "Scanning $ROOT for common sensitive patterns..."

# Focus on high-signal secret/path patterns to avoid false positives in documentation text.
PATTERN='(ghp_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|xox[baprs]-[A-Za-z0-9-]{20,}|AKIA[0-9A-Z]{16}|BEGIN (RSA|OPENSSH) PRIVATE KEY|/Users/[A-Za-z0-9._-]+/|/home/[A-Za-z0-9._-]+/|https?://[^[:space:]]*(internal|corp|local|lan)[^[:space:]]*)'

if rg -n -i "$PATTERN" "$ROOT"; then
  echo "⚠️ Potential sensitive content found. Review before publishing."
  exit 2
fi

echo "✅ No obvious sensitive patterns found."
