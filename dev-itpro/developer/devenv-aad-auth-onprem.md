---
title: "Use Microsoft Entra authentication for Business Central on-premises installations"
description: Using Microsoft Entra ID as authentication on on-premises installations and containers for Business Central for debugging and other purposes
ms.custom: na
ms.date: 08/08/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
---

# Use Microsoft Entra authentication for Business Central On-Premises Installations

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

In addition to using Windows and NavUserPassword authentication, you can use Microsoft Entra ID to authenticate and publish in on-premises installations and containers from Visual Studio Code. Using Microsoft Entra ID makes it possible to mimic application lifecycle operations in an on-premises environment, while keeping the cloud-based Microsoft Entra authentication.

To enable Microsoft Entra authentication, make sure to do as follows: 

- Use the `primaryTenantDomain` setting in the `launch.json` file to specify the URL of the Microsoft Entra organization or company associated with the Microsoft Entra tenant. For more information, see [Find tenant ID, domain name, user object ID](/partner-center/find-ids-and-domain-names) and [JSON Files](devenv-json-files.md).
- On the NST, you must ensure that the server is set up to use Microsoft Entra ID as authentication mechanism. For more information, see [User Authentication with Microsoft Entra ID for Single Sign-on](../administration/authenticating-users-with-azure-active-directory.md).
- Furthermore, if the `Allowed Extension Target Level` setting is set to `Cloud`, the server setting `ForceExtensionAllowedTargetLevel` must be set to `true`. If the `Allowed Extension Target Level` setting is set to `OnPrem`, it isn't necessary to set `ForceExtensionAllowedTargetLevel`. For more information, see [Microsoft Dynamics 365 Business Central Server Configuration](../administration/configure-server-instance.md#Development).

## See also

[JSON Files](devenv-json-files.md)  
[User Authentication with Microsoft Entra ID for Single Sign-on](../administration/authenticating-users-with-azure-active-directory.md)  
[Find tenant ID, domain name, user object ID](/partner-center/find-ids-and-domain-names)
