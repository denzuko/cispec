---
title: "manufacturer"
term: "manufacturer"
core: false
recommendedFor: ["any CI with an identifiable original equipment manufacturer"]
related: ["make", "model", "asset-tag", "version", "owner"]
docOid: "1.3.6.1.4.1.42387.2.6.2.2"
docGuid: "d957a085-ddfe-55e3-a34f-6e886194e470"
date: 2026-06-30
draft: false
---

`org.cispec.manufacturer` records the original equipment manufacturer
(OEM) of a Change Item — who made it, as distinct from who owns it
([`organization`](/organization/)) or what programme it supports
([`environment`](/environment/)).

The distinction matters across every domain where physical assets
appear: a Siemens SIMATIC S7 PLC owned by an automotive manufacturer
has a manufacturer of Siemens and an organization of the car company.
A Pfizer vaccine lot owned by a hospital has a manufacturer of Pfizer
and an organization of the hospital. A Lockheed Martin F-35 assigned
to a USAF unit has a manufacturer of Lockheed Martin and an
organization of the US Air Force. In CMDB practice, manufacturer
drives patch and vulnerability applicability, EOL tracking, warranty
queries, and recall/advisory notifications — none of which can be
answered from `organization` alone.

## Value format

The manufacturer's commonly used name or registered trade name.

```sh
org.cispec.manufacturer=Siemens
org.cispec.manufacturer=Lockheed Martin
org.cispec.manufacturer=Pfizer
org.cispec.manufacturer=Caterpillar
org.cispec.manufacturer=Cisco Systems
```

## Conformance

`org.cispec.manufacturer` is RECOMMENDED for any CI with an
identifiable OEM. It is not REQUIRED for Declared conformance.

## Attestation

`manufacturer` is independently attestable against publicly available
product documentation, regulatory filings (FDA, FAA, CE marking), or
procurement records.

## Resolution and relation

Every Change Item sharing the same `manufacturer` value forms an edge
in the namespace's knowledge graph — "every Siemens device" is a
real, expected query for vulnerability management (when a Siemens
advisory is issued), EOL tracking, and procurement planning.
