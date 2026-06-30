---
title: "purdue-level"
term: "purdue-level"
core: false
requiredFor: ["industrial control system Change Items"]
related: ["owner", "environment", "safety-criticality"]
date: 2026-06-30
draft: false
---

`org.cispec.purdue-level` records the Purdue Enterprise Reference
Architecture level of an industrial control system Change Item, aligned
with [ISA/IEC 62443](https://www.isa.org/standards-and-publications/isa-standards/isa-iec-62443-series-of-standards)
zone-and-conduit terminology.

## Value format

An integer 0–5.

```
org.cispec.purdue-level=1
```

| Level | Description |
|---|---|
| 0 | Physical process — sensors, actuators |
| 1 | Intelligent devices — PLCs, RTUs, IEDs |
| 2 | Control systems — SCADA, HMI |
| 3 | Site operations — MES, historians |
| 4–5 | Enterprise / business systems |

## Conformance

`org.cispec.purdue-level` is REQUIRED for ICS Change Items.
