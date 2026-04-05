# Sanitization Checklist (Pre-Publish)

Run this checklist before pushing public:

## Identity and org hygiene
- [ ] Replace personal names unless intentionally public
- [ ] Remove private customer/client names
- [ ] Remove internal-only code names

## Secrets and credentials
- [ ] No API keys, tokens, cookies, passwords
- [ ] No OAuth dumps or auth headers
- [ ] No credential helper config values

## Infrastructure privacy
- [ ] No local absolute paths
- [ ] No private hostnames, ports, tunnel URLs
- [ ] No internal repository URLs

## Data safety
- [ ] No email addresses, phone numbers, IDs
- [ ] No private message transcripts
- [ ] No proprietary customer data

## Provenance and integrity
- [ ] Keep conceptual architecture and method intact
- [ ] Keep sample data synthetic/sanitized
- [ ] Keep acknowledgements/credits accurate
