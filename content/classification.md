---
title: "classification"
term: "classification"
core: false
recommendedFor: ["any CI subject to regulatory, safety, or security classification"]
related: ["environment", "boundary", "retention", "owner", "custody-chain"]
docOid: "1.3.6.1.4.1.42387.2.8"
docGuid: "ff8c27e8-562e-5b8d-a887-ebb1daeeb039"
date: 2026-06-30
draft: false
---

`org.cispec.classification` records what a Change Item is certified,
cleared, or regulated as — the category assigned to it by a regulatory
body, safety authority, or security framework.

This is distinct from [`org.cispec.environment`](/environment/), which
records what operational programme or zone the CI is assigned to, and
from [`org.cispec.location`](/location/), which records where it is.
Using the Lockheed Martin example:

```sh
org.cispec.location=warehouse-13
org.cispec.environment=blackops
org.cispec.classification=ts/sci
org.cispec.commonname=groom.lake
```

These are four independent facts. The classification does not change
based on where the asset is or what programme it supports. A document
classified TS/SCI remains TS/SCI whether it is in a SCIF, in transit,
or under review — the classification is a property of the asset, not
of its context.

`classification` applies to any Change Item carrying a formal
classification: government and military clearance levels (CUI, TS/SCI,
NOFORN), healthcare data categories (PHI, PII, de-identified), payment
card scope (PCI CDE, in-scope, out-of-scope), aerospace safety
criticality (DO-178C DAL A through E, DO-254), industrial safety
integrity levels (IEC 61508 SIL 1–4), pharmaceutical regulatory class
(FDA Class I/II/III device, Schedule II controlled substance), and any
other formal regulatory or safety category. The term is deliberately
cross-domain: the same key covers a classified server, a PHI-containing
medical device, a safety-critical flight control system, and a
Schedule II drug shipment.

## Value format

A classification identifier drawn from the applicable regulatory or
safety framework. Use the framework's own abbreviations where they
exist.

```sh
org.cispec.classification=ts/sci
org.cispec.classification=phi
org.cispec.classification=pci-cde
org.cispec.classification=dal:a
org.cispec.classification=sil:2
org.cispec.classification=cui
org.cispec.classification=fda-class-ii
```

A CI MAY carry more than one `classification` label where multiple
frameworks apply simultaneously — a medical device inside a DoD
facility may be both `fda-class-ii` and `cui`.

## Conformance

`org.cispec.classification` is RECOMMENDED for any CI subject to
formal regulatory, safety, or security classification. It is not
REQUIRED for Declared conformance because many CIs carry no formal
classification at all.

## Attestation

`classification` is conditionally independently attestable, depending
on the framework. A US government classification (CUI, TS/SCI) is
verifiable against the originating authority's records. An FDA device
class is verifiable against FDA's 510(k) and PMA databases. A PCI CDE
scope designation is verifiable against the organisation's Qualified
Security Assessor (QSA) report. A DO-178C DAL assignment is verifiable
against the certification authority's type certificate records. The
attestation mechanism is framework-specific; this specification does
not mandate one.

## Resolution and relation

Every Change Item sharing the same `classification` value forms an
edge in the namespace's knowledge graph — "every TS/SCI-classified CI"
or "every PHI-containing device" are both real, expected queries for
security audit, regulatory review, and incident response.
