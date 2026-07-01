---
title: "capacity"
term: "capacity"
core: false
recommendedFor: ["any CI that is a facility or infrastructure resource with a measurable capacity"]
related: ["facility-class", "location", "sla", "usage", "owner"]
docOid: "1.3.6.1.4.1.42387.2.6.7.2"
docGuid: "d2cfe509-b432-5f4d-844d-ae3c8df8c79c"
date: 2026-06-30
draft: false
---

`org.cispec.capacity` records the rated or designed capacity of a
Change Item — the maximum quantity of a resource the CI can hold,
process, or supply under normal operating conditions.

Applies to any CI with a measurable capacity: data centres (rack
count, power density, cooling capacity), warehouses (square footage,
pallet positions, weight load), network links (bandwidth), storage
systems (total capacity), pharmaceutical cold rooms (cubic metres,
temperature range), hospital wards (beds), and any other facility or
infrastructure CI where capacity is a tracked operational parameter.

## Value format

Quantity, unit, and optional resource type — colon-separated.

```sh
org.cispec.capacity=500:rack-units
org.cispec.capacity=10:MW:power
org.cispec.capacity=250000:sq-ft
org.cispec.capacity=4800:pallet-positions
org.cispec.capacity=100:Gbps
org.cispec.capacity=2:PB
org.cispec.capacity=300:beds
```

## Conformance

`org.cispec.capacity` is RECOMMENDED for any CI that is a facility
or infrastructure resource with a measurable capacity. Not REQUIRED
for Declared conformance.

## Attestation

`capacity` is independently attestable against engineering
specifications, commissioning records, and regulatory filings.
Uptime Institute tier certifications include power and cooling
capacity figures; warehouse regulatory permits specify storage limits;
network capacity is verifiable against carrier provisioning records.

## Resolution and relation

`capacity` paired with [`usage`](/usage/) gives the utilisation
picture — current consumption against rated maximum, the core
FinOps and capacity planning metric. Paired with
[`facility-class`](/facility-class/) it gives the full operational
profile of a facility CI.
