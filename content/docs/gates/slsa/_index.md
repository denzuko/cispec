---
title: "slsa/provenance.rego — SLSA Provenance Gate"
description: "OPA/Rego gate verifying SLSA provenance attestation structure, builder identity, subject digest, and org.cispec annotation."
date: 2026-06-29
draft: false
---

# slsa/provenance.rego

Verifies a SLSA provenance attestation against the requirements for
**Attested** conformance (§6.3 of the [spec](/spec/)). The gate checks
structural validity, builder identity against a known allowlist, sha256
digest presence on all subjects, and an advisory check for
`org.cispec.specversion` annotation in the build environment.

Input: an in-toto v1 statement (`application/vnd.in-toto+json`) or the
unwrapped predicate from `slsa-verifier --format json` output.

```sh
cimatrix verify-slsa ./my-binary ./my-binary.intoto.jsonl \
  --source-uri github.com/denzuko/my-tool

# Gate-only evaluation against a parsed attestation JSON
cimatrix verify-gate slsa/provenance.rego --input attestation.json
```

## Known builders allowlist

The gate ships with the SLSA GitHub Generator builder URIs for Go,
Node.js, and Generic workflows at Level 3. For private builders, overlay
a project-local gate that extends `known_builders`:

```rego
# my-project/policy/slsa-override.rego
package cispec.slsa.provenance

import future.keywords.in

known_builders := {
    "https://github.com/slsa-framework/slsa-github-generator/.github/workflows/builder_generic_slsa3.yml",
    "https://builds.example.com/my-private-builder@v1",
}
```

## Source

```rego
# SPDX-License-Identifier: BSD-2-Clause
# Package: cispec.slsa.provenance
# Canonical source: https://cispec.org/gates/slsa/provenance.rego
# Spec version: 1.0

package cispec.slsa.provenance

import future.keywords.contains
import future.keywords.if
import future.keywords.in

cispec_version := "1.0"

known_builders := {
    "https://github.com/slsa-framework/slsa-github-generator/.github/workflows/builder_go_slsa3.yml",
    "https://github.com/slsa-framework/slsa-github-generator/.github/workflows/builder_nodejs_slsa3.yml",
    "https://github.com/slsa-framework/slsa-github-generator/.github/workflows/builder_generic_slsa3.yml",
}

# ----------------------------------------------------------------
# Structural checks
# ----------------------------------------------------------------

deny contains msg if {
    not input.predicateType
    msg := "attestation is missing predicateType"
}

deny contains msg if {
    not input.predicate
    msg := "attestation is missing predicate"
}

deny contains msg if {
    not input.subject
    msg := "attestation is missing subject (artefact digest list)"
}

deny contains msg if {
    count(input.subject) == 0
    msg := "attestation subject list is empty"
}

# ----------------------------------------------------------------
# Builder identity
# ----------------------------------------------------------------

deny contains msg if {
    not input.predicate.buildDefinition.buildType
    not input.predicate.builder.id
    msg := "attestation records no builder identity"
}

warn contains msg if {
    builder := object.get(input, ["predicate", "builder", "id"], "")
    builder != ""
    not builder in known_builders
    msg := sprintf(
        "builder %q is not in the known_builders allowlist; verify manually",
        [builder]
    )
}

# ----------------------------------------------------------------
# Subject digest — must include sha256
# ----------------------------------------------------------------

deny contains msg if {
    some subj in input.subject
    not subj.digest.sha256
    msg := sprintf("subject %q is missing sha256 digest", [subj.name])
}

# ----------------------------------------------------------------
# org.cispec specversion annotation (advisory)
# ----------------------------------------------------------------

warn contains msg if {
    deps := object.get(
        input,
        ["predicate", "buildDefinition", "resolvedDependencies"],
        []
    )
    not any_dep_has_cispec(deps)
    msg := "no org.cispec.specversion annotation found in build environment; recommended for Attested conformance"
}

# ----------------------------------------------------------------
# Helpers
# ----------------------------------------------------------------

any_dep_has_cispec(deps) if {
    some dep in deps
    startswith(dep.uri, "org.cispec")
}
```

## Conformance level

A passing run contributes to **Attested** conformance (§6.3) when
combined with a passing `cispec/attribution` gate and a `verify-binary`
run. All three checks together constitute a complete Attested
conformance record.

## References

- [SLSA specification](https://slsa.dev/spec/v1.0/)
- [in-toto attestation framework](https://github.com/in-toto/attestation)
- [slsa-github-generator](https://github.com/slsa-framework/slsa-github-generator)
- [cispec §6.3 — Attested conformance](/spec/#63-attested)
