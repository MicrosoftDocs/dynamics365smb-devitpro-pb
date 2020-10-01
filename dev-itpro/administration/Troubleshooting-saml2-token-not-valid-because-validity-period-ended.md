---
title: "Troubleshooting: The SAML2 token is not valid because its validity period has ended."
author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Troubleshooting: The SAML2 token is not valid because its validity period has ended

When using Azure Active Directory authentication, while working in the client, users get an error similar to the following: 

**Connection is not longer available or was lost**

The event log includes the following error for the [!INCLUDE[server](../developer/includes/server.md)] instance:

**The SAML2 token is not valid because its validity period has ended.** 

## Resolution  

This error occurs because the security token that used by Azure AD has exceeded its specified lifetime. By default, the lifetime, which is determined by Azure AD, is 1 hour. However, the [!INCLUDE[server](../developer/includes/server.md)] includes a configuration setting called `ExtendedSecurityTokenLifetime` which you can set to add additional time to the security token lifetime. If this issue becomes a problem, you can increase the value of the  `ExtendedSecurityTokenLifetime` setting. Before you do this though, we recommend that you read more about the Azure AD token lifetime policies at [Configurable token lifetimes in Azure Active Directory](/azure/active-directory/develop/active-directory-configurable-token-lifetimes).

## See Also

[Configuring Business Central Server](Configure-server-instance.md)