---
title: "usage"
term: "usage"
core: false
recommendedFor: ["any CI where consumption quantity in a billing period is meaningful for cost or security analysis"]
related: ["unit-cost", "cost", "billing-model", "version", "application"]
docOid: "1.3.6.1.4.1.42387.2.3.7"
docGuid: "c8c1a366-27f8-56fc-991c-0a4f2c9b383d"
date: 2026-06-30
draft: false
---

`org.cispec.usage` records the quantity of a Change Item consumed in
a billing period — the unit count that, multiplied by
[`org.cispec.unit-cost`](/unit-cost/), yields actual spend.

`usage` is both a FinOps fact and a security signal. Anomalous usage
is often the first detectable indicator of a supply chain compromise,
malicious workload, or credential abuse: 10 million tokens consumed
in an AI API billing period where the baseline is 50,000 tokens is
not a cost problem alone — it is an incident indicator that correlates
with the period of malicious activity. In a cyber incident report,
`usage` provides the evidence of *what was consumed* during the
compromise window, independently of whether the spend was ultimately
reversed.

Applies to any CI with a measurable consumption quantity: AI model
API calls (tokens), cloud compute (CPU-hours, GPU-hours), storage
(GB-months), network (GB transferred), SaaS (user-seats, API calls),
utilities (kWh, litres), pharmaceutical lots (doses administered).

## Value format

Quantity and unit — colon-separated. The unit SHOULD match the
billing unit in [`org.cispec.unit-cost`](/unit-cost/).

```sh
org.cispec.usage=10000000:tokens
org.cispec.usage=720:CPU-hours
org.cispec.usage=500:GB-month
org.cispec.usage=1200:kWh
```

## Conformance

`org.cispec.usage` is RECOMMENDED for any CI where consumption
quantity is meaningful for cost analysis or security incident
attribution. Not REQUIRED for Declared conformance.

## Attestation

`usage` is independently attestable against vendor billing records,
cloud provider usage APIs, metering infrastructure, or utility billing
statements.

## Resolution and relation

`usage` × [`unit-cost`](/unit-cost/) = actual spend in the period.
In incident reporting, `usage` paired with [`version`](/version/)
(which model/artefact version was running), [`owner`](/owner/) (who
authorised the workload), and [`custody-chain`](/custody-chain/)
(the chain of custody on the deployed artefact) gives the full
attribution picture for a FinOps-correlated security incident.
