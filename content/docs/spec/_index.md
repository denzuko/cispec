---
title: "org.cispec Label Schema — v1.0"
description: "Normative specification for the org.cispec Change Item attribution label namespace."
date: 2026-06-29
version: "1.0"
status: "stable"
spdx: "BSD-2-Clause"
draft: false
---

# org.cispec Label Schema

**Version:** 1.0  
**Status:** Stable  
**SPDX-Licence-Identifier:** BSD-2-Clause  
**IANA PEN:** 42387  
**Canonical URL:** https://cispec.org/spec/

---

## 1. Purpose

This specification defines the `org.cispec.*` label namespace for identifying
and attributing Change Items (CIs) across compiled binaries, OCI container
images, source repositories, and CI/CD artefacts.

A Change Item is a tracked unit of change in a configuration management
database (CMDB). Every artefact that participates in a supply chain carries
`org.cispec.*` strings that uniquely identify its origin, ownership, and
deployment context. These strings are machine-readable, statically verifiable
without code execution, and stable across build environments.

---

## 2. Definitions

**Change Item (CI)**  
A tracked unit of change. The entity being described by the label set.

**Label set**  
The complete collection of `org.cispec.*` key–value pairs applied to an
artefact.

**Conformance level**  
One of: Declared, Verified, Attested. See §6.

**IANA PEN**  
Internet Assigned Numbers Authority Private Enterprise Number. DPS PEN: 42387.

---

## 3. Label keys

All keys use the reverse-DNS prefix `org.cispec`. Keys are lower-case; words
are separated by a single dot. No key may exceed 253 characters total
(RFC 1035 DNS label limit).

| Key | Description | Example value |
|---|---|---|
| `org.cispec.organization` | Owning organisation slug | `daplanet` |
| `org.cispec.orgunit` | Organisational unit slug | `dps` |
| `org.cispec.owner` | Identity contact (key fingerprint or handle) | `FC13F74B@cispec.org` |
| `org.cispec.oid` | IANA OID arc for this artefact | `iso.org.dod.internet.42387` |
| `org.cispec.duns` | D&B DUNS number in OID notation | `iso.org.duns.039271257` |
| `org.cispec.customer` | Customer identifier | `PVT-01` |
| `org.cispec.costcenter` | Cost centre identifier | `INT-01` |
| `org.cispec.application` | Application or service name | `odoo-mcp-server` |
| `org.cispec.role` | Functional role of this artefact | `mcp-server` |
| `org.cispec.version` | Semantic version (semver 2.0) | `1.3.0` |
| `org.cispec.environment` | Deployment environment | `production` |

### 3.1 Required keys

A label set achieves **Declared** conformance when all of the following keys
are present and non-empty:

- `org.cispec.organization`
- `org.cispec.orgunit`
- `org.cispec.application`
- `org.cispec.version`

### 3.2 Recommended keys

- `org.cispec.owner`
- `org.cispec.oid`
- `org.cispec.role`

### 3.3 Optional keys

All remaining keys in §3 are optional. Additional keys using the
`org.cispec.x.*` prefix are reserved for experimental extensions and must not
appear in stable artefacts.

---

## 4. Value constraints

### 4.1 Slug keys

`organization`, `orgunit`, `role`, `environment`: lower-case alphanumeric and
hyphens only (`[a-z0-9-]+`). No leading or trailing hyphens.

### 4.2 Version

