---
title: "custody-chain"
term: "custody-chain"
core: false
requiredFor: ["evidence Change Items"]
related: ["owner", "hash-at-collection", "organization"]
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
