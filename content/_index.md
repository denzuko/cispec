---
title: "cispec — Change Item Attribution Standard"
description: "A public namespace and conformance specification for Change Item attribution across software supply chains."
date: 2026-06-29
draft: false
---

# cispec

`org.cispec` is a public Change Item (CI) attribution namespace and conformance
specification for software supply chains. It defines a stable set of label keys,
OID arcs, and policy gates that any project can adopt to make artefact provenance
machine-verifiable.

"CI" denotes **Change Item** — a tracked unit of change in a configuration
management database. It does not refer to continuous integration pipelines.

## What the spec defines

- A canonical label key schema (`org.cispec.*`) for containers, binaries, and
  source artefacts
- An OID subtree under IANA PEN 42387 (`iso.org.dod.internet.42387.*`)
- A Rego policy gate library for OPA-based conformance checking
- Conformance levels: **Declared**, **Verified**, **Attested**
- A reference C99 header (`matrix_id.h`) and SBCL module (`matrix-id.lisp`)
  that bake attribution strings into compiled artefacts at build time

## Current version

**v1.0** — published {{< param "specVersion" >}}

All labels, OID assignments, and gate schemas documented here are stable.
Backwards-incompatible changes increment the major version and are announced
via the [changelog](/spec/changelog/).

## Predecessor namespace

`org.cispec` supersedes `net.matrix.*`, which was retired following the
Dynatrace acquisition of matrix.net. Projects migrating from `net.matrix.*`
should treat this as a MAJOR semver event; consult the
[migration guide](/spec/migration/) for a mechanical substitution table.

## Licence

All specification text, reference headers, and gate policies are published
under [BSD-2-Clause](https://spdx.org/licenses/BSD-2-Clause.html).
SPDX identifier: `BSD-2-Clause`.

D&amp;B DUNS: 039-271-257 · IANA PEN: 42387
