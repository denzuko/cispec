---
title: "environment"
term: "environment"
core: true
recommendedFor: ["any CI"]
related: ["version", "role", "owner"]
date: 2026-06-30
draft: false
---

`org.cispec.environment` records the deployment or operational
environment of a Change Item.

## Value format

A lower-case slug: alphanumeric characters and hyphens only.

```
org.cispec.environment=production
```

Common values include `production`, `staging`, `development`, and
`sandbox`, though the namespace does not enumerate or restrict the set
— any organisation-meaningful environment slug is conformant.

## Conformance

`org.cispec.environment` is RECOMMENDED for any Change Item where
environment context affects criticality, change windows, or
change-freeze policy.
