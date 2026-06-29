---
title: "cispec/attribution.rego — Core Attribution Gate"
description: "OPA/Rego gate verifying org.cispec Declared conformance: required label keys present and syntactically valid."
date: 2026-06-29
draft: false
---

# cispec/attribution.rego

Core attribution gate. Verifies **Declared** conformance: all required
`org.cispec.*` label keys are present and syntactically valid.

Input: a JSON object with a top-level `labels` map of key→value strings.

```json
{
  "labels": {
    "org.cispec.organization": "daplanet",
    "org.cispec.orgunit": "dps",
    "org.cispec.application": "odoo-mcp-server",
    "org.cispec.version": "1.3.0"
  }
}
```

## Source

```rego
# SPDX-License-Identifier: BSD-2-Clause
# Package: cispec.attribution
# Canonical source: https://cispec.org/gates/cispec/attribution.rego
# Spec version: 1.0

package cispec.attribution

import future.keywords.contains
import future.keywords.if
import future.keywords.in

cispec_version := "1.0"

# Required label keys for Declared conformance
required_keys := {
    "org.cispec.organization",
    "org.cispec.orgunit",
    "org.cispec.application",
    "org.cispec.version",
}

# Slug pattern: lower-case alphanumeric and hyphens, no leading/trailing hyphen
slug_re := `^[a-z0-9][a-z0-9-]*[a-z0-9]$|^[a-z0-9]$`

# Semver pattern (simplified — covers the common cases)
semver_re := `^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(-[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?(\+[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?$`

# Slug keys that must match slug_re when present
slug_keys := {
    "org.cispec.organization",
    "org.cispec.orgunit",
    "org.cispec.role",
    "org.cispec.environment",
}

# ----------------------------------------------------------------
# deny — set of violation strings; empty = conformant
# ----------------------------------------------------------------

deny contains msg if {
    some key in required_keys
    not input.labels[key]
    msg := sprintf("missing required label: %v", [key])
}

deny contains msg if {
    some key in required_keys
    val := input.labels[key]
    val == ""
    msg := sprintf("required label is empty: %v", [key])
}

deny contains msg if {
    some key in slug_keys
    val := input.labels[key]
    val != ""
    not regex.match(slug_re, val)
    msg := sprintf("label %v value %q is not a valid slug (lower-case alphanumeric and hyphens only)", [key, val])
}

deny contains msg if {
    val := input.labels["org.cispec.version"]
    val != ""
    not regex.match(semver_re, val)
    msg := sprintf("org.cispec.version value %q is not a valid semver 2.0 string", [val])
}

deny contains msg if {
    val := input.labels["org.cispec.oid"]
    val != ""
    not startswith(val, "iso.org.dod.internet.42387")
    msg := sprintf("org.cispec.oid value %q must be rooted at iso.org.dod.internet.42387", [val])
}

deny contains msg if {
    val := input.labels["org.cispec.duns"]
    val != ""
    not startswith(val, "iso.org.duns.")
    msg := sprintf("org.cispec.duns value %q must follow pattern iso.org.duns.<9-digit-number>", [val])
}

# ----------------------------------------------------------------
# warn — non-blocking advisory violations
# ----------------------------------------------------------------

warn contains msg if {
    not input.labels["org.cispec.oid"]
    msg := "recommended label org.cispec.oid is absent"
}

warn contains msg if {
    not input.labels["org.cispec.owner"]
    msg := "recommended label org.cispec.owner is absent"
}

warn contains msg if {
    not input.labels["org.cispec.specversion"]
    msg := "org.cispec.specversion is absent; add to record the spec version validated against"
}
```

## Running the gate

```sh
# With OPA
opa eval \
  --data attribution.rego \
  --input labels.json \
  'data.cispec.attribution.deny'

# With Conftest
conftest test --policy attribution.rego labels.json

# With cimatrix
cimatrix verify-gate attribution.rego --input labels.json
```

A passing run produces an empty `deny` set. Any non-empty `deny` set
indicates a conformance violation that must be resolved before the
artefact achieves Declared status.
