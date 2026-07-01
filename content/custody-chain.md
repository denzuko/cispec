---
title: "custody-chain"
term: "custody-chain"
core: false
requiredFor: ["evidence Change Items"]
recommendedFor: ["any CI under regulatory traceability requirements — pharmaceutical supply chain, medical devices, weapon system components, classified documents, ITAR-controlled items"]
related: ["owner", "checksum", "organization"]
docOid: "1.3.6.1.4.1.42387.2.5"
docGuid: "af7616e3-6c41-59af-947e-cd4af86b6d69"
date: 2026-06-30
draft: false
---

`org.cispec.custody-chain` is a bare reference pointing at the
chronological custody record for a Change Item — it does not carry
the record itself. The actual chronological log is a time-series
record, not a single fact, and does not fit the `key=value` shape
this namespace uses for every other term; it lives in the
organisation's own evidence-management, supply-chain, or traceability
system. `custody-chain` is the citation, not the citation's content.

Custody tracking applies wherever regulatory or legal frameworks
require unbroken provenance: digital forensic evidence (ISO/IEC
27037:2012), pharmaceutical supply chain (GDP, cold chain), medical
device traceability (FDA UDI, MDR), weapon system components
(ITAR/EAR), classified documents, and any physical asset under
chain-of-custody requirements for audit or litigation.

The processes the referenced record is expected to satisfy —
identification, collection, acquisition, preservation — are described
in [ISO/IEC 27037:2012](https://www.iso.org/standard/44381.html).
This term attests that a custody record *exists and is unbroken*. It
does not attest findings or interpretation; that remains a human,
certified function outside this specification's scope.

## Value format

A bare reference string: a hash, a URI, or a case identifier the
organisation's own evidence system resolves. This specification does
not mandate a specific encoding, the same way `oid` does not mandate
how a client's own registry tree is structured beyond the OID grammar
itself.

```sh
org.cispec.custody-chain=case-2026-0142
org.cispec.custody-chain=sha256:9f86d081884c7d659a2feaa0c55ad015a3bf4f1
```

## Conformance

`org.cispec.custody-chain` is REQUIRED for evidence Change Items
intended for external verification — audit, regulatory, or
court-admissible use.

## Attestation

`custody-chain` is inherently attestation-bearing — unlike most core
and extended keys, where the question is *whether* attestation
applies, here it is the entire point of the term. The value is
expected to be independently verifiable: a hash chain or log reference
that an auditor, regulator, or court can check without trusting the
asserting organisation's own infrastructure, consistent with the
auditability and repeatability principles in ISO/IEC 27037:2012. A
`custody-chain` value that only resolves or verifies inside the
collecting organisation's private systems does not meet this bar — see
the [resolution requirement](/#minting-new-terms) on the root page,
which applies with particular force here given evidentiary stakes.

## Resolution and relation

Every Change Item sharing the same `custody-chain` case reference
forms an edge in the namespace's knowledge graph — "every item of
evidence under case `2026-0142`" is a real, expected query, answered
by the organisation's own evidence-management system, not by this
specification.
