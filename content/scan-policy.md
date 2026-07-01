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

> **Experimental.** This term passes both minting tests — it identifies
> a real fact about a tracked CI affecting service delivery and
> compliance, and no existing term covers it — but its applicability
> outside vulnerability management and FedRAMP/compliance scanning
> contexts has not been stress-tested across the full CI scope this
> specification covers. Implementations using this term should expect
> the value format and applicability guidance to be refined in future
> versions. Feedback from real implementations will determine whether
> this term advances to Stable status.

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
