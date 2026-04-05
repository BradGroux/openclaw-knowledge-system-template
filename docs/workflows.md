# Workflow Examples

## Daily ingest + compile
```bash
DATE=$(date +%F)
mkdir -p research/knowledge-system/raw/product/$DATE
# add snapshots + SOURCES.md
bash scripts/knowledge-compile.sh "$DATE"
```

## Weekly health check (Tue/Fri)
```bash
# 1) stale pages
# 2) broken lineage links
# 3) conflicting facts
# 4) missing next actions
```

## Pre-publish sanitize
```bash
bash scripts/sanitize-scan.sh .
```

## Weekly synthesis artifact
```bash
cp templates/weekly-synthesis.md examples/weekly-synthesis/$(date +%F)-weekly.md
# fill sections and add lineage links
```
