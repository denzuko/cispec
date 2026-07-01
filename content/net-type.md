---
title: "net-type"
term: "net-type"
core: false
recommendedFor: ["any CI that is a network element"]
related: ["ip-address", "mac-address", "application", "role", "manufacturer", "make", "model", "location"]
docOid: "1.3.6.1.4.1.42387.2.6.4.1"
docGuid: "908d6b60-25a3-5e42-b8f6-626a86445abf"
date: 2026-06-30
draft: false
---

`org.cispec.net-type` records the network element type of a Change
Item — the functional classification of a CI within a network
architecture. This is distinct from [`org.cispec.application`](/application/)
(what the CI is designed to do) and [`org.cispec.role`](/role/) (what
this instance is currently doing). `net-type` classifies the CI by
its position and function within the network itself.

Applies across all networking domains: enterprise IT (router, switch,
firewall), carrier and telco (BSS, OSS, MSC, HLR, eNB, gNB, MME,
SGW), industrial OT (fieldbus gateway, protocol converter, industrial
firewall), IoT (gateway, sensor hub, edge node), satellite (ground
station, modem, transponder), and defence networking (tactical radio,
crypto gateway, cross-domain solution).

## Value format

A lower-case slug drawn from the applicable network architecture
taxonomy. This specification does not enumerate or restrict the set —
network element type naming is domain-specific.

```sh
org.cispec.net-type=edge-router
org.cispec.net-type=core-switch
org.cispec.net-type=msc
org.cispec.net-type=enb
org.cispec.net-type=fieldbus-gateway
org.cispec.net-type=iot-gateway
org.cispec.net-type=cross-domain-solution
```

## Conformance

`org.cispec.net-type` is RECOMMENDED for any CI that is a network
element. Not REQUIRED for Declared conformance.

## Attestation

`net-type` is not independently attestable as a label value. In
regulated network contexts (telco type approval, NERC-CIP, ITAR
communications equipment) the classification may be verifiable
against regulatory filings or type certificates.

## Resolution and relation

"Every `msc` element" or "every `fieldbus-gateway`" are real
operational queries for network inventory audits, vulnerability
scoping, and capacity planning.
