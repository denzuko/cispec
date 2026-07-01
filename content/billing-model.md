---
title: "billing-model"
term: "billing-model"
core: false
recommendedFor: ["any CI with a defined commercial billing structure"]
related: ["unit-cost", "cost", "vendor", "contract-ref", "costcenter"]
docOid: "1.3.6.1.4.1.42387.2.3.4"
docGuid: "dbee024f-8cc0-52d6-b300-d1aac6b07372"
date: 2026-06-30
draft: false
---

`org.cispec.billing-model` records the commercial structure under
which a Change Item is billed — whether the cost is incurred on
demand, reserved upfront, paid as a subscription, capitalised as a
fixed asset, or expensed as an operational cost.

The billing model determines how `unit-cost` and `cost` are
interpreted, how `depreciation` applies (capex models depreciate;
opex models expense immediately), and what lifecycle triggers
(`expiry`, `acquired`) are financially meaningful.

Applies to any CI with a defined commercial billing structure:
cloud infrastructure, SaaS products, AI API access, software
licences, maintenance contracts, physical equipment purchases,
facility leases.

## Value format

A billing model slug from the organisation's FinOps taxonomy, or
one of the common cross-domain values:

```sh
org.cispec.billing-model=on-demand
org.cispec.billing-model=reserved-1yr
org.cispec.billing-model=reserved-3yr
org.cispec.billing-model=subscription
org.cispec.billing-model=per-token
org.cispec.billing-model=capex
org.cispec.billing-model=opex
org.cispec.billing-model=perpetual-licence
org.cispec.billing-model=time-and-materials
```

## Conformance

`org.cispec.billing-model` is RECOMMENDED for any CI with a defined
commercial billing structure. Not REQUIRED for Declared conformance.

## Attestation

`billing-model` is independently attestable against vendor contracts,
cloud provider billing configurations, or procurement documentation.

## Resolution and relation

`billing-model` governs how [`depreciation`](/depreciation/) applies
(capex models depreciate; opex and subscription models do not), and
what [`unit-cost`](/unit-cost/) represents (rate for on-demand and
per-token; fixed periodic cost for subscription).
