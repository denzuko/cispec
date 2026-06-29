---
title: "containers/quadlet.rego — Quadlet and OCI Label Gate"
description: "OPA/Rego gate verifying org.cispec label presence in OCI images and Podman Quadlet units."
date: 2026-06-29
draft: false
---

# containers/quadlet.rego

Verifies that OCI container images and Podman Quadlet unit files carry the
required `org.cispec.*` labels. Input is a JSON object produced by
`podman inspect` or `docker inspect` (image or container).

```sh
podman inspect my-image | cimatrix verify-gate quadlet.rego --stdin
```

## Source

```rego
# SPDX-License-Identifier: BSD-2-Clause
# Package: cispec.containers.quadlet
# Canonical source: https://cispec.org/gates/containers/quadlet.rego
# Spec version: 1.0

package cispec.containers.quadlet

import future.keywords.contains
import future.keywords.if
import future.keywords.in

cispec_version := "1.0"

required_keys := {
    "org.cispec.organization",
    "org.cispec.orgunit",
    "org.cispec.application",
    "org.cispec.version",
}

# podman/docker inspect returns an array; take the first element
labels := input[0].Labels if {
    is_array(input)
} else := input.Labels if {
    is_object(input)
    input.Labels
} else := input.Config.Labels

deny contains msg if {
    some key in required_keys
    not labels[key]
    msg := sprintf("OCI image is missing required org.cispec label: %v", [key])
}

deny contains msg if {
    some key in required_keys
    labels[key] == ""
    msg := sprintf("OCI image has empty required org.cispec label: %v", [key])
}

warn contains msg if {
    not labels["org.cispec.environment"]
    msg := "org.cispec.environment is absent; recommended for production images"
}

warn contains msg if {
    not labels["org.cispec.role"]
    msg := "org.cispec.role is absent; recommended for service images"
}
```

## Quadlet unit example

A conformant Podman Quadlet `[Container]` section:

```ini
[Unit]
Description=odoo-mcp-server

[Container]
Image=ghcr.io/denzuko/odoo-mcp-server:1.3.0
Label=org.cispec.organization=daplanet
Label=org.cispec.orgunit=dps
Label=org.cispec.application=odoo-mcp-server
Label=org.cispec.version=1.3.0
Label=org.cispec.role=mcp-server
Label=org.cispec.environment=production
Label=org.cispec.oid=iso.org.dod.internet.42387
Label=org.cispec.specversion=1.0

[Service]
Restart=always

[Install]
WantedBy=multi-user.target default.target
```
