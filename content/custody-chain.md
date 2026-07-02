---
title: "custody-chain"
term: "custody-chain"
core: false
requiredFor: ["evidence Change Items"]
recommendedFor: ["any CI under regulatory traceability requirements — pharmaceutical supply chain, medical devices, weapon system components, classified documents, ITAR-controlled items"]
related: ["checksum", "owner", "case-id", "collection-method", "retention", "organization"]
docOid: "1.3.6.1.4.1.42387.2.5"
docGuid: "af7616e3-6c41-59af-947e-cd4af86b6d69"
date: 2026-06-30
draft: false
---

`org.cispec.custody-chain` is a reference to the chronological custody
record for a Change Item — who has held it, when, and under what
conditions. The value points to that record; it does not contain the
record itself. The actual log lives in the organisation's own evidence
management, supply chain, or traceability system.

Custody tracking is required wherever an unbroken provenance trail
matters: digital forensic evidence (ISO/IEC 27037:2012), pharmaceutical
supply chain (GDP, cold chain), medical device traceability (FDA UDI,
MDR), weapon system components (ITAR/EAR), classified document handling,
and physical assets under chain-of-custody requirements for audit or
litigation.

## Value format

A bare reference: a case identifier, a hash, or a URI the
organisation's own evidence or traceability system resolves.

```sh
org.cispec.custody-chain=case-2026-0142
org.cispec.custody-chain=sha256:9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08
```

## Conformance

`org.cispec.custody-chain` is REQUIRED for evidence Change Items
intended for external verification — audit, regulatory, or
court-admissible use. It is RECOMMENDED for any CI under regulatory
traceability requirements.

## Attestation

`custody-chain` attests that a custody record exists and is unbroken.
It does not attest findings or interpretation — that remains a human,
certified function outside this specification's scope. Whether the
referenced record is authentic is a question for the system that holds
it, not for this label.

## Resolution and relation

`custody-chain` pairs with [`checksum`](/checksum/) (integrity of
the artefact itself) and [`case-id`](/case-id/) (the investigation
or matter the CI is associated with).
