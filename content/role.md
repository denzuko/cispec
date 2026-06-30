---
title: "role"
term: "role"
core: false
recommendedFor: ["software Change Items"]
related: ["application", "owner", "environment"]
docOid: "1.3.6.1.4.1.42387.2.6.1.2"
docGuid: "5bedd70b-5466-578d-a7b9-0e25d5017287"
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

## Attestation

`role` is not independently attestable. It is a self-asserted
functional classification with no external registry to verify against.

## Resolution and relation

Every Change Item sharing the same `role` value forms an edge in the
namespace's knowledge graph — "every `mcp-server`-role Change Item"
is a real, expected query, typically used for capacity planning or
incident triage by whatever CMDB the organisation runs.
