---
title: "boundary"
term: "boundary"
core: false
recommendedFor: ["any CI within a named authorization or control boundary"]
related: ["classification", "environment", "owner", "retention"]
docOid: "1.3.6.1.4.1.42387.2.8.2"
docGuid: "1eaea5b2-5b84-5829-ae8b-850ec19d0ff0"
date: 2026-06-30
draft: false
---

`org.cispec.boundary` records the named authorization or control
boundary a Change Item sits within. A boundary is a formally defined
perimeter — physical, logical, or regulatory — within which a set of
CIs are collectively managed, assessed, or controlled.

Examples across domains: a FedRAMP authorization boundary (the scope
of a cloud system's ATO), a SCIF physical perimeter, a PCI network
segmentation boundary, a NERC-CIP electronic security perimeter, an
ICS/SCADA network zone boundary (distinct from and complementary to
[`environment=purdue-level:n`](/environment/)), a pharmaceutical
cleanroom boundary, a customs bond zone, a FAA-designated airspace
sector. The boundary is what the CI is *inside*; the classification
is what the CI *is*; the environment is what programme the CI is
*assigned to*. All three are independent.

## Value format

A boundary identifier meaningful to the owning organisation's control
framework — a slug, an authorization package ID, or a formal
designation.

```sh
org.cispec.boundary=fedramp-ato-2026-prod
org.cispec.boundary=scif-a
org.cispec.boundary=pci-zone-1
org.cispec.boundary=nerc-cip-esp-west
org.cispec.boundary=cleanroom-b-iso-14644
```

## Conformance

`org.cispec.boundary` is RECOMMENDED for any CI within a named
authorization or control boundary. It is not REQUIRED for Declared
conformance.

## Attestation

`boundary` is independently attestable where the boundary itself has
a public or auditable record — a FedRAMP authorization boundary is
verifiable against the FedRAMP Marketplace; a NERC-CIP ESP is
verifiable against the registered CIP programme. Internal-only
boundary designations are self-asserted.

## Resolution and relation

Every Change Item sharing the same `boundary` value forms an edge in
the namespace's knowledge graph — "every CI within `fedramp-ato-2026-prod`"
is a real, expected query for authorization boundary documentation,
continuous monitoring scope, and assessment planning.
