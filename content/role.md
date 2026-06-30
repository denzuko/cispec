---
title: "role"
term: "role"
core: false
recommendedFor: ["software Change Items"]
related: ["application", "owner", "environment"]
date: 2026-06-30
draft: false
---

`org.cispec.role` records the functional role a software Change Item
performs within its deployment context.

## Value format

A lower-case slug: alphanumeric characters and hyphens only.

```sh
org.cispec.role=mcp-server
```

## Conformance

`org.cispec.role` is RECOMMENDED for software Change Items. It is not a
universal core key.
