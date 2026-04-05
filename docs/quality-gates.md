# Knowledge Quality Gates

These gates prevent low-trust synthesis from entering compiled knowledge.

## Gate 1: Metadata completeness (required)
Each raw source must include:
- `source`
- `captured_at`
- `tags`
- `confidence`

If any are missing, compile pass is **warning/fail** depending on your policy.

## Gate 2: Evidence minimum
A compiled synthesis should reference:
- at least 2 raw artifacts for medium-impact topics
- at least 3+ raw artifacts for high-impact decisions

## Gate 3: Contradiction check
Before promoting compiled output:
- detect conflicting owner/date/status statements
- either reconcile conflict or record unresolved contradiction section

## Gate 4: Freshness check
For active streams:
- mark as stale if no raw updates for 30+ days
- avoid using stale compiled pages as sole planning input

## Gate 5: Lineage integrity
Every compiled page must link back to raw evidence and latest run note.

## Gate 6: Actionability
Active compiled pages must end with:
- next actions
- owner
- due window (or explicit "TBD")
