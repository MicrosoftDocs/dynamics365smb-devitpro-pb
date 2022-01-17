---
title: "Azure AD authentication for Business Central on-premises"
description: Using Azure AD as authentication on on-premises installations and containers for Business Central for debugging and other purposes
ms.custom: na
ms.date: 01/14/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Azure AD authentication for Business Central on-premises

In addition to using Windows and NavUserPassword authentication, you can use Azure AD to authenticate and publish in on-premises installations and containers from Visual Studio Code. This makes it possible to mimic application lifecycle operations in an on-premises environment, while keeping the cloud-based Azure AD authentication.

To enable Azure AD authentication, make sure to do the following: 

- Use the `primaryTenantDomain` setting in the `launch.json` file to specify the URL of the Azure AD organization or company associated with the Azure AD tenant. For more information, see [Find tenant ID, domain name, user object ID](/partner-center/find-ids-and-domain-names). 
- On the NST you must ensure that the server is set up to use Azure AD as authentication mechanism. For more information, see [User Authentication with Azure AD for Single Sign-on](../administration/authenticating-users-with-azure-active-directory.md).
- Furthermore, the server setting `ForceExtensionAllowedTargetLevel` must be set to `true` in addition to the `Allowed Extension Target Level` setting set to `OnPrem`. For more information, see [Microsoft Dynamics 365 Business Central Server Configuration](../administration/configure-server-instance.md#Development).

## See also

[User Authentication with Azure AD for Single Sign-on](../administration/authenticating-users-with-azure-active-directory.md)  
[Find tenant ID, domain name, user object ID](/partner-center/find-ids-and-domain-names)