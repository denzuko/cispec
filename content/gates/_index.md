---
title: "Rego Policy Gate Library"
description: "Public OPA/Rego policy gates for org.cispec conformance verification."
date: 2026-06-29
draft: false
---

# Rego Policy Gate Library

All gates in this library are published under BSD-2-Clause and are
designed to be consumed by OPA, Conftest, or the `cimatrix verify-gate`
command.

Canonical source: `https://cispec.org/gates/`

Gates are versioned alongside the spec. The version embedded in each gate
file's `cispec_version` rule must match the spec version the gate was
written against.

---

## Gate categories

### [cispec/](/gates/cispec/)

Core attribution verification gates. Verify that an artefact's label set
satisfies org.cispec Declared or Verified conformance. Start here.

### [slsa/](/gates/slsa/)

SLSA provenance gates. Verify that a SLSA provenance attestation references
a known builder, matches the expected subject digest, and records the
cispec version used during the build.

### [c-quality/](/gates/c-quality/)

C99 quality and attribution gates. Enforce `nob.c` as the sole build
driver, require `volatile const char[]` attribution arrays, and verify
SPDX headers on all translation units.

### [ast/](/gates/ast/)

Forbidden-call and coverage gates for static analysis integration.
Integrates with SARIF output from `sext` successors.

### [sbom/](/gates/sbom/)

CycloneDX and OSV gates. Verify that an SBOM is present, uses CycloneDX
format, records the correct component identity, and has no OSV-matched
critical vulnerabilities.

### [containers/](/gates/containers/)

Quadlet and OCI label gates. Verify that container images and Podman
Quadlet units carry the required `org.cispec.*` labels.

---

## Using the gates

### With Conftest

```sh
conftest pull https://cispec.org/gates/cispec/attribution.rego
conftest test --policy attribution.rego ./labels.json
```

### With cimatrix

```sh
cimatrix verify-gate ./policy/slsa.rego
```

### With OPA directly

```sh
opa eval --data https://cispec.org/gates/cispec/attribution.rego \
         --input ./labels.json \
         'data.cispec.attribution.deny'
```

---

## Gate authoring conventions

All gates in this library follow these conventions:

- Package name: `cispec.<category>.<gate-name>`
- Entry rule: `deny` (set of violation strings; empty set = pass)
- Required metadata rule: `cispec_version := "1.0"`
- SPDX header on every `.rego` file
- `opa check` must pass with zero warnings before merge
