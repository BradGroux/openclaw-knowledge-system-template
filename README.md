# OpenClaw Knowledge System (Sanitized Public Template)

A public, sanitized template of the **raw → compiled knowledge loop** we implemented internally for OpenClaw operations.

> Inspired by ideas shared by [@karpathy](https://github.com/karpathy). Thank you for pushing practical, corpus-first workflows into the mainstream.

## Why this exists

Most teams lose context because notes are fragmented and synthesis is inconsistent.
This template turns that into a repeatable system:

1. Capture source evidence in `raw/`
2. Compile reusable operational knowledge in `compiled/`
3. Preserve lineage links (what synthesis came from which sources)
4. Query corpus first before inventing context from scratch
5. Run periodic health checks for drift, staleness, and contradictions

## Repository structure

```text
research/knowledge-system/
├── README.md
├── index.md
├── raw/
│   └── {stream}/{YYYY-MM-DD}/
│       ├── SOURCES.md
│       └── snapshots...
└── compiled/
    └── {stream}/
        ├── overview.md
        └── runs/{YYYY-MM-DD}.md
scripts/
└── knowledge-compile.sh
```

## Quick start

### 1) Create your first streams

Pick 1-3 streams (examples):
- `product`
- `customer-support`
- `platform-ops`

### 2) Ingest one day of raw evidence

Create:
- `research/knowledge-system/raw/<stream>/<date>/`
- `SOURCES.md` with metadata (`source`, `captured_at`, `tags`, `confidence`)

### 3) Compile it

Run:

```bash
bash scripts/knowledge-compile.sh 2026-04-04
```

This creates deterministic run notes with lineage anchors in `compiled/*/runs/`.

### 4) Query discipline

Before planning/execution asks, check compiled pages first, then raw evidence if needed.

### 5) Health checks

Recommended cadence:
- Daily: ingest + compile for active streams
- Tue/Fri: stale pages, broken links, conflicting facts, missing next actions

### 6) Weekly synthesis

Create one weekly artifact using `templates/weekly-synthesis.md` to capture:
- changed assumptions
- risks
- decisions
- unknowns
- next actions + lineage links

## Sanitization policy (important)

This repo is designed for public sharing. Keep it safe:

- No personal emails, phone numbers, IDs, or tokens
- No private org names unless already public
- No local machine paths (`/Users/...`, `/home/...`)
- No internal hostnames, ports, or private URLs
- No customer data, credentials, secrets, or proprietary prompts

See `docs/sanitization-checklist.md` for a pre-publish checklist.

## Included artifacts

- `research/knowledge-system/README.md` – loop and cadence
- `research/knowledge-system/index.md` – stream index and health checklist
- `scripts/knowledge-compile.sh` – sample ingestion/compile script (sanitized)
- `scripts/sanitize-scan.sh` – pre-publish quick sensitive-pattern scanner
- `docs/public-redaction-policy.md` – what to strip/replace before publishing
- `docs/quality-gates.md` – metadata, contradiction, freshness, lineage gates
- `docs/maturity-model.md` – L1→L5 adoption path
- `docs/workflows.md` – practical daily/weekly command flows
- `docs/metrics.md` – measurable ROI indicators
- `docs/anti-patterns.md` – common failure modes
- `templates/weekly-synthesis.md` – reusable weekly digest template
- `examples/` – sample raw, compiled, and weekly synthesis files

## License

MIT (see `LICENSE`).

## Credits

- Conceptual inspiration: [Andrej Karpathy](https://github.com/karpathy)
- Operational adaptation and template packaging: Digital Meld / OpenClaw workflow patterns
