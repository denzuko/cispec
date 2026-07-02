---
title: "scan-policy"
term: "scan-policy"
core: false
experimental: true
recommendedFor: ["any CI subject to vulnerability or compliance scanning"]
related: ["exposure", "boundary", "classification", "ip-address", "fqdn"]
docOid: "1.3.6.1.4.1.42387.2.8.4"
docGuid: "14e4a997-48d2-5319-8308-7ab97eadf2d4"
date: 2026-06-30
draft: false
---

> **Experimental.** Use this term in implementations, but treat the
> value format as advisory — it may be refined before this term reaches
> Stable status. If you implement `scan-policy` in production, share
> what value formats you used and what gaps you found. Real-world
> feedback is what advances experimental terms to Stable.

`org.cispec.scan-policy` records the scanning policy applicable to a
Change Item — whether it is included in periodic vulnerability
scanning, whether authenticated scanning is permitted, and what
scanning schedule governs it. This generalises two OSCAL inventory
properties (`is-scanned` and `allows-authenticated-scan`) into a
single structured value.

This is most directly relevant to vulnerability management programmes
and FedRAMP continuous monitoring obligations, but the underlying
fact — "what scanning policy applies to this asset" — is real in any
organisation running a formal vulnerability management programme, not
only FedRAMP environments.

## Value format

A structured value encoding scan inclusion and authentication
permission. The experimental status of this term means the format
may be refined before reaching Stable.

```sh
org.cispec.scan-policy=included:authenticated
org.cispec.scan-policy=included:unauthenticated
org.cispec.scan-policy=excluded:air-gapped
org.cispec.scan-policy=excluded:exempt
```

For OSCAL compatibility: `included:authenticated` corresponds to
`is-scanned=yes` + `allows-authenticated-scan=yes`.

## Conformance

`org.cispec.scan-policy` is RECOMMENDED for any CI subject to
formal vulnerability or compliance scanning programmes. Not REQUIRED
for Declared conformance.

## Attestation

`scan-policy` is attestable against vulnerability management system
configuration records, scan schedules, and exemption documentation.

## Resolution and relation

"Every CI with `scan-policy=excluded:exempt`" is a risk-acceptance
query — assets that are in scope for compliance but exempted from
automated scanning require manual review and compensating controls.