`version` must be a valid semver 2.0 string as defined by
[semver.org](https://semver.org/). Pre-release and build-metadata suffixes are
permitted.

### 4.3 OID arc

`oid` must be a dot-notation OID string rooted at
`iso.org.dod.internet.42387`. Sub-arcs are enumerated at
[/oid/](/oid/).

### 4.4 DUNS

`duns` must follow the pattern `iso.org.duns.<9-digit-number>` with no
hyphens or spaces in the numeric portion.

---

## 5. Carrier formats

### 5.1 OCI container labels

Applied as OCI image config labels per the
[OCI Image Spec](https://github.com/opencontainers/image-spec/blob/main/config.md):

```
LABEL org.cispec.organization="daplanet"
LABEL org.cispec.orgunit="dps"
LABEL org.cispec.application="odoo-mcp-server"
LABEL org.cispec.version="1.3.0"
```

Podman Quadlet `[Container]` sections use `Label=` entries:

```ini
[Container]
Label=org.cispec.organization=daplanet
Label=org.cispec.orgunit=dps
Label=org.cispec.application=odoo-mcp-server
Label=org.cispec.version=1.3.0
```

### 5.2 Compiled binaries (C99)

Label strings are baked into the binary at compile time as `volatile const
char[]` arrays in a dedicated translation unit. This makes them extractable
with `strings(1)` without executing the binary.

The canonical reference header is at [/spec/matrix_id.h](/spec/matrix_id.h).
See §5.2.1 for the baking pattern.

#### 5.2.1 Baking pattern

```c
/* SPDX-License-Identifier: BSD-2-Clause */
/* org.cispec attribution — do not optimise away */
volatile const char CISPEC_ORGANIZATION[] = "org.cispec.organization=daplanet";
volatile const char CISPEC_ORGUNIT[]      = "org.cispec.orgunit=dps";
volatile const char CISPEC_APPLICATION[]  = "org.cispec.application=my-tool";
volatile const char CISPEC_VERSION[]      = "org.cispec.version=1.0.0";
```

The `volatile` qualifier prevents the compiler from eliding the strings as
dead data. Verify post-build:

```sh
strings ./my-binary | grep '^org\.cispec\.'
```

### 5.3 SBCL / Common Lisp

The canonical module is at [/spec/matrix-id.lisp](/spec/matrix-id.lisp).
Strings are defined as `defconstant` forms and embedded in the compiled image.

### 5.4 CI/CD workflow environment blocks

```yaml
env:
  CISPEC_ORGANIZATION: daplanet
  CISPEC_ORGUNIT: dps
  CISPEC_APPLICATION: my-tool
  CISPEC_VERSION: ${{ github.ref_name }}
```

---

## 6. Conformance levels

### 6.1 Declared

All required keys (§3.1) are present in the artefact's label set. No
automated verification has been performed. Declared conformance is
self-asserted.

### 6.2 Verified

A `cimatrix verify-binary` or `cimatrix verify-gate` run has confirmed that:

- All required keys are present and syntactically valid
- The binary carries baked strings extractable by `strings(1)` (for compiled
  artefacts)
- Any accompanying Rego gates pass `opa check`

Verification is repeatable and does not require code execution of the subject
artefact.

### 6.3 Attested

A SLSA provenance attestation exists for the artefact and has been verified
by `slsa-verifier`. The attestation references the cispec version and gate
digest used during the build. This level requires a hermetic build
environment and is the target for production artefacts.

---

## 7. Versioning policy

The spec version follows semver 2.0.

- **MAJOR** — label keys are renamed, removed, or semantically changed;
  value constraints are tightened in a breaking way.
- **MINOR** — new optional label keys are added; new conformance sub-levels
  are defined.
- **PATCH** — editorial corrections, clarifications, example updates.

Artefacts should record the spec version they were validated against using
the `org.cispec.specversion` label:

```
org.cispec.specversion=1.0
```

---

## 8. Migration from net.matrix.*

`net.matrix.*` keys map to `org.cispec.*` keys by direct substitution of the
prefix. No key names, value formats, or semantics changed in v1.0.

| net.matrix.* (retired) | org.cispec.* (current) |
|---|---|
| `net.matrix.organization` | `org.cispec.organization` |
| `net.matrix.orgunit` | `org.cispec.orgunit` |
| `net.matrix.owner` | `org.cispec.owner` |
| `net.matrix.oid` | `org.cispec.oid` |
| `net.matrix.duns` | `org.cispec.duns` |
| `net.matrix.customer` | `org.cispec.customer` |
| `net.matrix.costcenter` | `org.cispec.costcenter` |
| `net.matrix.application` | `org.cispec.application` |
| `net.matrix.role` | `org.cispec.role` |
| `net.matrix.version` | `org.cispec.version` |
| `net.matrix.environment` | `org.cispec.environment` |

This migration is a MAJOR semver event for any project consuming the label
namespace. Update all Dockerfiles, Quadlet units, C99 translation units,
SBCL modules, workflow env blocks, and Rego gates in a single coordinated
commit and tag a new MAJOR version.

---

## Changelog

### v1.0 — 2026-06-29

- Initial public release
- Namespace migrated from `net.matrix.*` to `org.cispec.*`
- Three conformance levels defined: Declared, Verified, Attested
- Reference carriers: OCI labels, C99 `volatile const char[]`, SBCL
  `defconstant`, CI/CD env blocks
