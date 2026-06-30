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

## Attestation

`version` is not independently attestable by itself — a version string
is a self-asserted claim with nothing to verify against on its own.
For software Change Items it becomes attestable in combination with a
SLSA provenance chain or a `cosign`-signed artefact: the build pipeline
that produced version `1.3.0` can be cryptographically tied to that
specific version string, making the *combination* of `version` plus a
provenance attestation independently verifiable, even though `version`
alone is not. This is the cimatrix `verify-slsa` use case — checking
that a claimed version matches a signed, attested build.

For non-software Change Items (a document revision, a policy
amendment), `version` typically has no equivalent attestation path
and remains a self-asserted value.

## Resolution and relation

Every Change Item sharing the same `version` value within the same
`organization`/`application` pair forms an edge in the namespace's
knowledge graph — "every deployment currently running `1.3.0`" is a
real, expected query, answered by whatever deployment-tracking or CMDB
system the organisation runs.
