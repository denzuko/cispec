---
title: "orgunit"
term: "orgunit"
core: true
requiredFor: ["any CI"]
related: ["organization", "owner", "costcenter"]
date: 2026-06-30
draft: false
---

`org.cispec.orgunit` identifies the organisational unit responsible for
a Change Item — a team, department, or business unit within the owning
organisation.

## Value format

A lower-case slug: alphanumeric characters and hyphens only, no leading
or trailing hyphen.

```sh
org.cispec.orgunit=dps
```

## Conformance

`org.cispec.orgunit` is REQUIRED for Declared conformance on any
Change Item, regardless of type.
