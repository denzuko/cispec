---
title: "c-quality/attribution.rego — C99 Attribution Gate"
description: "OPA/Rego gate verifying C99 projects use volatile const char[] attribution arrays and nob.c as sole build driver."
date: 2026-06-29
draft: false
---

# c-quality/attribution.rego

Verifies C99 project conformance: `volatile const char[]` attribution
arrays are present in the source tree, SPDX headers exist on translation
units, and `nob.c` is the sole build driver.

Input: a JSON object produced by static analysis tooling or `cimatrix
verify-binary` in source-scan mode.

```json
{
  "source_files": ["main.c", "nob.c", "matrix_id.h"],
  "binary_strings": [
    "org.cispec.organization=daplanet",
    "org.cispec.orgunit=dps",
    "org.cispec.application=my-tool",
    "org.cispec.version=1.0.0"
  ],
  "spdx_headers": {
    "main.c": "BSD-2-Clause",
    "nob.c": "BSD-2-Clause"
  }
}
```

## Source

```rego
# SPDX-License-Identifier: BSD-2-Clause
# Package: cispec.c_quality.attribution
# Canonical source: https://cispec.org/gates/c-quality/attribution.rego
# Spec version: 1.0

package cispec.c_quality.attribution

import future.keywords.contains
import future.keywords.if
import future.keywords.in

cispec_version := "1.0"

required_binary_prefixes := {
    "org.cispec.organization=",
    "org.cispec.orgunit=",
    "org.cispec.application=",
    "org.cispec.version=",
}

# ----------------------------------------------------------------
# Binary string verification
# ----------------------------------------------------------------

deny contains msg if {
    some prefix in required_binary_prefixes
    not any_string_has_prefix(input.binary_strings, prefix)
    msg := sprintf("binary is missing org.cispec string with prefix: %v", [prefix])
}

# ----------------------------------------------------------------
# Build driver verification
# ----------------------------------------------------------------

deny contains msg if {
    not "nob.c" in input.source_files
    msg := "nob.c is absent; it must be the sole build driver for C99 projects"
}

deny contains msg if {
    "Makefile" in input.source_files
    msg := "Makefile is present; remove it — nob.c is the sole build driver"
}

deny contains msg if {
    "CMakeLists.txt" in input.source_files
    msg := "CMakeLists.txt is present; remove it — nob.c is the sole build driver"
}

# ----------------------------------------------------------------
# SPDX header verification
# ----------------------------------------------------------------

deny contains msg if {
    some file in input.source_files
    endswith(file, ".c")
    not input.spdx_headers[file]
    msg := sprintf("source file %v is missing an SPDX-License-Identifier header", [file])
}

# ----------------------------------------------------------------
# Helpers
# ----------------------------------------------------------------

any_string_has_prefix(strings, prefix) if {
    some s in strings
    startswith(s, prefix)
}
```
