---
title: 401-Unauthorized-Access is denied due to invalid credentials
description: The client is disconnected from the server instance and event log includes a warning event- The SAML2 token is invalid because its validity period ended.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 797fbf58-eca3-4c86-8644-7a5d3e248641
caps.latest.revision: 10
author: jswymer
---
# Troubleshooting: The SAML2 token is invalid because its validity period ended.
Your deployment is using Access Control Service (ACS) or Azure Active Directory (Azure AD) authentication. A client is disconnected from the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, and  event log of the computer that is running of the server instance includes a warning event that has the following message:

```The SAML2 token is invalid because its validity period ended.```

## Resolution  
Azure AD issues a SAML security token which is used to authenticate client users. The security token has a lifetime, typically about 1 hour by default. When the lifetime expires, the client is disconnected from the server instance. If this issue becomes a problem, the server instance includes a configuration setting called **Extended Security Token Lifetime** (or ExtendedSecurityTokenLifetime) that you can set to increase the lifetime on hourly intervals, up to 24 hours. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md#AzureAd).
  
## See Also  
[Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md)  
[Authenticating Users with Azure Access Control Service](Authenticating-Users-with-Microsoft-Azure-Access-Control-Service.md)  
