---
title: "counterparty"
term: "counterparty"
core: false
recommendedFor: ["any CI that is a contract or formal agreement"]
related: ["contract-type", "contract-ref", "vendor", "customer", "owner"]
docOid: "1.3.6.1.4.1.42387.2.6.8.2"
docGuid: "bfb13628-0034-501b-8404-f05df058bfbf"
date: 2026-06-30
draft: false
---

`org.cispec.counterparty` identifies the other party to a contract
or agreement when that contract is tracked as a Change Item. This is
distinct from [`org.cispec.vendor`](/vendor/) (who supplies or
services a CI to the org) and [`org.cispec.customer`](/customer/)
(who the org delivers to) — `counterparty` names the party on the
other side of a contract document that is itself the CI being tracked.

In a contract CI, `owner` is who in the owning organisation is
accountable for the contract, and `counterparty` is the other
signatory. Both are needed to fully describe the agreement.

## Value format

The counterparty's commonly used trading or legal name.

```sh
org.cispec.counterparty=Anthropic-PBC
org.cispec.counterparty=Department-of-Defense
org.cispec.counterparty=NHS-England
org.cispec.counterparty=Lockheed-Martin-Corporation
```

## Conformance

`org.cispec.counterparty` is RECOMMENDED for any CI that is a
contract or formal agreement. Not REQUIRED for Declared conformance.

## Attestation

`counterparty` is independently attestable against the contract
document itself and, for government contracts, public procurement
records.

## Resolution and relation

Every contract CI sharing the same `counterparty` forms a real
query — "every contract with `Department-of-Defense`" is a vendor
risk management and contract renewal query.
