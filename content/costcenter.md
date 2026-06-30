---
title: "costcenter"
term: "costcenter"
core: true
optionalFor: ["any CI"]
related: ["organization", "orgunit", "customer", "owner"]
docOid: "1.3.6.1.4.1.42387.3.1"
docGuid: "29e0e3c3-012a-5170-ad0b-877243508b36"
date: 2026-06-30
draft: false
---

`org.cispec.costcenter` identifies the cost centre a Change Item is
charged against, for organisations practising cost accounting and
chargeback across CapEx/OpEx categories. It corresponds to the
`Cost_Center` field in a typical CMDB cost ledger — see the
[root page's financial category](/#document-identifiers) for how this
term relates to the broader cost-accounting model.

## Value format

A cost centre identifier in whatever scheme the owning organisation
uses internally.

```sh
org.cispec.costcenter=INT-01
```

## Conformance

`org.cispec.costcenter` is OPTIONAL. It is most useful where an
organisation's CMDB also functions as a cost-accounting ledger,
tracking CapEx/OpEx, depreciation, and chargeback by cost centre.

## Attestation

`costcenter` is not independently attestable. It is an internal
accounting code with no external registry; this specification does not
require it to resolve anywhere. Financial audit of cost-centre
accuracy is an implementation concern for the organisation's own
finance system, not something this label or any cimatrix gate
verifies.

## Resolution and relation

Every Change Item sharing the same `costcenter` value forms an edge in
the namespace's knowledge graph — "everything charged against
`INT-01`" is a real, expected query, answered by whatever
cost-accounting ledger the organisation runs, not by this
specification.
