# cispec

[![SPDX-License-Identifier: BSD-2-Clause](https://img.shields.io/badge/SPDX-BSD--2--Clause-blue.svg)](https://spdx.org/licenses/BSD-2-Clause.html)
[![Spec version: 1.0](https://img.shields.io/badge/spec-v1.0-green.svg)](https://cispec.org/spec/)
[![IANA PEN: 42387](https://img.shields.io/badge/IANA%20PEN-42387-lightgrey.svg)](https://cispec.org/asn/)

Source repository for [cispec.org](https://cispec.org) — the public
standards authority site for the `org.cispec` Change Item attribution
namespace.

## What this repo contains

- `content/` — Hugo source for cispec.org
- `content/spec/` — Normative v1.0 specification, reference `matrix_id.h`,
  reference `matrix-id.lisp`
- `content/gates/` — Rego policy gate library (cispec, SLSA, C99, SBOM,
  containers)
- `content/asn/` — IANA PEN 42387 OID arc documentation
- `content/tools/` — `cimatrix` CLI documentation

## Relationship to denzuko/cimatrix

This repo is the **spec and standards site**. The validation toolkit
(`cimatrix verify-*` CLI and GitHub Action) lives in
[denzuko/cimatrix](https://github.com/denzuko/cimatrix) and cites this
site as its upstream source of truth.

## Predecessor namespace

`org.cispec` supersedes `net.matrix.*`. See the
[migration guide](https://cispec.org/spec/#8-migration-from-netmatrix) for
the mechanical substitution table.

## Licence

BSD-2-Clause. See [LICENCE](./LICENCE).

SPDX-License-Identifier: `BSD-2-Clause`  
D&B DUNS: 039-271-257 · IANA PEN: 42387
