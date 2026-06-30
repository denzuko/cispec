---
title: "environment"
term: "environment"
core: true
recommendedFor: ["any CI"]
related: ["version", "role", "owner"]
docOid: "1.3.6.1.4.1.42387.2.4.2"
docGuid: "fb2fecdf-cbaf-5f0c-bd16-cffe882b9eb0"
date: 2026-06-30
draft: false
---

`org.cispec.environment` records the deployment or operational
environment of a Change Item.

## Value format

A lower-case slug: alphanumeric characters and hyphens only, optionally
prefixed with a qualifier and colon for domain-specific environment
classifications that don't warrant a separate term.

```sh
org.cispec.environment=production
org.cispec.environment=purdue-level:1
```

Common bare values include `production`, `staging`, `development`, and
`sandbox`, though the namespace does not enumerate or restrict the set
— any organisation-meaningful environment slug is conformant.

### Qualified form: ICS Purdue level

For industrial control system Change Items, `environment` MAY carry a
`purdue-level:<n>` qualified value aligned with
[ISA/IEC 62443](https://www.isa.org/standards-and-publications/isa-standards/isa-iec-62443-series-of-standards)
zone-and-conduit terminology, where `<n>` is an integer 0–5:

| Level | Description |
|---|---|
| 0 | Physical process — sensors, actuators |
| 1 | Intelligent devices — PLCs, RTUs, IEDs |
| 2 | Control systems — SCADA, HMI |
| 3 | Site operations — MES, historians |
| 4–5 | Enterprise / business systems |

This is the same qualified-value pattern used by
[`owner`](/owner/) for role-qualified identity. A previous version of
this specification minted a separate `purdue-level` term for this
purpose; it has been retired and folded in here, since the underlying
fact — operational classification context — is exactly what
`environment` already exists to express.

## Conformance

`org.cispec.environment` is RECOMMENDED for any Change Item where
environment context affects criticality, change windows, or
change-freeze policy. The `purdue-level:<n>` qualified form is
REQUIRED for industrial control system Change Items specifically.

## Attestation

`environment` is not independently attestable, including the
`purdue-level` qualified form. It is a classification asserted by
whoever performs the deployment or asset-inventory work; ISA/IEC 62443
describes the methodology for assigning a Purdue level but provides no
registry to verify a specific asset's claimed level against.
Verification, where it matters, is a network-segmentation audit or
deployment-infrastructure check — an implementation concern, not
something this specification or a cimatrix gate verifies directly.

## Resolution and relation

Every Change Item sharing the same `environment` value forms an edge
in the namespace's knowledge graph — "everything currently in
`production`," or "every `purdue-level:1` device," are both real,
expected queries, central to change-freeze, incident-response, and
ICS network-segmentation planning, answered by whatever CMDB or
deployment platform the organisation runs.
