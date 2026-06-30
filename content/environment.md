---
title: "environment"
term: "environment"
core: true
recommendedFor: ["any CI"]
related: ["version", "role", "owner"]
docOid: "1.3.6.1.4.1.42387.2.4.2"
docGuid: "fb2fecdf-cbaf-5f0c-bd16-cffe882b9eb0"
date: 2026-06-30
draft: false
---

`org.cispec.environment` records the deployment or operational
environment of a Change Item.

## Value format

A lower-case slug: alphanumeric characters and hyphens only.

```sh
org.cispec.environment=production
```

Common values include `production`, `staging`, `development`, and
`sandbox`, though the namespace does not enumerate or restrict the set
— any organisation-meaningful environment slug is conformant.

## Conformance

`org.cispec.environment` is RECOMMENDED for any Change Item where
environment context affects criticality, change windows, or
change-freeze policy.

## Attestation

`environment` is not independently attestable. It is a self-asserted
operational context with no external registry to verify against. For
software Change Items, environment claims can be cross-checked against
deployment infrastructure (is this artefact actually running where it
claims to be) but that check is an implementation concern for the
organisation's own deployment tooling, not something this
specification or a cimatrix gate verifies directly.

## Resolution and relation

Every Change Item sharing the same `environment` value forms an edge
in the namespace's knowledge graph — "everything currently in
`production`" is a real, expected query, central to change-freeze
and incident-response tooling, answered by whatever CMDB or deployment
platform the organisation runs.
