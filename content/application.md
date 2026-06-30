---
title: "application"
term: "application"
core: false
requiredFor: ["software Change Items"]
related: ["version", "role", "owner", "organization"]
docOid: "1.3.6.1.4.1.42387.2.6.1.1"
docGuid: "3d021461-8d8b-5428-959a-eef4e7a3cd4d"
date: 2026-06-30
draft: false
---

`org.cispec.application` identifies the application or service name a
software Change Item belongs to. This term is a worked example of an
extended key — useful and common for software, not meaningful for
every Change Item type, and not part of the universal core.

## Value format

A short, stable application or service name.

```sh
org.cispec.application=odoo-mcp-server
```

## Conformance

`org.cispec.application` is REQUIRED for software Change Items
alongside the core keys.

## Attestation

`application` is not independently attestable on its own — the name is
a self-asserted string. In combination with
[`org.cispec.version`](/version/) and a SLSA/cosign provenance chain,
the pairing (this application, at this version) becomes attestable
the same way `version` does in combination with provenance; see
`version`'s own Attestation section.

## Resolution and relation

Every Change Item sharing the same `application` value forms an edge
in the namespace's knowledge graph — "every Change Item belonging to
`odoo-mcp-server`" is a real, expected query, typically answered by a
deployment platform, CMDB, or release-tracking system.
