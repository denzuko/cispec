---
title: "environment"
term: "environment"
core: true
recommendedFor: ["any CI"]
related: ["location", "classification", "boundary", "version", "owner"]
docOid: "1.3.6.1.4.1.42387.2.4.2"
docGuid: "fb2fecdf-cbaf-5f0c-bd16-cffe882b9eb0"
date: 2026-06-30
draft: false
---

`org.cispec.environment` records the operational programme, zone, or
tier a Change Item is *assigned to* — not where it physically is, and
not what it is certified or regulated as.

Three terms that are frequently but incorrectly conflated:

- [`org.cispec.location`](/location/) — where the CI physically *is*
- `org.cispec.environment` — what programme or zone the CI is *assigned to*
- [`org.cispec.classification`](/classification/) — what the CI is *certified or regulated as*

The Lockheed Martin example makes the distinction concrete:

```sh
org.cispec.location=warehouse-13
org.cispec.environment=blackops
org.cispec.classification=ts/sci
org.cispec.commonname=groom.lake
```

A server physically in warehouse 13, assigned to the black ops
programme, cleared at TS/SCI, called Groom Lake. Four independent
facts. The environment is the programme assignment — it would remain
`blackops` if the server were moved to a different warehouse, and it
would remain `warehouse-13` if the server were reassigned to a
different programme.

`environment` applies to any Change Item in any domain — software
deployment tier, ICS operational zone, military programme, clinical
trial, research programme, regulatory sandbox, maintenance window, or
any other organisationally-meaningful operational context.

## Value format

A lower-case slug: alphanumeric characters and hyphens only,
optionally prefixed with a qualifier and colon for domain-specific
environment classifications.

```sh
org.cispec.environment=production
org.cispec.environment=staging
org.cispec.environment=blackops
org.cispec.environment=clinical-trial-phase-2
org.cispec.environment=purdue-level:1
org.cispec.environment=homelab
```

### Qualified form: ICS Purdue level

For industrial control system Change Items, `environment` MAY carry a
`purdue-level:<n>` qualified value aligned with
[ISA/IEC 62443](https://www.isa.org/standards-and-publications/isa-standards/isa-iec-62443-series-of-standards),
where `<n>` is an integer 0–5:

| Level | Description |
|---|---|
| 0 | Physical process — sensors, actuators |
| 1 | Intelligent devices — PLCs, RTUs, IEDs |
| 2 | Control systems — SCADA, HMI |
| 3 | Site operations — MES, historians |
| 4–5 | Enterprise / business systems |

## Conformance

`org.cispec.environment` is RECOMMENDED for any Change Item where
operational context affects criticality, change windows, or
change-freeze policy. It is not REQUIRED for Declared conformance.

## Attestation

`environment` is not independently attestable. It is a
self-asserted operational assignment with no external registry to
verify against.

## Resolution and relation

Every Change Item sharing the same `environment` value forms an edge
in the namespace's knowledge graph — "everything assigned to
`production`" or "every `purdue-level:1` device" are both real,
expected queries for change-freeze management, incident response, and
operational planning.
