# cispec

[![SPDX-License-Identifier: BSD-2-Clause](https://img.shields.io/badge/SPDX-BSD--2--Clause-blue.svg)](https://spdx.org/licenses/BSD-2-Clause.html)
[![org.cispec: v1.0](https://img.shields.io/badge/org.cispec-v1.0-green.svg)](https://cispec.org/)
[![IANA PEN: 42387](https://img.shields.io/badge/IANA%20PEN-42387-lightgrey.svg)](https://cispec.org/oid/)

Source for [cispec.org](https://cispec.org) — the `org.cispec` Change Item
attribution namespace.

## What this is

A domain-scoped identifier namespace for attesting and identifying Change
Items — software, hardware, industrial control systems, cryptographic
assets, evidence and case files, access and identity changes, contracts,
or any other tracked unit of change. `org.cispec` works the way any
reverse-DNS namespace works: a domain-scoped claim to uniqueness and
authority, cited by any system that needs it, not imported as a library
dependency.

The namespace is open. Anyone may mint a new `org.cispec.*` term without
registering it here, subject to two rules stated normatively on the
[root page](https://cispec.org/): the term MUST resolve over public TLS,
and it MUST be necessary (a real Change Item attribute, not a duplicate
of an existing term with a different name).

## Site structure

This site is flat by design — a knowledge graph of peer pages, not a
hierarchy. Every term resolves at its own root-level path
(`cispec.org/owner/`, `cispec.org/version/`, ...) and links to related
terms directly. There is no `/types/`, `/spec/`, `/gates/`, or `/tools/`
section; the root page *is* the specification, and the flat term pages
*are* its content.

## Layers

- **Governance** (this repo, `cispec.org`) — defines what terms mean and
  what conformance requires. No code, no tooling.
- **Validation** ([cimatrix.org](https://cimatrix.org)) — checks that a
  given artefact's labels are conformant to this specification.
- **Implementation** (anyone) — how a given organisation's CMDB, ERP, or
  system of record actually resolves and traverses relations between
  values is out of scope here and at cimatrix.

## Predecessor namespace

`org.cispec` supersedes `net.matrix.*`. See the
[migration table](https://cispec.org/#predecessor-namespace) for the
substitution.

## Licence

BSD-2-Clause. See [LICENCE](./LICENCE).

SPDX-License-Identifier: `BSD-2-Clause`
D&B DUNS: 039-271-257 &middot; IANA PEN: 42387
