---
title: "sla"
term: "sla"
core: false
recommendedFor: ["any CI operating under a formal service or maintenance commitment"]
related: ["environment", "owner", "costcenter", "customer"]
docOid: "1.3.6.1.4.1.42387.2.9"
docGuid: "78ee1d87-4cab-5636-a51d-60b9c45ee3f5"
date: 2026-06-30
draft: false
---

`org.cispec.sla` records the service level agreement or maintenance
commitment under which a Change Item is operated or supported — a
pointer to the tier or the document governing response times, uptime
targets, and maintenance obligations.

This applies to any Change Item under a formal service commitment: a
server under a cloud provider SLA, a network device under a carrier
maintenance contract, a medical device under a manufacturer service
agreement, a weapons system under a defence support contract, an
industrial machine under an OEM maintenance programme, a facility
under a facilities management SLA. It is not limited to IT
infrastructure.

The value is a reference — a tier identifier or a pointer to an
external SLA document — not the SLA text itself. The same pointer
pattern as [`org.cispec.custody-chain`](/custody-chain/): this key
cites the commitment; the commitment's content lives elsewhere.

## Value format

A service tier slug, a contract reference, or a URI pointing to the
governing SLA document.

```sh
org.cispec.sla=gold
org.cispec.sla=carrier-grade-99.999
org.cispec.sla=CONTRACT-2026-MAINT-0042
org.cispec.sla=https://agreements.example.org/sla/platinum-2026
```

## Conformance

`org.cispec.sla` is RECOMMENDED for any CI operating under a formal
service or maintenance commitment. It is not REQUIRED for Declared
conformance.

## Attestation

`sla` is independently attestable where the value is a resolvable URI
or a verifiable contract reference — an auditor can retrieve the
referenced document and confirm the commitment exists. A bare tier
slug (`gold`, `platinum`) is self-asserted and not independently
attestable without a corresponding contract reference.

## Resolution and relation

Every Change Item sharing the same `sla` value forms an edge in the
namespace's knowledge graph — "every CI under the gold SLA" is a
real, expected query for capacity planning, incident prioritisation,
and contract renewal reviews.
