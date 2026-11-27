---
title: "Troubleshoot SAML2 Token Errors in Business Central"
description: Troubleshoot expired SAML2 tokens in legacy Business Central deployments that use Microsoft Entra ID, and identify guidance for the Windows client.
author: jswymer
ms.date: 11/27/2026
ms.topic: troubleshooting
ai-usage: ai-assisted
---
# Troubleshooting: SAML2 token errors with Microsoft Entra ID or Office 365 authentication

This article helps you investigate SAML2 token errors in deployments that use Microsoft Entra ID authentication, formerly called Office 365 authentication.

> [!NOTE]
> The SAML error and resolution in this article describe deployments that use the legacy SAML authentication path. Authentication behavior depends on your Business Central version and configuration. The Windows-client section applies only to the legacy Dynamics NAV Windows client.

## Troubleshooting: The SAML2 token is not valid because its validity period has ended

When you use Microsoft Entra ID authentication, users working in the client get an error similar to the following message:

> Connection is no longer available or was lost

The event log includes the following error for the [!INCLUDE[server](../developer/includes/server.md)] instance:

> The SAML2 token is not valid because its validity period has ended.

### Why the SAML2 token expires

This error indicates that the SAML token has expired. Microsoft Entra ID issues SAML tokens with a default lifetime of one hour, unless a token lifetime policy changes it.

### Review the extended token lifetime setting

The [!INCLUDE[server](../developer/includes/server.md)] configuration setting `ExtendedSecurityTokenLifetime` adds 0 to 24 hours to the token expiration used by applicable server authentication paths. The default is 0. In deployments that use the legacy SAML authentication path, increasing the setting extends the time that the server accepts the token.

The setting doesn't change the token issued by Microsoft Entra ID or its token lifetime policy. Increasing it extends local token acceptance where the setting is honored, so assess the security implications before changing it. Learn more about Microsoft Entra policies in [Configurable token lifetimes in Microsoft Entra ID](/entra/identity-platform/configurable-token-lifetimes).

## ID4148: The Saml2SecurityToken is rejected because the SAML2:Assertion's NotOnOrAfter condition is not satisfied

> [!NOTE]
> This section applies only to the legacy Dynamics NAV Windows client, which was removed in Business Central version 15. It retains historical guidance about a nine-hour timeout and reopening the client. It doesn't describe a timeout in current Business Central clients.

While working in the Windows client, users get an error similar to the following:

> ID4148: The Saml2SecurityToken is rejected because the SAML2:Assertion's NotOnOrAfter condition is not satisfied.

### Why the legacy Windows client times out

The Windows client times out when it has been connected for 9 hours or more. The timeout is an internal setting and can't be changed.

### Reopen the legacy Windows client

Close and reopen the Windows client.

## Related information

[Authenticating Business Central users with Microsoft Entra ID](authenticating-users-with-azure-active-directory.md)  
[Configure Business Central Server](configure-server-instance.md)  
