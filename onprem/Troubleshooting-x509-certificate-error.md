---
title: X.509 certificate CN=accounts.accesscontrol.windows.net is not in the trusted people store
description: The client cannot connect to the server instance and event log includes a warning event - X.509 certificate CN=accounts.accesscontrol.windows.net is not in the trusted people store.
ms.custom: na
ms.date: 03/14/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Troubleshooting: The X.509 certificate CN=accounts.accesscontrol.windows.net is not in the trusted people store
Your deployment is using Azure Active Directory (Azure AD) authentication. When users try to connect to [!INCLUDE[navnow_md](includes/navnow_md.md)] from the client, a technical issue occurs that prevents them from connecting. The event log of the computer that is running of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance includes a warning event that has the following message:

`The X.509 certificate CN=accounts.accesscontrol.windows.net is not in the trusted people store. The X.509 certificate CN=accounts.accesscontrol.windows.net chain building failed. The certificate that was used has a trust chain that cannot be verified. Replace the certificate or change the certificateValidationMode. A certificate chain processed, but terminated in a root certificate which is not trusted by the trust provider.`

## Resolution  
Disable token-signing certification validation on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md#AzureAd).
  
## See Also  
[Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md)   