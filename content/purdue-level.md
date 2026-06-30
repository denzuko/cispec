---
title: "purdue-level"
term: "purdue-level"
core: false
requiredFor: ["industrial control system Change Items"]
related: ["owner", "environment", "safety-criticality"]
docOid: "1.3.6.1.4.1.42387.6.3.1"
docGuid: "678fc553-e182-53b6-acf5-4048bb4075f5"
date: 2026-06-30
draft: false
---

`org.cispec.purdue-level` records the Purdue Enterprise Reference
Architecture level of an industrial control system Change Item, aligned
with [ISA/IEC 62443](https://www.isa.org/standards-and-publications/isa-standards/isa-iec-62443-series-of-standards)
zone-and-conduit terminology.

## Value format

An integer 0–5.

```sh
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
