---
title: "mac-address"
term: "mac-address"
core: false
recommendedFor: ["any CI with a hardware network interface"]
related: ["ip-address", "net-type", "asset-tag", "manufacturer", "checksum"]
docOid: "1.3.6.1.4.1.42387.2.6.4.3"
docGuid: "025348b7-866f-57af-9f56-b8dbb4e5a43e"
date: 2026-06-30
draft: false
---

`org.cispec.mac-address` records the hardware MAC address of a Change
Item's primary network interface. The MAC address is OEM-assigned,
burned into the hardware, and independently attestable — making it
one of the stronger hardware identity facts available for a networked
CI, short of a TPM attestation.

Applies to any CI with a hardware network interface: servers, switches,
routers, IoT devices, industrial controllers, medical devices, vehicle
telematics, and any other networked physical asset.

## Value format

IEEE 802 colon-separated hexadecimal notation, lower-case.

```sh
org.cispec.mac-address=00:1a:2b:3c:4d:5e
org.cispec.mac-address=aa:bb:cc:dd:ee:ff
```

## Conformance

`org.cispec.mac-address` is RECOMMENDED for any CI with a hardware
network interface. Not REQUIRED for Declared conformance.

## Attestation

`mac-address` is independently attestable against the OEM's OUI
registration (the first three octets identify the manufacturer via
IEEE's OUI registry), network scan ARP tables, switch CAM tables,
and DHCP lease records. It is the most directly hardware-verifiable
network identity fact in this namespace short of a TPM quote.

## Resolution and relation

`mac-address` paired with [`ip-address`](/ip-address/) gives the
complete layer 2/3 identity. Paired with [`manufacturer`](/manufacturer/)
the OUI prefix independently confirms the manufacturer claim.
