---
title: Authenticating Business Central Users with Azure Active Directory 
description: Get an overview about using Azure AD authentication in Business Central.
ms.custom: na
ms.date: 03/23/2022
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

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)]

Starting with 2022 release wave 1 (version 20), Business Central supports the OpenID Connect (OIDC) protocol for Azure AD authentication. In previous releases, Azure AD authentication in Business Central used WS-Federation (Web Services Federation Language). [OpenID Connect](https://openid.net/connect/) is a modern protocol that's built on OAuth 2.0 and has a standard authentication library. For more information about OpenID Connect, see [Microsoft identity platform and OpenID Connect protocol](azure/active-directory/develop/v2-protocols-oidc).

With the introduction of OpenID Connect, WS-Federation support in Business Central has been deprecated. It will be removed in a later release. Until it's removed, you can continue to use Azure AD authentication with WS-Federation, but we recommend using OpenID Connect.

For the complete setup of Azure AD with OpenID Connect, see [Configure Azure AD Authentication with OpenID Connect](authenticating-users-with-azure-ad-openid-connect.md).

> [!NOTE]
> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version 19 and earlier still only support WS-Federation. If you're setting up one of these version, see [Configure Azure AD Authentication with WS-Federation](authenticating-users-with-azure-active-directory.md).

### Switch an existing configuration from WS-Federation to OpenID Connect

The complete setup for OpenID Connect isn't much different than it is for WS-Federation. The following steps outline the modifications you have to make to an existing deployment to go from WS-Federation to OpenID connect.

1. In Azure Active Directory, enable ID tokens on the registered application for Business Central authentication. You do this change from the [Azure portal](https://portal.azure.com).
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

For the complete setup with more details, see [Configure Azure AD Authentication with OpenID Connect](authenticating-users-with-azure-ad-openid-connect.md).

### Configure legacy WS-Federation in version 20

Whether setting up a new version 20 deployment or upgrading a version 19 or earlier, you can still set up the Azure AD authentication use WS-Federation for now. The full setup is the same as in earlier versions, except the [!INCLUDE[webserver](../developer/includes/webserver.md)] now includes a setting named `UseLegacyAcsAuthentication` that you set to `true`.

For example, using the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], you run the following command:

```powershell
Set-NAVWebServerConfiguration -KeyName UseLegacyAcsAuthentication -KeyValue "true"
```

For the complete setup, see [Configure Azure AD Authentication with WS-Federation](authenticating-users-with-azure-active-directory.md).

## See Also  

[Authentication and Credential Types](Users-Credential-Types.md)  
[Troubleshooting: SAML2 token errors with Azure Active Directory/Office 365 Authentication](troubleshooting-SAML2-token-not-valid-because-validity-period-ended.md)  
[Migrating to Multitenancy](../deployment/migrating-to-multitenancy.md)
