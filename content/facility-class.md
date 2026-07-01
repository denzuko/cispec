---
title: "facility-class"
term: "facility-class"
core: false
recommendedFor: ["any CI that is a facility or physical space with a formal classification"]
related: ["capacity", "location", "classification", "boundary", "sla", "owner"]
docOid: "1.3.6.1.4.1.42387.2.6.7.1"
docGuid: "62053022-2d93-5d38-ad74-62a22699c40f"
date: 2026-06-30
draft: false
---

`org.cispec.facility-class` records the formal classification or
tier of a facility Change Item — the standardised category that
governs its design requirements, operational standards, and
compliance obligations.

Applies to any CI that is a facility or managed physical space:
data centres, server rooms, cleanrooms, laboratories, SCIFs,
pharmaceutical manufacturing facilities, medical facilities,
industrial plants, warehouses, and any other physical space tracked
as a CI with a formal tier or class designation.

Classification frameworks vary by facility type:

| Facility type | Framework | Classes/Tiers |
|---|---|---|
| Data centre | Uptime Institute | Tier I / II / III / IV |
| Data centre | EN 50600 | Class 1–4 |
| Cleanroom | ISO 14644-1 | ISO Class 1–9 |
| Pharmaceutical | EU GMP | Grade A/B/C/D |
| SCIF | ICD 705 | Accredited / Provisional |
| Biological lab | CDC/NIH | BSL-1/2/3/4 |
| Explosive storage | ATF | Type 1–6 magazine |

## Value format

Framework prefix and class/tier — colon-separated.

```sh
org.cispec.facility-class=uptime:tier-3
org.cispec.facility-class=iso-14644:class-7
org.cispec.facility-class=eu-gmp:grade-b
org.cispec.facility-class=bsl:3
org.cispec.facility-class=icd-705:accredited
```

## Conformance

`org.cispec.facility-class` is RECOMMENDED for any CI that is a
facility with a formal tier or class designation. Not REQUIRED for
Declared conformance.

## Attestation

`facility-class` is independently attestable against the certifying
body's records — Uptime Institute tier certifications are publicly
listed; ISO cleanroom classifications are verifiable against third-
party audit reports; SCIF accreditations are verifiable through the
appropriate government authority.

## Resolution and relation

`facility-class` paired with [`capacity`](/capacity/) gives the
operational profile of a facility CI. Paired with
[`classification`](/classification/) and [`boundary`](/boundary/)
it gives the full compliance picture for regulated facilities.
