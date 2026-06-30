---
title: "specversion"
term: "specversion"
core: true
recommendedFor: ["any CI"]
related: ["version", "oid"]
date: 2026-06-30
draft: false
---

`org.cispec.specversion` records the version of this specification a
label set was authored and validated against.

## Value format

A semantic version 2.0 string matching a published specification
version.

```sh
org.cispec.specversion=1.0
```

## Conformance

`org.cispec.specversion` is RECOMMENDED on every Change Item. It allows
a validator encountering an older label set to apply the correct
historical conformance rules rather than the current ones.
