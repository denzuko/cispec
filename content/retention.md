---
title: "retention"
term: "retention"
core: false
recommendedFor: ["any CI whose records are subject to a formal retention schedule"]
related: ["classification", "custody-chain", "owner", "boundary"]
docOid: "1.3.6.1.4.1.42387.2.8.1"
docGuid: "b87b96e5-f583-5c4e-8cfc-49b0bb9739a7"
date: 2026-06-30
draft: false
---

`org.cispec.retention` records the retention schedule governing how
long records about a Change Item must be kept. It is a pointer to the
applicable schedule — not the schedule text itself — the same pointer
pattern as [`org.cispec.custody-chain`](/custody-chain/).

Retention obligations attach to Change Items across domains: HIPAA
mandates medical record retention minimums, NARA records disposition
authorities govern federal agency records, SEC rules govern financial
records, DoD records management policies govern military programme
records, FDA 21 CFR Part 11 governs pharmaceutical manufacturing
records, and GDPR Article 5 governs personal data retention in the EU.
None of these are exclusively IT concerns — a physical pharmaceutical
batch record, a weapons system maintenance log, and a patient chart all
carry retention obligations.

## Value format

A retention schedule identifier, a regulatory citation, or a URI
pointing to the applicable disposition authority or retention policy.

```sh
org.cispec.retention=NARA-GRS-3.1
org.cispec.retention=HIPAA-6Y
org.cispec.retention=21-CFR-11-3Y
org.cispec.retention=SEC-17a-4-7Y
org.cispec.retention=https://records.example.org/schedules/phi-retention
```

## Conformance

`org.cispec.retention` is RECOMMENDED for any CI whose associated
records are subject to a formal retention schedule. It is not REQUIRED
for Declared conformance.

## Attestation

`retention` is independently attestable where the value is a
resolvable regulatory citation or URI — an auditor can verify the
schedule exists and confirm the retention obligation. A bare internal
identifier is self-asserted.

## Resolution and relation

Every Change Item sharing the same `retention` value forms an edge in
the namespace's knowledge graph — "every CI governed by HIPAA-6Y
retention" is a real, expected query for records management audits and
disposition reviews.
