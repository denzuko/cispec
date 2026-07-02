---
title: "role"
term: "role"
core: true
requiredFor: ["any CI"]
related: ["owner", "organization", "orgunit", "environment", "application"]
docOid: "1.3.6.1.4.1.42387.2.1.3"
docGuid: "325eee00-01e1-58c8-bb0b-982ab775e039"
date: 2026-06-30
draft: false
---

`org.cispec.role` records the operational role a Change Item is
currently fulfilling — what this specific instance is doing right now,
within the context it is assigned to. This is a required core key that
applies to every CI regardless of type.

Role distinguishes instances of the same type from each other: a
surgical instrument in active rotation versus one in stock supply, a
network switch in production versus a cold spare, a server running as
primary versus standby, a weapon system on active deployment versus in
depot maintenance, a pharmaceutical lot in active dispensing versus on
quality hold. The `application` key says what the CI was built for;
`role` says what this instance is doing with it right now.

## Value format

A lower-case slug: alphanumeric characters and hyphens only, no
leading or trailing hyphen. Values are defined by the owning
organisation — this specification does not enumerate or restrict them.

```sh
org.cispec.role=primary
org.cispec.role=standby
org.cispec.role=active-use
org.cispec.role=stock-supply
org.cispec.role=in-rotation
org.cispec.role=spare
org.cispec.role=deployed
org.cispec.role=depot
org.cispec.role=mcp-server
org.cispec.role=chatbot
```

## Conformance

`org.cispec.role` is REQUIRED for Declared conformance on any Change
Item, regardless of type.

## Attestation

`role` is a self-asserted operational state. Whether a CI is actually
fulfilling the role it claims is a runtime or inspection concern —
this specification makes no claim about that, only that the label
is present and well-formed.

## Resolution and relation

Every Change Item sharing the same `role` value forms an edge in the
namespace's knowledge graph — "every CI in `stock-supply`" or "every
`standby` instance" are operational queries for capacity planning,
incident response, and maintenance scheduling.
