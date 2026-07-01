---
title: "serial-number"
term: "serial-number"
core: false
recommendedFor: ["any physical CI with an OEM-assigned serial number"]
related: ["asset-tag", "manufacturer", "make", "model", "checksum", "custody-chain"]
docOid: "1.3.6.1.4.1.42387.2.6.2.5"
docGuid: "a7746230-ebc5-5ddf-830d-60250cbb8799"
date: 2026-06-30
draft: false
---

`org.cispec.serial-number` records the OEM-assigned serial number of
a Change Item — the unique identifier the manufacturer assigns to a
specific unit at production time. This is distinct from
[`org.cispec.asset-tag`](/asset-tag/), which is the inventory control
number the *owning organisation* assigns. Both are needed and both
have different consumers: asset-tag is for the organisation's own
procurement and inventory systems; serial-number is for warranty
lookup, manufacturer recall notices, regulatory traceability, and
repair tracking.

Applies to any physical CI with an OEM-assigned serial: servers,
network equipment, vehicles, aircraft components (with FAA
traceability requirements), medical devices (FDA UDI includes serial
number), pharmaceutical lots (batch/lot number from the manufacturer),
weapon system components (ITAR/DoD part traceability), and any other
manufactured thing where the OEM needs to be able to identify a
specific unit.

## Value format

The serial number exactly as the manufacturer assigns it. Format is
manufacturer-specific; this specification does not constrain it.

```sh
org.cispec.serial-number=C07XL2JDLCMN
org.cispec.serial-number=VMW-2026-00441-B
org.cispec.serial-number=LOT-2026-B-04421
org.cispec.serial-number=15935728001234
```

## Conformance

`org.cispec.serial-number` is RECOMMENDED for any physical CI with
an OEM-assigned serial number. Not REQUIRED for Declared conformance.

## Attestation

`serial-number` is independently attestable against the
manufacturer's own records, regulatory registries (FDA UDI
database, FAA aircraft registry), and physical labelling on the
unit. This is one of the stronger attestation paths available for
physical CIs — the manufacturer's own production records are the
ground truth.

## Resolution and relation

`serial-number` is globally unique within a manufacturer's production
(unlike `asset-tag`, which is only unique within an organisation's
inventory). Paired with [`manufacturer`](/manufacturer/) it is
globally unique across all manufacturers. This makes
`serial-number` the right key for cross-organisational CI
identification — two organisations tracking the same physical unit
will have different `asset-tag` values but the same `serial-number`.
