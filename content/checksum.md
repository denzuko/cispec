---
title: "checksum"
term: "checksum"
core: false
requiredFor: ["evidence Change Items"]
recommendedFor: ["any CI where integrity verification matters — software, firmware, hardware, pharmaceutical lots, classified documents, physical assets under regulatory traceability"]
related: ["custody-chain", "owner", "version", "algorithm"]
docOid: "1.3.6.1.4.1.42387.2.5.1"
docGuid: "85cbd708-dcd0-5e36-8070-95f46ce00006"
date: 2026-06-30
draft: false
---

`org.cispec.checksum` records a cryptographic hash of a Change Item.
For evidence CIs, the hash MUST be calculated at the moment of
collection, before any further handling, per
[ISO/IEC 27037:2012](https://www.iso.org/standard/44381.html). For
any other CI — software binary, firmware image, pharmaceutical lot,
classified document — the hash typically represents the artefact's
state at build, receipt, or inventory time.

A cryptographic hash is the most directly verifiable fact in this
namespace: anyone with access to the original artefact can
independently confirm or refute the recorded value without trusting
the asserting organisation.

## Value format

Algorithm name and hex digest, colon-separated.

```sh
org.cispec.checksum=sha256:9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08
org.cispec.checksum=sha512:cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e
```

## Conformance

`org.cispec.checksum` is REQUIRED for evidence Change Items intended
for external verification. It is RECOMMENDED for any CI where
integrity verification matters — software builds, firmware images,
pharmaceutical lots, classified documents, and physical assets under
regulatory traceability requirements.

## Attestation

`checksum` is independently verifiable by anyone with access to the
original artefact — no trust in the asserting organisation required.
This is the strongest attestation path available in this namespace.

## Resolution and relation

`checksum` pairs with [`custody-chain`](/custody-chain/) (who has
held the artefact since the hash was taken) and
[`algorithm`](/algorithm/) (the full cryptographic profile of CI
types whose identity is bound to a specific algorithm).
