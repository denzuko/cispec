---
title: "organization"
term: "organization"
core: true
requiredFor: ["any CI"]
related: ["orgunit", "owner", "oid", "duns"]
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
