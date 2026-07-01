---
title: "fqdn"
term: "fqdn"
core: false
recommendedFor: ["any CI with a DNS-resolvable hostname"]
related: ["ip-address", "mac-address", "net-type", "commonname", "location"]
docOid: "1.3.6.1.4.1.42387.2.6.4.4"
docGuid: "e39b64b6-6144-5939-9cc1-aa8a91fd796b"
date: 2026-06-30
draft: false
---

`org.cispec.fqdn` records the fully-qualified domain name of a Change
Item — the DNS-resolvable identifier that uniquely names it within the
DNS namespace.

This is distinct from [`org.cispec.commonname`](/commonname/) (a
human-readable label with no requirement to be DNS-resolvable),
[`org.cispec.ip-address`](/ip-address/) (a network layer 3 address),
and [`org.cispec.location`](/location/) (a physical location). A FQDN
is specifically a DNS-resolvable name — `db.prod.daplanet.net` is a
fact about the CI's identity in the DNS namespace, not a description
of where it is, what it's called informally, or how to reach it at
layer 3.

This term corresponds to the `fqdn` property in OSCAL's inventory
model, ensuring compatibility with FedRAMP machine-readable
authorization packages mandated by RFC-0024 (effective September
2026).

Applies to any CI with a DNS-assigned hostname: servers, network
equipment, services, APIs, IoT devices with DNS entries, and any
other asset with a resolvable FQDN.

## Value format

A fully-qualified domain name in standard dot-notation.

```sh
org.cispec.fqdn=db.prod.daplanet.net
org.cispec.fqdn=api-gateway.example.org
org.cispec.fqdn=printer-01.corp.example.com
```

## Conformance

`org.cispec.fqdn` is RECOMMENDED for any CI with a DNS-resolvable
hostname. Not REQUIRED for Declared conformance.

## Attestation

`fqdn` is independently attestable via public DNS resolution for
publicly registered domains, or via internal DNS records for private
domains. Forward and reverse DNS lookup agreement provides additional
integrity confirmation.

## Resolution and relation

`fqdn` paired with [`ip-address`](/ip-address/) and
[`mac-address`](/mac-address/) gives the complete network identity
of a CI across DNS, layer 3, and layer 2.
