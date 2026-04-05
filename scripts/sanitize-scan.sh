#!/usr/bin/env bash
# sanitize-scan.sh — quick public-safety grep before publishing
set -euo pipefail

ROOT="${1:-.}"

echo "Scanning $ROOT for common sensitive patterns..."

PATTERN='(/Users/|/home/|localhost|127\.0\.0\.1|api[_ -]?key|token|password|secret|BEGIN (RSA|OPENSSH) PRIVATE KEY|ghp_[A-Za-z0-9]+|xox[baprs]-[A-Za-z0-9-]+|AKIA[0-9A-Z]{16})'

if rg -n -i "$PATTERN" "$ROOT"; then
  echo "⚠️ Potential sensitive content found. Review before publishing."
  exit 2
fi

echo "✅ No obvious sensitive patterns found."
