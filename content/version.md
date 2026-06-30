---
title: "version"
term: "version"
core: true
requiredFor: ["any CI"]
related: ["organization", "specversion", "environment"]
docOid: "1.3.6.1.4.1.42387.4"
docGuid: "f23f2c63-1792-5f99-b728-a9d11e8292db"
date: 2026-06-30
draft: false
---

`org.cispec.version` records the version of a Change Item. This term is
deliberately not split by CI type — a software release, a firmware
build, a document revision, and a policy amendment all use the same
key. Version is version; the kind of thing being versioned does not
change the key.

## Value format

A semantic version 2.0 string. Pre-release and build-metadata suffixes
are permitted.

```sh
org.cispec.version=1.3.0
org.cispec.version=2.0.0-rc.1
```

Where a Change Item's native versioning scheme is not semver
(a document revision number, a firmware build date), the value SHOULD
be the most precise version identifier available, even if it does not
strictly satisfy semver 2.0 grammar; conformance tooling SHOULD treat
non-semver values as a warning, not a hard failure, for CI types where
semver does not naturally apply.

## Conformance

`org.cispec.version` is REQUIRED for Declared conformance on any
Change Item, regardless of type.
