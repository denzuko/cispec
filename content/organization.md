---
title: "organization"
term: "organization"
core: true
requiredFor: ["any CI"]
related: ["orgunit", "owner", "oid", "duns"]
docOid: "1.3.6.1.4.1.42387.1"
docGuid: "7535ebf6-a75f-5435-90d6-0a6ac2251c1c"
date: 2026-06-30
draft: false
---

`org.cispec.organization` identifies the owning organisation of a
Change Item.

## Value format

A lower-case slug: alphanumeric characters and hyphens only, no leading
or trailing hyphen.

```sh
org.cispec.organization=daplanet
```

## Conformance

`org.cispec.organization` is REQUIRED for Declared conformance on any
Change Item, regardless of type.
