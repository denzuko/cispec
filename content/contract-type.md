---
title: "contract-type"
term: "contract-type"
core: false
recommendedFor: ["any CI that is a contract or formal agreement tracked in its own right"]
related: ["counterparty", "contract-ref", "expiry", "acquired", "owner", "retention"]
docOid: "1.3.6.1.4.1.42387.2.6.8.1"
docGuid: "813f67e2-6932-584a-993d-3d64e6a80c78"
date: 2026-06-30
draft: false
---

`org.cispec.contract-type` records the type of a contract or
agreement when that contract is itself tracked as a Change Item —
the category that determines its legal standing, regulatory
obligations, and lifecycle management requirements.

Note the distinction: [`org.cispec.contract-ref`](/contract-ref/)
is a pointer from any CI to the procurement instrument under which
it was acquired. `org.cispec.contract-type` is a property of the
contract CI itself, when the contract document is the thing being
tracked. These serve different purposes — `contract-ref` answers
"what contract governs this server?" while `contract-type` answers
"what kind of agreement is this contract document?"

Applies when contracts themselves are CIs: NDAs, MSAs, SoWs, SLAs,
licensing agreements, government contracts (FAR/DFARS types), data
processing agreements (DPA, under GDPR), interoperability agreements,
memoranda of understanding, and any other formal agreement tracked
in a contract management system.

## Value format

A lower-case slug identifying the contract category.

```sh
org.cispec.contract-type=nda
org.cispec.contract-type=msa
org.cispec.contract-type=sow
org.cispec.contract-type=far-cost-plus
org.cispec.contract-type=far-fixed-price
org.cispec.contract-type=dpa
org.cispec.contract-type=mou
org.cispec.contract-type=licence-agreement
```

## Conformance

`org.cispec.contract-type` is RECOMMENDED for any CI that is a
contract or formal agreement. Not REQUIRED for Declared conformance.

## Attestation

`contract-type` is attestable against the contract document itself
and, for government contracts, against USASpending.gov or equivalent
public procurement registries.

## Resolution and relation

`contract-type` paired with [`counterparty`](/counterparty/),
[`expiry`](/expiry/), and [`owner`](/owner/) gives the complete
management profile of a contract CI.
