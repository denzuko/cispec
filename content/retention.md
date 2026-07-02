---
title: "retention"
term: "retention"
core: false
recommendedFor: ["any CI whose records are subject to a formal retention schedule"]
related: ["classification", "custody-chain", "owner", "boundary", "expiry"]
docOid: "1.3.6.1.4.1.42387.2.8.1"
docGuid: "b87b96e5-f583-5c4e-8cfc-49b0bb9739a7"
date: 2026-06-30
draft: false
---

`org.cispec.retention` records the retention schedule governing how
long records about a Change Item must be kept. The value points to
the applicable schedule; it does not contain the schedule itself.

Retention obligations vary by domain and jurisdiction: HIPAA mandates
medical record retention minimums, NARA records disposition authorities
govern federal agency records, SEC rules govern financial records, DoD
records management policies govern military programme records, FDA 21
CFR Part 11 governs pharmaceutical manufacturing records. A physical
pharmaceutical batch record, a weapon system maintenance log, and a
patient chart all carry retention obligations independent of whether
they are stored digitally or physically.

## Value format

A retention schedule identifier, regulatory citation, or URI pointing
to the applicable disposition authority or retention policy.

```sh
org.cispec.retention=NARA-GRS-3.1
org.cispec.retention=HIPAA-6Y
org.cispec.retention=21-CFR-11-3Y
org.cispec.retention=SEC-17a-4-7Y
org.cispec.retention=https://records.example.org/schedules/phi-retention
```

## Conformance

`org.cispec.retention` is RECOMMENDED for any CI whose associated
records are subject to a formal retention schedule. Not REQUIRED for
Declared conformance.

## Attestation

`retention` is independently attestable where the value is a
resolvable regulatory citation or URI — an auditor can verify the
schedule exists and confirm the retention obligation.

## Resolution and relation

"Every CI governed by `HIPAA-6Y` retention" is a real records
management query for audit and disposition reviews. `retention` pairs
with [`expiry`](/expiry/) — the `expiry` date on associated records
is often derived from the `acquired` date plus the retention period.
