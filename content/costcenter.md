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
chargeback across CapEx/OpEx categories.

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
