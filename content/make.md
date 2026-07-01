---
title: "make"
term: "make"
core: false
recommendedFor: ["any CI with an identifiable product line or brand"]
related: ["manufacturer", "model", "asset-tag", "version"]
docOid: "1.3.6.1.4.1.42387.2.6.2.3"
docGuid: "8a7106c6-dcca-5f76-b59d-7bd2f391bb75"
date: 2026-06-30
draft: false
---

`org.cispec.make` records the product line or brand of a Change Item
— the named family it belongs to within a manufacturer's catalogue.

The three-field pattern `manufacturer` / `make` / `model` is standard
CMDB practice for any physical CI: manufacturer is who made it, make
is what product line it belongs to, model is which specific variant.
A Lockheed Martin (`manufacturer`) F-35 (`make`) B variant (`model`).
A Pfizer (`manufacturer`) Prevnar (`make`) 13 formulation (`model`).
A Caterpillar (`manufacturer`) 797 (`make`) F variant (`model`). A
Cisco Systems (`manufacturer`) Catalyst (`make`) 9300-48P (`model`).

`make` is distinct from [`manufacturer`](/manufacturer/) — the same
manufacturer produces multiple makes. It is distinct from
[`model`](/model/) — the same make has multiple models. All three are
needed for unambiguous identification, patch applicability, EOL
tracking, and maintenance manual lookup.

## Value format

The product line or brand name as the manufacturer uses it.

```sh
org.cispec.make=F-35
org.cispec.make=Prevnar
org.cispec.make=797
org.cispec.make=Catalyst
org.cispec.make=SIMATIC-S7
```

## Conformance

`org.cispec.make` is RECOMMENDED for any CI with an identifiable
product line. It is not REQUIRED for Declared conformance.

## Attestation

`make` is independently attestable against the manufacturer's product
catalogue, regulatory filings, or procurement documentation.

## Resolution and relation

Every Change Item sharing the same `make` value (scoped within the
same `manufacturer`) forms an edge in the namespace's knowledge graph
— "every F-35" is a real, expected query for fleet-wide advisory
response, lifecycle planning, and supply chain tracking.
