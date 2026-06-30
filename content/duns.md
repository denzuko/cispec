---
title: "duns"
term: "duns"
core: true
optionalFor: ["any CI"]
related: ["organization", "oid", "costcenter"]
docOid: "1.3.6.1.4.1.42387.2.1"
docGuid: "8ef717a5-d8c0-512d-8cc5-9d62cea811ca"
date: 2026-06-30
draft: false
---

`org.cispec.duns` records the D&amp;B DUNS number of the owning
organisation, expressed in OID notation.

## Value format

`iso.org.duns.<9-digit-number>` — hyphens stripped from the source DUNS
number.

```sh
org.cispec.duns=iso.org.duns.039271257
```

## Conformance

`org.cispec.duns` is OPTIONAL. It is most useful where federal
contracting, SBIR/STTR, or other DUNS-keyed processes apply.
