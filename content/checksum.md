---
title: "checksum"
term: "checksum"
core: false
requiredFor: ["evidence Change Items"]
recommendedFor: ["any CI where integrity verification matters — software, firmware, hardware, pharmaceutical lots, classified documents, physical assets under regulatory traceability"]
related: ["custody-chain", "owner", "version"]
docOid: "1.3.6.1.4.1.42387.2.5.1"
docGuid: "85cbd708-dcd0-5e36-8070-95f46ce00006"
date: 2026-06-30
draft: false
---

`org.cispec.checksum` records a cryptographic hash of a Change Item.
The fact this term expresses is general — any Change Item can carry a
checksum of its own content — but the timing requirement differs by
context: for an evidence Change Item, the checksum MUST be calculated
at the moment of collection, before any further handling, per
[ISO/IEC 27037:2012](https://www.iso.org/standard/44381.html); for a
software, hardware, or ICS Change Item, it typically represents the
artefact's state at build or inventory time.

A previous version of this specification named this term
`hash-at-collection`, scoping it to evidence use only and folding a
timing constraint into the term name itself. The fact being expressed
— a digest of the artefact — is the same regardless of CI type; only
*when* the digest must be taken differs, and that belongs in prose
governing each CI type's conformance requirements, not in the key
name.

## Value format

A hash algorithm and digest, colon-separated.

```sh
org.cispec.checksum=sha256:9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08
```

## Conformance

`org.cispec.checksum` is REQUIRED for evidence Change Items intended
for external verification, where it MUST be calculated at collection
time. It is RECOMMENDED for software, hardware, and ICS Change Items
where artefact integrity verification matters.

## Attestation

`checksum` is the most directly attestable term in the namespace: a
cryptographic hash is, by construction, independently verifiable by
anyone with access to the original artefact — no trust in the
asserting organisation is required at all. This is the strongest form
of attestation any term in this specification provides, and the model
other attestation-bearing terms ([`custody-chain`](/custody-chain/),
provenance-backed [`version`](/version/) claims) approximate but do
not fully reach, since they typically still depend on trusting a
signing authority or collecting party at some point in the chain.

## Resolution and relation

`checksum` does not form a meaningful reverse-lookup edge — each value
is specific to one artefact at one point in time, not a shared
attribute multiple Change Items would have in common.
