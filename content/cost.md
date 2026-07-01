---
title: "cost"
term: "cost"
core: false
recommendedFor: ["any CI with a known acquisition or current market cost"]
related: ["unit-cost", "billing-model", "costcenter", "vendor", "contract-ref", "depreciation"]
docOid: "1.3.6.1.4.1.42387.2.3.2"
docGuid: "9d633303-4b6e-5c01-bbc0-2554769f3aa5"
date: 2026-06-30
draft: false
---

`org.cispec.cost` records the acquisition cost or last known price of
a Change Item — what was paid for it, in whatever currency and at
whatever point in the CI's lifecycle the cost was established.

This is distinct from [`org.cispec.unit-cost`](/unit-cost/), which
records the ongoing operational cost rate. `cost` is a point-in-time
acquisition fact; `unit-cost` is a recurring operational fact. A cloud
virtual machine might have no acquisition cost (on-demand provisioning
costs nothing upfront) but a significant `unit-cost` per hour. A
physical server has an acquisition `cost` and may also have an ongoing
`unit-cost` for maintenance contracts and power. Both facts are needed
for full lifecycle cost accounting.

Applies to any CI with a monetary value: servers, software licences,
network equipment, vehicles, weapons systems, pharmaceutical lots,
medical devices, industrial machinery, facility leases, contracts,
access credentials with licence fees.

## Value format

Amount, currency code, and optional cost type — colon-separated.

```sh
org.cispec.cost=150000:USD
org.cispec.cost=2500:USD:annual-licence
org.cispec.cost=0:USD:no-upfront
```

## Conformance

`org.cispec.cost` is RECOMMENDED for any CI with a known acquisition
or current market cost. It is not REQUIRED for Declared conformance.

## Attestation

`cost` is independently attestable against procurement records,
invoices, or contract documentation. For regulated acquisitions
(federal contracts, pharmaceutical procurement) it is verifiable
against formal procurement records.

## Resolution and relation

`cost` pairs with [`costcenter`](/costcenter/) (where the cost is
charged), [`vendor`](/vendor/) (who the cost was paid to),
[`contract-ref`](/contract-ref/) (under what procurement vehicle),
and [`depreciation`](/depreciation/) (how the cost is amortised over
the CI's useful life).
