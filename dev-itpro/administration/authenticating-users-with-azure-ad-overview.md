---
title: User Authentication with Azure AD for Single Sign-on
description: Associate an existing Microsoft account with user account to achieve single sign-on between the Web client and Microsoft 365.
ms.custom: na
ms.date: 01/26/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Authenticating [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Users with Azure Active Directory 

Microsoft Azure Active Directory \(Azure AD\) is a cloud service that provides identity and access capabilities for applications. The applications can be cloud-based, like on Microsoft Azure and  Microsoft 365, and installed on-premises, like [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

The article describes the tasks involved in setting up Azure AD authentication for authenticating [!INCLUDE[prod_short](../developer/includes/prod_short.md)] users.

## Azure AD and [!INCLUDE[prod_short](../developer/includes/prod_short.md)]

With Azure AD authentication, you store user accounts and credentials in an Azure AD tenant. You then associate [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user accounts with the Azure AD tenant user account. Once in place, users access [!INCLUDE[prod_short](../developer/includes/prod_short.md)] by using their Azure AD account.  

Azure AD authentication enables [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to integrate with various applications and services, through a single sign-on experience. It's the required authentication method for some features offered by [!INCLUDE[prod_short](../developer/includes/prod_short.md)], such as:  

- Excel add-in
- Excel financial reports
- Outlook add-in
- Cover sheets for contact management
- Power BI reports and charts
- Power Automate Management
- Service-to-Service authentication with Automation APIs

### Moving from WS-Federation to OpenID Connect

Starting with 2022 release wave 1 (version 20), Business Central supports the OpenID Connect (OIDC) protocol for Azure AD authentication. In previous releases, Azure AD authentication in Business Central used WS-Federation (Web Services Federation Language). OpenID Connect (OIDC) is a modern protocol, built on OAuth 2.0. It comes with a standard authentication library.

WS-Federation support in Business Central is deprecated, and will be removed completely in version 21. If you're running version 20, you have the option to configure WS-Federation.

## See Also  

[Authentication and Credential Types](Users-Credential-Types.md)  
[Troubleshooting: SAML2 token errors with Azure Active Directory/Office 365 Authentication](troubleshooting-SAML2-token-not-valid-because-validity-period-ended.md)  
[Migrating to Multitenancy](../deployment/migrating-to-multitenancy.md)
