---
title: "collection-method"
term: "collection-method"
core: false
recommendedFor: ["any CI collected as evidence or under chain-of-custody requirements"]
related: ["case-id", "custody-chain", "checksum", "owner", "classification"]
docOid: "1.3.6.1.4.1.42387.2.6.5.2"
docGuid: "a97c5cfd-a9eb-5811-84b2-607d3e8abc10"
date: 2026-06-30
draft: false
---

`org.cispec.collection-method` records how a Change Item was acquired
or collected — the method of collection that governs its admissibility,
regulatory standing, and evidentiary weight. This matters because the
*how* of collection often determines *whether* the item can be used:
forensic imaging preserves integrity in ways live acquisition does not;
a court-ordered seizure has different standing than a voluntary
surrender; a chain-of-custody pharmaceutical sample collected under
GDP has different regulatory weight than an informally handled one.

Applies across domains where collection method affects downstream
validity: digital forensics (disk imaging, memory capture, live
acquisition, network capture), pharmaceutical sampling (GDP-compliant
sampling, stability sample, regulatory submission sample), medical
device incident investigation, regulatory inspection sampling, and
physical evidence collection under law enforcement or customs
procedures.

## Value format

A lower-case slug describing the collection method. Domain-specific
terminology is appropriate.

```sh
org.cispec.collection-method=forensic-imaging
org.cispec.collection-method=live-acquisition
org.cispec.collection-method=network-capture
org.cispec.collection-method=physical-seizure
org.cispec.collection-method=voluntary-surrender
org.cispec.collection-method=gdp-sampling
org.cispec.collection-method=court-ordered
```

## Conformance

`org.cispec.collection-method` is RECOMMENDED for any CI collected
as evidence or under formal chain-of-custody requirements. Not
REQUIRED for Declared conformance.

## Attestation

`collection-method` is attestable against collection records,
warrant documentation, regulatory sampling protocols, and witness
statements recorded at the time of collection.

## Resolution and relation

`collection-method` paired with [`custody-chain`](/custody-chain/)
and [`checksum`](/checksum/) gives the complete admissibility
picture: how it was taken, who has held it since, and whether its
content is intact.
