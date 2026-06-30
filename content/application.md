---
title: "application"
term: "application"
core: false
requiredFor: ["software Change Items"]
related: ["version", "role", "owner", "organization"]
docOid: "1.3.6.1.4.1.42387.6.1.1"
docGuid: "b7289218-6197-5e56-b5f4-4273ceab6f8d"
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
