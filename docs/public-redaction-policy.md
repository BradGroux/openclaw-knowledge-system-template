# Public Redaction Policy

Use this policy before publishing any internal knowledge artifact.

## Goal
Publish useful operating patterns without exposing private strategy, customer data, or proprietary implementation detail.

## Redaction rules

### Remove or replace
- Personal identifiers (emails, phone numbers, UUIDs, chat IDs)
- Internal hostnames, ports, local paths, tunnel domains
- Customer names and private project code names
- Credentials, tokens, auth headers, cookies
- Internal-only model routing and cost/security details
- Product differentiators not intended for public disclosure

### Keep
- Process structure (raw → compiled flow)
- Metadata schema examples
- Cadence patterns
- Quality gates and review discipline
- Generic templates and sample scripts

## Replacement strategy
- Replace entities with neutral labels:
  - `Customer A`, `Internal Service`, `Agent-1`
- Replace paths with portable examples:
  - `research/knowledge-system/...`
- Replace dates/times only when they reveal sensitive timeline info

## Before/After example

### Before (internal)
```md
Source: <local-user-path-redacted>/private/client-x/notes.md
Owner: john@company.com
Host: vk-api.internal.company.local:3001
```

### After (public)
```md
Source: research/knowledge-system/raw/product/2026-04-01/notes.snapshot.md
Owner: team-owner
Host: internal-api (redacted)
```

## Publish gate
Do not publish until:
1. `scripts/sanitize-scan.sh` passes
2. Human reviewer signs off
3. Sensitive-content checklist is fully checked
