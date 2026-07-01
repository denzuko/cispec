---
title: "acquired"
term: "acquired"
core: false
recommendedFor: ["any CI with a known acquisition or provisioning date"]
related: ["expiry", "cost", "depreciation", "vendor", "contract-ref", "owner"]
docOid: "1.3.6.1.4.1.42387.2.4.4"
docGuid: "b07863b7-ed3e-5f79-9160-67efc0ebfe86"
date: 2026-06-30
draft: false
---

`org.cispec.acquired` records when a Change Item entered the
owning organisation's inventory — when it was purchased, provisioned,
deployed, issued, or otherwise became the organisation's
responsibility to manage.

This is the anchor date for the full lifecycle: `acquired` starts the
clock that [`expiry`](/expiry/) ends. Together they bound the CI's
active lifespan. For capitalised assets, `acquired` starts the
[`depreciation`](/depreciation/) schedule. For procurement audit,
`acquired` places the CI in a specific fiscal year and budget period.
For security incident attribution, `acquired` establishes whether a
CI was in the organisation's estate during the period of a compromise.

Applies universally: the date a server was commissioned, a drug lot
was received into pharmacy inventory, an access credential was issued,
a vehicle was added to the fleet, a weapon system was accepted into
service, a contract became effective, a certificate was issued.

## Value format

An ISO 8601 date or datetime.

```sh
org.cispec.acquired=2024-03-15
org.cispec.acquired=2026-01-01T00:00:00Z
org.cispec.acquired=2023-07-28
```

## Conformance

`org.cispec.acquired` is RECOMMENDED for any CI with a known
acquisition or provisioning date. Not REQUIRED for Declared
conformance.

## Attestation

`acquired` is independently attestable against procurement records,
invoices, acceptance certificates, certificate issuance logs, or
inventory receiving documentation.

## Resolution and relation

`acquired` paired with [`expiry`](/expiry/) gives the full active
lifespan. Paired with [`cost`](/cost/) and
[`depreciation`](/depreciation/), it anchors the depreciation
schedule. Paired with [`contract-ref`](/contract-ref/) it ties the
CI to its originating procurement event and fiscal period.
