---
title: "unit-cost"
term: "unit-cost"
core: false
recommendedFor: ["any CI with ongoing operational cost that accrues over time"]
related: ["cost", "billing-model", "usage", "costcenter", "vendor"]
docOid: "1.3.6.1.4.1.42387.2.3.3"
docGuid: "13b2c028-55ec-59a4-b274-c01ddddc33cf"
date: 2026-06-30
draft: false
---

`org.cispec.unit-cost` records the ongoing operational cost rate of a
Change Item — what it costs per unit of time or consumption. This is
the rate that, multiplied by [`org.cispec.usage`](/usage/), yields
actual spend in any billing period, and the figure that FinOps
automation monitors against spend thresholds encoded in the
organisation's cost centre policy.

The unit-cost combined with usage is the anomaly signal for incidents
involving AI overspend or supply chain compromise: a `unit-cost` of
`0.003:USD:per-token` multiplied by a `usage` of `10000000:tokens`
in a single billing period is a detectable deviation that correlates
with the incident timeline.

Applies to any CI with recurring operational cost: cloud compute
($/hour), AI API calls ($/token), storage ($/GB-month), network
bandwidth ($/GB), SaaS subscriptions ($/user/month), maintenance
contracts ($/year), facility leases ($/sqft/month).

## Value format

Rate, currency, and billing unit — colon-separated.

```sh
org.cispec.unit-cost=0.096:USD:per-hour
org.cispec.unit-cost=0.003:USD:per-token
org.cispec.unit-cost=0.023:USD:per-GB-month
org.cispec.unit-cost=15000:USD:per-year
```

## Conformance

`org.cispec.unit-cost` is RECOMMENDED for any CI with ongoing
operational cost. It is not REQUIRED for Declared conformance.

## Attestation

`unit-cost` is independently attestable against vendor invoices,
cloud provider billing APIs, or contract rate schedules.

## Resolution and relation

`unit-cost` × [`usage`](/usage/) = actual spend in a period.
Both are needed for incident attribution and FinOps anomaly detection.
[`billing-model`](/billing-model/) records the commercial structure
under which `unit-cost` applies.
