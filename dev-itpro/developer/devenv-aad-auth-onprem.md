---
title: "Use Microsoft Entra authentication for Business Central on-premises installations"
description: Using Microsoft Entra ID as authentication on on-premises installations and containers for Business Central for debugging and other purposes
ms.custom: bap-template
ms.date: 01/03/2024
ms.reviewer: jswymer
ms.service: dynamics-365-op
ms.topic: article
author: jswymer
---

# Use Microsoft Entra authentication for Business Central on-premises installations

In addition to using Windows and NavUserPassword authentication, you can use Microsoft Entra ID to authenticate and publish in on-premises installations and containers from Visual Studio Code. Using Microsoft Entra ID makes it possible to mimic application lifecycle operations in an on-premises environment, while keeping the cloud-based Microsoft Entra authentication.

To enable Microsoft Entra authentication, make sure to do as follows:

- Use the `primaryTenantDomain` setting in the `launch.json` file to specify the URL of the Microsoft Entra organization or company associated with the Microsoft Entra tenant. Learn more in, see [Find tenant ID, domain name, user object ID](/partner-center/find-ids-and-domain-names) and [JSON Files](devenv-json-files.md).
- On the NST, you must ensure that the server is set up to use Microsoft Entra ID as authentication mechanism. Learn more in [User Authentication with Microsoft Entra ID for Single Sign-on](../administration/authenticating-users-with-azure-active-directory.md).
- If the `Allowed Extension Target Level` setting is set to `Cloud`, set the server setting `ForceExtensionAllowedTargetLevel` to `true`. If the `Allowed Extension Target Level` setting is set to `OnPrem`, you don't need to set `ForceExtensionAllowedTargetLevel`. Learn more in [Configure Business Central Server](../administration/configure-server-instance.md).

## Related information

[JSON Files](devenv-json-files.md)  
[User Authentication with Microsoft Entra ID for Single Sign-on](../administration/authenticating-users-with-azure-active-directory.md)  
[Find tenant ID, domain name, user object ID](/partner-center/find-ids-and-domain-names)
