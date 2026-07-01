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
currently fulfilling. It is a core key — present in the original
`net.matrix` baseline label set alongside `organization`, `orgunit`,
`owner`, `version`, and `environment` — because every CI, regardless
of type, fulfills some role within the operational context it is
assigned to.

`role` applies universally: a server in active production vs warm
standby (`role=primary` vs `role=standby`), a surgical instrument in
active rotation vs stock supply (`role=active-use` vs
`role=stock-supply`), a network switch in production vs a cold spare
(`role=in-rotation` vs `role=spare`), a weapon system on active
deployment vs in depot maintenance (`role=deployed` vs
`role=depot`), an access credential in daily use vs held in reserve
(`role=active` vs `role=reserve`), a pharmaceutical lot in active
dispensing vs quality-hold (`role=dispensing` vs `role=qc-hold`).

This is distinct from [`org.cispec.application`](/application/),
which identifies what software service or application a CI implements
— `application` is specific to software and service CIs.
`role` is the operational state of any CI instance within its
current deployment or assignment context.

`role` was previously scoped to software Change Items only. That
scoping was incorrect — the original `net.matrix` Dockerfile label
examples demonstrated `role` as a baseline label applicable to any
deployed thing, not a software-specific annotation.

## Value format

A lower-case slug: alphanumeric characters and hyphens only, no
leading or trailing hyphen. Values are organisation-defined and
context-specific; this specification does not enumerate or restrict
the set.

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

`role` is not independently attestable. It is a self-asserted
operational state assigned by the owning organisation. The truth of
a role assignment — whether a CI is actually fulfilling the role
claimed — is a runtime or inspection concern, not a label concern.

## Resolution and relation

Every Change Item sharing the same `role` value forms a real,
expected edge in the namespace's knowledge graph — "every CI in
`stock-supply`" or "every `standby` instance" are operational
queries central to capacity planning, incident response, and
maintenance scheduling.
