---
title: "duns"
term: "duns"
core: true
optionalFor: ["any CI"]
related: ["organization", "oid", "costcenter"]
date: 2026-06-30
draft: false
---

`org.cispec.duns` records the D&amp;B DUNS number of the owning
organisation, expressed in OID notation.

## Value format

`iso.org.duns.<9-digit-number>` — hyphens stripped from the source DUNS
number.

```
org.cispec.duns=iso.org.duns.039271257
```

## Conformance

`org.cispec.duns` is OPTIONAL. It is most useful where federal
contracting, SBIR/STTR, or other DUNS-keyed processes apply.
