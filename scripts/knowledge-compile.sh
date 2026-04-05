#!/usr/bin/env bash
# knowledge-compile.sh — sanitized public example
# Usage: scripts/knowledge-compile.sh [YYYY-MM-DD]
set -euo pipefail

DATE_IN="${1:-$(date +%F)}"
if [[ ! "$DATE_IN" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
  echo "Usage: $(basename "$0") [YYYY-MM-DD]"
  exit 1
fi

ROOT="research/knowledge-system"
RAW_BM="$ROOT/raw/brainmeld/$DATE_IN"
COMP_RUN="$ROOT/compiled/brainmeld/runs/$DATE_IN.md"
NOW_UTC="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

mkdir -p "$RAW_BM" "$(dirname "$COMP_RUN")"

if [[ ! -f "$RAW_BM/SOURCES.md" ]]; then
  cat > "$RAW_BM/SOURCES.md" <<EOF
# BrainMeld Raw Sources — $DATE_IN

1. example.snapshot.md
- source: manual test input
- captured_at: $NOW_UTC
- confidence: medium
- tags: example
EOF
fi

RAW_FILES=$(ls -1 "$RAW_BM" | sed 's/^/- /')

cat > "$COMP_RUN" <<EOF
# BrainMeld Compile Run — $DATE_IN

Generated at: $NOW_UTC

## Raw Inputs
$RAW_FILES

## Evidence Links
- [[research/knowledge-system/raw/brainmeld/$DATE_IN/SOURCES]]

## Compilation Notes
- Deterministic run artifact generated from current raw folder.
- Use this note as lineage anchor for downstream synthesis.
EOF

echo "✅ compile pass complete for $DATE_IN"
