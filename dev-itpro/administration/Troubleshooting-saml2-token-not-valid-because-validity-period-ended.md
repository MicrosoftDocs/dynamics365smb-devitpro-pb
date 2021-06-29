---
title: "The SAML2 token is not valid because its validity period has ended."
description: Troubleshooting guidelines for SAML2 token errors that can occur when using Azure AD or Office authentication
author: jswymer
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---
# Troubleshooting: SAML2 token errors with Azure Active Directory / Office 365 Authentication

This article provides troubleshooting guidelines for SAML2 token errors that users might experience when your deployment's using Azure AD or Office 365 Authentication.

## Troubleshooting: The SAML2 token is not valid because its validity period has ended

When using Azure Active Directory authentication, while working in the client, users get an error similar to the following message: 

**Connection is not longer available or was lost**

The event log includes the following error for the [!INCLUDE[server](../developer/includes/server.md)] instance:

**The SAML2 token is not valid because its validity period has ended.** 

### Cause  

This error occurs because the security token that's used by Azure AD has exceeded its specified lifetime. By default, the lifetime, which is determined by Azure AD, is 1 hour.

### Resolution

The [!INCLUDE[server](../developer/includes/server.md)] includes a configuration setting called `ExtendedSecurityTokenLifetime` that you can set to add additional time to the security token lifetime. If this issue becomes a problem, you can increase the value of the  `ExtendedSecurityTokenLifetime` setting. Before you do, read more about the Azure AD token lifetime policies at [Configurable token lifetimes in Azure Active Directory](/azure/active-directory/develop/active-directory-configurable-token-lifetimes).

## ID4148: The Saml2SecurityToken is rejected because the SAML2:Assertion's NotOnOrAfter condition is not satisfied

While working in the Windows client, users get an error similar to the following:

**ID4148: The Saml2SecurityToken is rejected because the SAML2:Assertion's NotOnOrAfter condition is not satisfied.**

### Cause

The Windows client times out when it has been connected for 9 hours or more. The timeout is an internal setting and can't be changed.

### Resolution 

Close and reopen the Windows client.

## See Also

[Authenticating Business Central Users with Azure Active Directory](authenticating-users-with-azure-active-directory.md)  
[Configuring Business Central Server](Configure-server-instance.md)