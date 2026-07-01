---
title: "case-id"
term: "case-id"
core: false
recommendedFor: ["any CI associated with an investigation, legal matter, or formal case"]
related: ["custody-chain", "checksum", "owner", "retention", "classification"]
docOid: "1.3.6.1.4.1.42387.2.6.5.1"
docGuid: "354202bb-76bc-5709-9310-7e54cc05f03e"
date: 2026-06-30
draft: false
---

`org.cispec.case-id` records the investigation, legal matter, or
formal case a Change Item is associated with. This is distinct from
[`org.cispec.custody-chain`](/custody-chain/), which points at the
chronological custody record — `case-id` identifies the *matter*
the CI belongs to, while `custody-chain` records the *handling
history* of the CI within that matter.

Applies wherever CIs are collected, examined, or held in relation to
a formal case: criminal investigations, civil litigation, regulatory
enforcement actions, insurance claims, internal HR investigations,
incident response cases, pharmaceutical adverse event reports, and
any other formally numbered matter.

## Value format

The case identifier in whatever numbering scheme the investigating
or managing authority uses.

```sh
org.cispec.case-id=CR-2026-0142
org.cispec.case-id=SEC-ENF-2026-001234
org.cispec.case-id=IR-2026-0089
org.cispec.case-id=FDA-MAUDE-2026-00441
```

## Conformance

`org.cispec.case-id` is RECOMMENDED for any CI associated with a
formal investigation or legal matter. Not REQUIRED for Declared
conformance.

## Attestation

`case-id` is attestable against the records of the investigating or
managing authority. For regulatory matters the case number is
typically verifiable against public enforcement databases.

## Resolution and relation

Every CI sharing the same `case-id` forms a real, expected query —
"every CI associated with case CR-2026-0142" is the fundamental
evidence inventory query for any case management system.
