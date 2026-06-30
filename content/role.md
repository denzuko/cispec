---
title: "role"
term: "role"
core: false
recommendedFor: ["software Change Items"]
related: ["application", "owner", "environment"]
docOid: "1.3.6.1.4.1.42387.6.1.2"
docGuid: "a62cdbbf-15c2-53bb-8c8b-3a2227ca13c6"
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
