---
title: "model"
term: "model"
core: false
recommendedFor: ["any CI with an identifiable specific variant or SKU"]
related: ["make", "manufacturer", "version", "asset-tag"]
docOid: "1.3.6.1.4.1.42387.2.6.2.4"
docGuid: "6ddca6e5-bb57-505c-b995-70a5b05ff783"
date: 2026-06-30
draft: false
---

`org.cispec.model` records the specific variant, SKU, or model
designation of a Change Item within its product line.

In the three-field pattern `manufacturer` / `make` / `model`, `model`
is the most specific identifier — the thing that determines which
firmware applies, which maintenance manual governs, which warranty
terms apply, which regulatory certification covers it, and when EOL
occurs. A Catalyst 9300-48P and a Catalyst 9300-24T are the same make
but different models with different port counts, power requirements,
and supported feature sets. An F-35A and an F-35B are the same make
but different models with fundamentally different landing systems.

`model` applies to the same full range of physical CIs as
[`make`](/make/) and [`manufacturer`](/manufacturer/) — any
manufactured thing where the specific variant matters for lifecycle
management, safety compliance, regulatory filing, or technical
applicability.

## Value format

The model designation as the manufacturer uses it.

```sh
org.cispec.model=F-35B
org.cispec.model=9300-48P
org.cispec.model=797F-AC
org.cispec.model=S7-1500
org.cispec.model=Prevnar-13-0.5mL-prefilled
```

## Conformance

`org.cispec.model` is RECOMMENDED for any CI with an identifiable
specific variant. It is not REQUIRED for Declared conformance.

## Attestation

`model` is independently attestable against the manufacturer's product
documentation, regulatory type certificates, or procurement records.

## Resolution and relation

Every Change Item sharing the same `model` value (scoped within the
same `manufacturer` and `make`) forms an edge in the namespace's
knowledge graph — "every F-35B" or "every Catalyst 9300-48P" is a
real, expected query for targeted patch deployment, advisory response,
and fleet-wide EOL planning.
