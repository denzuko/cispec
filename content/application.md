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

`org.cispec.application` records the designed purpose or applied
function of a Change Item — what it was built, procured, or deployed
to do. It is a core key, present in the original `net.matrix` baseline
label set alongside `organization`, `orgunit`, `owner`, `role`,
`version`, and `environment`.

"Application" derives from Latin *applicatio* — the act of applying
something to a purpose. The computing sense (a software product
applied to user needs) is a modern narrowing of the word's original
meaning, not its definition. In the multi-domain scope of `org.cispec`,
application covers any CI's designed purpose across all CI types:

- A software service: `application=mcp-server`, `application=llm-model`
- A pharmaceutical: `application=therapeutic-agent`,
  `application=vaccine`
- A weapon system: `application=fire-control`,
  `application=air-defence`
- A medical device: `application=infusion-pump`,
  `application=diagnostic-imaging`
- A network element: `application=edge-router`,
  `application=packet-core`
- An industrial machine: `application=cnc-milling`,
  `application=injection-moulding`
- A cryptographic asset: `application=code-signing`,
  `application=tls-termination`
- A facility: `application=data-centre`,
  `application=cleanroom`

This is distinct from [`org.cispec.role`](/role/), which records the
operational state a specific CI *instance* is currently fulfilling.
`application` is a type-level designed-purpose fact; `role` is an
instance-level operational-state fact. A server with
`application=database` may have `role=primary` or `role=standby`
depending on which instance it is within its deployment. A surgical
instrument with `application=laparoscopic-surgery` may have
`role=active-use` or `role=stock-supply`.

This term was previously scoped to software Change Items only, defined
as "application or service name." That scoping was incorrect — the
original `net.matrix` Dockerfile label examples demonstrated
`application` as a baseline label applicable to any deployed thing,
not a software-specific annotation.

## Value format

A lower-case slug: alphanumeric characters and hyphens only, no
leading or trailing hyphen. Values are organisation-defined and
domain-specific; this specification does not enumerate or restrict
the set.

```sh
org.cispec.application=mcp-server
org.cispec.application=llm-model
org.cispec.application=therapeutic-agent
org.cispec.application=fire-control
org.cispec.application=infusion-pump
org.cispec.application=edge-router
org.cispec.application=cnc-milling
org.cispec.application=code-signing
```

## Conformance

`org.cispec.application` is REQUIRED for Declared conformance on any
Change Item, regardless of type.

## Attestation

`application` is not independently attestable. It is a self-asserted
designed-purpose classification assigned by the owning organisation.
For regulated CI types the designed purpose may be independently
verifiable: FDA device classification records attest the intended use
of a medical device; DO-178C certification records attest the
intended application of safety-critical software; NATO stock numbers
encode weapon system application classification.

## Resolution and relation

Every Change Item sharing the same `application` value forms an edge
in the namespace's knowledge graph — "every `infusion-pump`" or
"every `fire-control` system" are real, expected queries for
vulnerability management (when an advisory targets a specific
application type), procurement planning, and domain-specific
compliance review.
