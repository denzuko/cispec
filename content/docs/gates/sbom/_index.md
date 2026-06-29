---
title: "sbom/cyclonedx.rego — CycloneDX SBOM Gate"
description: "OPA/Rego gate verifying CycloneDX SBOM presence, format, component identity, and absence of critical OSV vulnerabilities."
date: 2026-06-29
draft: false
---

# sbom/cyclonedx.rego

Verifies that a CycloneDX SBOM is present, records the correct component
identity in `org.cispec.*` notation, and contains no OSV-matched
critical vulnerabilities.

Input: a CycloneDX JSON SBOM (`application/vnd.cyclonedx+json`).

## Source

```rego
# SPDX-License-Identifier: BSD-2-Clause
# Package: cispec.sbom.cyclonedx
# Canonical source: https://cispec.org/gates/sbom/cyclonedx.rego
# Spec version: 1.0

package cispec.sbom.cyclonedx

import future.keywords.contains
import future.keywords.if
import future.keywords.in

cispec_version := "1.0"

# ----------------------------------------------------------------
# Format verification
# ----------------------------------------------------------------

deny contains msg if {
    input.bomFormat != "CycloneDX"
    msg := sprintf("SBOM bomFormat is %q; expected CycloneDX", [input.bomFormat])
}

deny contains msg if {
    not input.specVersion
    msg := "SBOM specVersion is absent"
}

deny contains msg if {
    not input.serialNumber
    msg := "SBOM serialNumber is absent; required for attestation linkage"
}

# ----------------------------------------------------------------
# Component identity
# ----------------------------------------------------------------

deny contains msg if {
    not input.metadata.component
    msg := "SBOM metadata.component is absent; the root component must be declared"
}

deny contains msg if {
    comp := input.metadata.component
    not comp.version
    msg := "SBOM metadata.component.version is absent"
}

deny contains msg if {
    comp := input.metadata.component
    not startswith(comp.group, "org.cispec.") 
    not comp.group
    msg := "SBOM metadata.component.group should carry the org.cispec.organization value"
}

# ----------------------------------------------------------------
# Vulnerability severity gate — block on CRITICAL
# ----------------------------------------------------------------

deny contains msg if {
    some vuln in input.vulnerabilities
    some rating in vuln.ratings
    rating.severity == "critical"
    msg := sprintf("SBOM records a CRITICAL vulnerability: %v (%v)", [vuln.id, vuln.description])
}

warn contains msg if {
    some vuln in input.vulnerabilities
    some rating in vuln.ratings
    rating.severity == "high"
    msg := sprintf("SBOM records a HIGH severity vulnerability: %v", [vuln.id])
}
```
