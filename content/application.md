---
title: "application"
term: "application"
core: true
requiredFor: ["any CI"]
related: ["role", "owner", "organization", "version", "environment"]
docOid: "1.3.6.1.4.1.42387.2.1.4"
docGuid: "84784cd0-297e-5aec-962d-3e552cd55965"
date: 2026-06-30
draft: false
---

`org.cispec.application` records what a Change Item was built,
procured, or deployed to do — its designed purpose. This is a required
core key that applies to every CI regardless of type.

A server has an application (`application=database`). A pharmaceutical
lot has an application (`application=therapeutic-agent`). A weapon
system has an application (`application=fire-control`). A medical
device has an application (`application=infusion-pump`). An AI model
has an application (`application=llm-model`). Every tracked thing was
acquired or built for a reason; this key records that reason.

This is distinct from [`org.cispec.role`](/role/), which records what
this specific *instance* is currently doing. `application` is what the
CI was *designed for*; `role` is what it is *doing right now*. A
database server (`application=database`) may be a primary or a standby
(`role=primary` or `role=standby`). A surgical instrument
(`application=laparoscopic-surgery`) may be in active use or in stock
(`role=active-use` or `role=stock-supply`).

## Value format

A lower-case slug: alphanumeric characters and hyphens only, no
leading or trailing hyphen. Values are defined by the owning
organisation to match their own asset taxonomy.

```sh
org.cispec.application=mcp-server
org.cispec.application=llm-model
org.cispec.application=therapeutic-agent
org.cispec.application=fire-control
org.cispec.application=infusion-pump
org.cispec.application=edge-router
org.cispec.application=cnc-milling
org.cispec.application=code-signing
org.cispec.application=database
```

## Conformance

`org.cispec.application` is REQUIRED for Declared conformance on any
Change Item, regardless of type.

## Attestation

`application` is a self-asserted classification. For regulated CI
types, the designed purpose may be independently verifiable: FDA
device classification records attest the intended use of a medical
device; DO-178C certification records attest the intended application
of safety-critical software; NATO stock numbers encode weapon system
application classification.

## Resolution and relation

Every Change Item sharing the same `application` value forms an edge
in the namespace's knowledge graph — "every `infusion-pump`" or
"every `fire-control` system" are real queries for vulnerability
management, procurement planning, and compliance review.
