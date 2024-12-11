---
title: Security FAQ for Business Central 
description: Find useful links and other answers to frequently asked questions about security in Dynamics 365 Business Central.
author: kennienp
ms.topic: overview
ms.date: 12/11/2024
ms.author: kepontop
ms.reviewer: solsen
---

# Security FAQ for [!INCLUDE[prod_short](../developer/includes/prod_short.md)]

Here you find links that can help you find answers to questions concerning security in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

## How is data isolation handled in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online?

Data belonging to a single tenant is stored in an isolated database and is never mixed with data from other tenants. Learn more in [Data isolation and encryption in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online](./security-online.md#data-isolation-and-encryption).

## Where can I find Dynamics 365 penetration tests?

The latest penetration tests and security assessments can be found on the [Microsoft Service Trust Portal](https://servicetrust.microsoft.com/viewpage/PenTest). 

> [!NOTE]
> To access some of the resources on the Service Trust Portal, you must sign in as an authenticated user with your Microsoft cloud services account (Microsoft Entra organization account) and review and accept the Microsoft non-disclosure agreement for compliance materials.

## Why does [!INCLUDE[prod_short](../developer/includes/prod_short.md)] still support RSA-CBC ciphers (TLS_ECDHE_RSA_with AES_128_CBC_SHA256 (0xC027) and TLS_ECDHE_RSA_with_AES_256_CBC_SHA384 (0xC028)), which are considered weaker?

Microsoft weighs the relative risk and disruption to customer operations in choosing cipher suites to support. The RSA-CBC cipher suites haven't been broken yet. We've enabled them to ensure consistency across our services and products, and to support all customer configurations. However, they're at the bottom of the priority list. We deprecate these ciphers at the right time, based on the Microsoft Crypto Board's continuous assessment.

## How do you handle security incidents?

This page describes the definitions of a security incident and our customer notification Service Level Agreements (SLA): [Security incident management overview](/compliance/assurance/assurance-incident-management).

Here you can learn about the Post Incident Review process: [Microsoft security incident management: Post-incident activity](/compliance/assurance/assurance-sim-post-incident-activity)

## Related information  

[Security overview](security-and-protection.md)  
