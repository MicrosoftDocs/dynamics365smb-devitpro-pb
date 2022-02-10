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

Azure Active Directory \(Azure AD\) is a cloud service that provides identity and access capabilities for applications. The applications can be cloud-based, like on Microsoft Azure and  Microsoft 365, and installed on-premises, like [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

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

## Moving from WS-Federation to OpenID Connect

Starting with 2022 release wave 1 (version 20), Business Central supports the OpenID Connect (OIDC) protocol for Azure AD authentication. In previous releases, Azure AD authentication in Business Central used WS-Federation (Web Services Federation Language). [OpenID Connect](https://openid.net/connect/) is a modern protocol that's built on OAuth 2.0 and has a standard authentication library. For more information about OpenID Connect, see [Microsoft identity platform and OpenID Connect protocol](azure/active-directory/develop/v2-protocols-oidc).

With the introduction of OpenID Connect, WS-Federation support in Business Central has been deprecated. It will be removed in a later release. Until it's removed, you can continue to use Azure AD authentication with WS-Federation, but we recommend using OpenID Connect.




### Switch an existing configuration from WS-Federation to h OpenID Connect

The setup of Azure AD authentication with OpenID Connect is similar to the legacy WS-Federation setup. But there are some important differences. So if you're upgrading an existing deployment from WS-Federation to OpenID connect, you'll have to make the following changes:

1. In Azure Active Directory, enable ID tokens on the registered application for Business Central authentication.
2. In [!INCLUDE[prod_short](../developer/includes/prod_short.md)]:

    1. Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to include the `ValidAudiences` parameter set to the application ID assigned to the registered application in Azure AD.

        ```powershell
        Set-NAVServerConfiguration -ServerInstance <BC server instance name>  -KeyName ValidAudiences -KeyValue "<application ID>"
        ```

    2. Configure the [!INCLUDE[webserver](../developer/includes/webserver.md)] to include the `AadApplicationId` and `AadAuthorityUri` parameters. Set `AadApplicationId` to the application ID assigned to the registered application in Azure AD. Set `AadAuthorityUri` to `"https://login.microsoftonline.com/<Azure_AD_Tenant_ID>`.

        ```powershell 
        Set-NAVWebServerConfiguration -KeyName AadApplicationId -KeyValue "<Azure_AD_Application_ID>"
        Set-NAVWebServerConfiguration -KeyName AadAuthorityUri -KeyValue "https://login.microsoftonline.com/<Azure_AD_Tenant_ID>"
        ```

For the complete setup, see [Configure Azure AD Authentication with OpenID Connect](authenticating-users-with-azure-ad-openid-connect.md).

### Configuring Azure AD authentication with WS-Federation in version 20

Whether you setting up a new deployment or upgrading from an earlier version, you can still use WS-Federation for now. The full setup is the same as in earlier versions, except the [!INCLUDE[webserver](../developer/includes/webserver.md)] now includes a setting named `UseLegacyAcsAuthentication`. To use Azure AD authentication with WS-Federation, set the value to `true`. For example, using the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], you run the following command:

```powershell
Set-NAVWebServerConfiguration -KeyName UseLegacyAcsAuthentication -KeyValue "true"
```

### Configuring Azure AD authentication in earlier versions

The Azure AD authentication setup hasn't changed for versions 19 and earlier. For more information, see [Configure Azure AD Authentication with WS-Federation](authenticating-users-with-azure-active-directory.md)

## See Also  

[Authentication and Credential Types](Users-Credential-Types.md)  
[Troubleshooting: SAML2 token errors with Azure Active Directory/Office 365 Authentication](troubleshooting-SAML2-token-not-valid-because-validity-period-ended.md)  
[Migrating to Multitenancy](../deployment/migrating-to-multitenancy.md)
