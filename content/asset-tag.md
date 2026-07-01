---
title: "asset-tag"
term: "asset-tag"
core: false
recommendedFor: ["any CI tracked by a physical or logical inventory control system"]
related: ["commonname", "manufacturer", "make", "model", "location", "owner"]
docOid: "1.3.6.1.4.1.42387.2.6.2.1"
docGuid: "f5bc9f9b-9561-5f8d-811c-33e5ce0ade50"
date: 2026-06-30
draft: false
---

`org.cispec.asset-tag` records the inventory control number assigned
to a Change Item by whoever tracks it. This is the machine-issued,
opaque identifier used by logistics, procurement, and asset management
systems — a barcode value, an RFID tag ID, a property control number,
a NATO stock number, a serial plate number, a government property tag.

This is an original `net.matrix` key, carried forward from the
LDAP-backed CMDB design.

`asset-tag` is distinct from [`org.cispec.commonname`](/commonname/),
which is the human-recognizable name. In large organisations these are
always different: an asset tag is what a barcode scanner reads; a
common name is what the operations team puts on a whiteboard. In
smaller organisations they may coincide, but the distinction is
meaningful — an asset tag is assigned by a control system, a common
name is assigned by people.

`asset-tag` applies to any tracked CI with a control number: servers,
network equipment, vehicles, weapons systems, medical devices,
laboratory instruments, pharmaceuticals (lot numbers), aircraft
components (part numbers with traceability requirements), industrial
machinery, and any physical asset under property management.

## Value format

The inventory control number as issued by the tracking system. Format
is organisation-defined; this specification does not constrain it.

```sh
org.cispec.asset-tag=ASSET-001234
org.cispec.asset-tag=7010-00-256-6273
org.cispec.asset-tag=LOT-2026-B-04421
org.cispec.asset-tag=SN-C8F3A2B1
```

## Conformance

`org.cispec.asset-tag` is RECOMMENDED for any CI tracked by a formal
inventory control system. It is not REQUIRED for Declared conformance.

## Attestation

`asset-tag` is independently attestable against the owning
organisation's own asset register or, for regulated items (NATO
stock numbers, pharmaceutical lot numbers, aviation part numbers),
against the relevant external registry.

## Resolution and relation

`asset-tag` values SHOULD be unique within an organisation's own
inventory system but are not globally unique across organisations.
Reverse-lookup — "find the CI with asset tag `ASSET-001234`" — is
scoped within `organization` to be meaningful.
