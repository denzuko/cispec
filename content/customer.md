---
title: "customer"
term: "customer"
core: true
optionalFor: ["any CI"]
related: ["organization", "costcenter", "owner"]
date: 2026-06-30
draft: false
---

`org.cispec.customer` identifies the customer a Change Item is
delivered for or attributed to, where the owning organisation delivers
services or assets to external customers.

## Value format

A customer identifier in whatever scheme the owning organisation uses
for billing or contract reference.

```sh
org.cispec.customer=PVT-01
```

## Conformance

`org.cispec.customer` is OPTIONAL. It applies where cost attribution or
chargeback to an external customer is meaningful for the Change Item.
