---
title: "Security Tips for Business Users"
description: Tips for administrators and business users to secure their devices that access Business Central.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: mikebc
---

# Security Tips for Business Users

This article describes how you can work with end-users and configure their devices to improve the security.

> [IMPORTANT]
> Use this article together with industry standard security practices for securing users and their access to company data. This article describes additional considerations for how you can work with end-users and configure their devices to improve security.

## Kiosks and shared devices

Customers using kiosks, where multiple users sign into [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with their own identity from that terminal, should apply additional security practices for an appropriate level of isolation between users.
 - Before ending a session at the kiosk, business users should remember to sign out of Business Central, then close all browser windows. Closing the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] browser tab or closing the browser without signing out may not fully complete the signout process.
 - Each user should use private or guest browsing modes so that any data cached by [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is discarded when the browser is closed. Private or guest browsing may degrade some [!INCLUDE[prod_short](../developer/includes/prod_short.md)] features and performance optimizations that are only available when the browser provides access to its storage mechanisms.


## See Also  

[Security and Protection](security-and-protection.md)  
[Application Security](security-application.md)  
[Online Security](security-online.md)  
[On-Premises Security](security-onpremises.md)  
