---
title: "ip-address"
term: "ip-address"
core: false
recommendedFor: ["any CI with a routable network address"]
related: ["mac-address", "net-type", "location", "environment", "owner"]
docOid: "1.3.6.1.4.1.42387.2.6.4.2"
docGuid: "fd4da795-a1a7-5415-a850-6c4d42ef644e"
date: 2026-06-30
draft: false
---

`org.cispec.ip-address` records the primary management or operational
IP address of a Change Item. This is the address used for network
inventory, vulnerability scanning, monitoring, and incident response
— not necessarily every address the CI holds, but the one that
identifies it in network management systems.

Applies to any CI with a routable network address: servers, network
equipment, IoT devices, industrial controllers, medical devices with
network interfaces, vehicle telematics units, satellite ground
terminals, and any other networked asset.

## Value format

An IPv4 or IPv6 address, optionally with prefix length for network
CIs. CIDR notation for network segments.

```sh
org.cispec.ip-address=192.168.1.100
org.cispec.ip-address=10.0.0.1/24
org.cispec.ip-address=2001:db8::1
org.cispec.ip-address=172.16.0.0/16
```

## Conformance

`org.cispec.ip-address` is RECOMMENDED for any CI with a routable
network address. Not REQUIRED for Declared conformance.

## Attestation

`ip-address` is independently attestable against network scan
records, DHCP logs, DNS records, and network management system
inventory. For static assignments, network documentation and
configuration records are the attestation source.

## Resolution and relation

`ip-address` paired with [`mac-address`](/mac-address/) gives the
complete layer 2/3 identity of a networked CI. Paired with
[`location`](/location/) it places the CI on a network map.
