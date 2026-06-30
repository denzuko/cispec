---
title: "hash-at-collection"
term: "hash-at-collection"
core: false
requiredFor: ["evidence Change Items"]
related: ["custody-chain", "owner"]
docOid: "1.3.6.1.4.1.42387.5.1"
docGuid: "4d5c75e6-697d-5f7e-9c93-4781a7792483"
date: 2026-06-30
draft: false
---

`org.cispec.hash-at-collection` records a cryptographic hash of an
evidence Change Item, calculated at the moment of collection, before
any further handling.

## Value format

A hash algorithm and digest, colon-separated.

```sh
org.cispec.hash-at-collection=sha256:9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08
```

## Conformance

`org.cispec.hash-at-collection` is REQUIRED for evidence Change Items
intended for external verification.

## Attestation

`hash-at-collection` is the most directly attestable term in the
namespace: a cryptographic hash is, by construction, independently
verifiable by anyone with access to the original artefact — no trust
in the asserting organisation is required at all. This is the
strongest form of attestation any term in this specification provides,
and the model other attestation-bearing terms (`custody-chain`,
provenance-backed `version` claims) approximate but do not fully
reach, since they typically still depend on trusting a signing
authority or collecting party at some point in the chain.

## Resolution and relation

`hash-at-collection` does not form a meaningful reverse-lookup edge —
each value is specific to one artefact at one point in time, not a
shared attribute multiple Change Items would have in common.
