---
title: "customer"
term: "customer"
core: true
optionalFor: ["any CI"]
related: ["organization", "costcenter", "owner"]
docOid: "1.3.6.1.4.1.42387.3"
docGuid: "e27b14fc-2047-5b13-ae4e-1d33e7613872"
date: 2026-06-30
draft: false
---

`org.cispec.customer` identifies the customer a Change Item is
delivered for or attributed to, where the owning organisation delivers
services or assets to external customers. It pairs with
[`org.cispec.costcenter`](/costcenter/) for organisations practising
cost accounting and chargeback against specific customer engagements.

## Value format

A customer identifier in whatever scheme the owning organisation uses
for billing or contract reference.

```sh
org.cispec.customer=PVT-01
```

## Conformance

`org.cispec.customer` is OPTIONAL. It applies where cost attribution or
chargeback to an external customer is meaningful for the Change Item.

## Attestation

`customer` is not independently attestable by this specification. The
identifier is internal to the owning organisation's own billing or
contract-reference scheme and has no external registry to verify
against — unlike [`org.cispec.duns`](/duns/), which references a
publicly verifiable registry. Where contractual attestation of a
customer relationship matters (a signed services agreement, a
statement of work), that attestation belongs in the organisation's own
contract-management system, referenced but not replaced by this label.

## Resolution and relation

Every Change Item sharing the same `customer` value forms an edge in
the namespace's knowledge graph — "everything delivered for `PVT-01`"
is a real, expected query, resolved by whatever billing or CRM system
the organisation runs, not by this specification.
