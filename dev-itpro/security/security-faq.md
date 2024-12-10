---
title: Security FAQ for Business Central 
description: Find useful links and other answers to frequently asked questions about security in Dynamics 365 Business Central
author: kennienp
ms.topic: overview
ms.date: 12/10/2024
ms.author: kepontop
ms.reviewer: jswymer
---

# Security FAQ for [!INCLUDE[prod_short](../developer/includes/prod_short.md)]

Here you find links that can help you find answers to questions concerning security in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].


## How is data isolation handled in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online?

Data belonging to a single tenant is stored in an isolated database and is never mixed with data from other tenants. For more information, see [Data isolation and encryption in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online](./security-online.md#data-isolation-and-encryption).


## Where can I find Dynamics 365 penetration tests?

The latest penetration tests and security assessments can be found on the [Microsoft Service Trust Portal](https://servicetrust.microsoft.com/viewpage/PenTest). 

> [!NOTE]
> To access some of the resources on the Service Trust Portal, you must sign in as an authenticated user with your Microsoft cloud services account (Microsoft Entra organization account) and review and accept the Microsoft non-disclosure agreement for compliance materials.


### Does [!INCLUDE[prod_short](../developer/includes/prod_short.md)] detect jailbroken iOS devices and rooted Android devices to help with protecting organizational data?

We recommend you use Microsoft Intune. Intune is a mobile device management solution. It can help protect organizational data by requiring users and devices to meet certain requirements. For more information, see [Intune's compliance policy settings](/mem/intune/protect/device-compliance-get-started#compliance-policy-settings).


### How does [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online protect against Distributed Denial of Service (DDoS) attacks?

** TODO: Do we use Azure DDoS Protection???**

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online service is built on Microsoft Azure and uses [Azure DDoS Protection](/azure/ddos-protection/ddos-protection-standard-features) to guard against [DDoS attacks](https://owasp.org/www-project-automated-threats-to-web-applications/assets/oats/EN/OAT-015_Denial_of_Service.html).


### Why does Business Central still support RSA-CBC ciphers (TLS_ECDHE_RSA_with AES_128_CBC_SHA256 (0xC027) and TLS_ECDHE_RSA_with_AES_256_CBC_SHA384 (0xC028)), which are considered weaker?

Microsoft weighs the relative risk and disruption to customer operations in choosing cipher suites to support. The RSA-CBC cipher suites haven't been broken yet. We've enabled them to ensure consistency across our services and products, and to support all customer configurations. However, they're at the bottom of the priority list. We'll deprecate these ciphers at the right time, based on the Microsoft Crypto Board's continuous assessment.



## Related information  

[Security overview](security-and-protection.md)  
