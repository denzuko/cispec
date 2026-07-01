---
title: "location"
term: "location"
core: false
recommendedFor: ["any CI with a physical presence"]
related: ["environment", "commonname", "asset-tag", "owner"]
docOid: "1.3.6.1.4.1.42387.2.7"
docGuid: "1192ce5e-1a38-5939-b4c8-be1263cb37fc"
date: 2026-06-30
draft: false
---

`org.cispec.location` records where a Change Item physically is.

This is distinct from [`org.cispec.environment`](/environment/), which
records what operational programme or zone the CI is *assigned to*.
A weapons system at Groom Lake (`location=warehouse-13`) running a
classified programme (`environment=blackops`) demonstrates the
difference: location is a physical fact; environment is an assignment
fact. The CI could be moved to a different location while remaining in
the same environment, or reassigned to a different environment while
remaining in the same location. They are independent.

`location` applies to any Change Item with a physical presence —
servers, network equipment, industrial machinery, vehicles, vessels,
spacecraft, pharmaceutical shipments, weapons systems, medical devices,
classified documents in a safe, people's badge-access locations. It
does not apply to purely logical or virtual CIs that have no physical
instantiation.

## Value format

A location identifier meaningful to the owning organisation's asset
management system — a slug, a facility code, a rack address, a GPS
coordinate string, or a structured hierarchical identifier. This
specification does not mandate a specific encoding.

```sh
org.cispec.location=warehouse-13
org.cispec.location=dallas-dc1-rack-b12-u24
org.cispec.location=53.3498,-6.2603
org.cispec.location=scif-a-safe-3
```

## Conformance

`org.cispec.location` is RECOMMENDED for any Change Item with a
physical presence. It is not REQUIRED for Declared conformance because
purely logical CIs (software artefacts, policy documents, credentials)
legitimately have no physical location.

## Attestation

`location` is not independently attestable by this specification. A
location value is a self-asserted claim; verification requires
physical inspection or a trusted asset tracking system. RFID, GPS
telemetry, and barcode scan records are implementation-defined
attestation mechanisms outside this specification's scope.

## Resolution and relation

Every Change Item sharing the same `location` value forms an edge in
the namespace's knowledge graph — "everything physically in
`warehouse-13`" is a real, expected query, central to physical
inventory audits, emergency response planning, and logistics management.
