---
title: "contract-ref"
term: "contract-ref"
core: false
recommendedFor: ["any CI procured under a formal contract or procurement vehicle"]
related: ["vendor", "cost", "costcenter", "customer", "boundary"]
docOid: "1.3.6.1.4.1.42387.2.3.6"
docGuid: "bc197921-a7a6-5d33-90f2-763de7e0eaa3"
date: 2026-06-30
draft: false
---

`org.cispec.contract-ref` is a bare reference pointer to the
procurement vehicle or contract under which a Change Item was
acquired or is being operated — a contract number, a GSA schedule
reference, a purchase order number, a framework agreement identifier.

This is not the contract itself — the same pointer pattern as
[`org.cispec.custody-chain`](/custody-chain/) and
[`org.cispec.sla`](/sla/): the key cites the instrument; the
instrument's content lives in the organisation's contract management
system or a public procurement registry.

Critical for federal contracting: a DoD CI under DFARS must be
traceable to its contract number for property accountability, audit,
and WAWF invoicing. For civilian federal agencies, the contract
reference ties the CI to its FAR-based procurement. For commercial
organisations it ties the CI to the vendor agreement governing support
terms, SLA, and data handling obligations.

## Value format

A contract identifier in whatever scheme applies to the procurement:

```sh
org.cispec.contract-ref=W15P7T-20-C-0001
org.cispec.contract-ref=GS-35F-0119Y
org.cispec.contract-ref=PO-2026-001234
org.cispec.contract-ref=MSEA-2026-CDW-0042
```

## Conformance

`org.cispec.contract-ref` is RECOMMENDED for any CI procured under a
formal contract. Not REQUIRED for Declared conformance.

## Attestation

`contract-ref` is independently attestable for publicly registered
contracts (USASpending.gov for federal contracts, public procurement
registers in other jurisdictions). Private commercial contracts are
attestable against the parties' own records.

## Resolution and relation

`contract-ref` pairs with [`vendor`](/vendor/) (who the contract
is with), [`cost`](/cost/) (what was paid under it), and
[`expiry`](/expiry/) (when the contract term ends). Together these
facts give an auditor the full commercial context of a CI's
procurement.
