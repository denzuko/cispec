---
title: "custody-chain"
term: "custody-chain"
core: false
requiredFor: ["evidence Change Items"]
related: ["owner", "hash-at-collection", "organization"]
docOid: "1.3.6.1.4.1.42387.5"
docGuid: "99ac3fc9-035d-58b9-99e2-41969039a970"
date: 2026-06-30
draft: false
---

`org.cispec.custody-chain` records the chronological custody record for
a Change Item handled as digital evidence — who collected it, who has
held it, and any transfers, consistent with the identification,
collection, acquisition, and preservation processes described in
[ISO/IEC 27037:2012](https://www.iso.org/standard/44381.html).

This term attests preservation integrity — that custody has been
tracked and the record is unbroken. It does not attest findings or
interpretation; that remains a human, certified function outside this
specification's scope.

## Value format

A structured value referencing the custody record (a hash chain, a log
reference, or a pointer to the organisation's own evidence-management
system). This specification does not mandate a specific encoding.

```sh
org.cispec.custody-chain=sha256:9f86d0...:case-2026-0142
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
