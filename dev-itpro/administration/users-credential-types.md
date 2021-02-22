---
title: Users and Credential Authorization
description: This article explains how the credential authorization mechanism works for users of Business Central and how to configure credential types for on-premises.
author: edupont04

ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 10/01/2020

---
# Authentication and Credential Types for [!INCLUDE[prod_long](../developer/includes/prod_long.md)]  

In [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, users are added through the Microsoft 365 admin center. Once users are created in Microsoft 365, they can be imported into the **Users** window in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. For more information, see [Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions) in the business functionality content.  

## Configuring Authentication for On-Premises Deployments
An on-premises deployment of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports several credential authorization mechanisms for users. When you create a user, you provide different information depending on the credential type that you are using in the current [!INCLUDE[server](../developer/includes/server.md)] instance.

> [!IMPORTANT]  
> All users of a [!INCLUDE[server](../developer/includes/server.md)] instance must be using the same credential type. In on-premises deployments, you can specify which credential type is used for a particular [!INCLUDE[server](../developer/includes/server.md)] instance in the [!INCLUDE[admintool](../developer/includes/admintool.md)].  

### Credential Types  
[!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises supports the following credential types.  

|Credential types|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|----------------------|---------------------------------------|  
|**Windows**|With this credential type, users are authenticated using their Windows credentials. You can only specify Windows as the credential type if the corresponding user exists in Windows \(Active Directory, local workgroup, or the local computer’s users\). Because they are authenticated through Windows, Windows users are not prompted for credentials when they access [!INCLUDE[prod_short](../developer/includes/prod_short.md)].|  
|**UserName**|With this setting, the user is prompted for username/password credentials when they access [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. These credentials are then validated against Windows authentication by [!INCLUDE[server](../developer/includes/server.md)]. There must already be a corresponding user in Windows. Security certificates are required to protect the passing of credentials across a wide-area network. Typically, this setting should be used when the [!INCLUDE[server](../developer/includes/server.md)] computer is part of an authenticating Active Directory domain, but the computer where the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] is installed is not part of the domain.|  
|**NavUserPassword**|With this setting, authentication is managed by [!INCLUDE[server](../developer/includes/server.md)] but is not based on Windows users or Active Directory. The user is prompted for username/password credentials when they start the client. The credentials are then validated by an external mechanism. Security certificates are required to protect the passing of credentials. This mode is intended for hosted environments, for example, where [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is implemented in Azure.|  
|**AccessControlService**|With this setting, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] relies on Azure Active Directory \(Azure AD\) for user authentication services.<br /><br /> Azure AD is a cloud service that provides identity and access capabilities, such as for applications on Azure, in Microsoft Microsoft 365, and for applications that install on-premises. If the [!INCLUDE[server](../developer/includes/server.md)] instance is configured to use AccessControlService authentication, you can specify an Azure AD account for each user in the **Office 365 Authentication** field so that they can access both the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and their Microsoft 365 site. Also, if you use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in an app for SharePoint, users have single sign-on between the SharePoint site and [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. For more information, see [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md) or [Authenticating Users with Active Directory Federation Services](authenticating-users-with-active-directory-federation-service.md).<br /><br />Security certificates are required to protect the passing of credentials across a wide-area network. |  
|**None**| For internal use on system sessions and typically should not be used. If you choose **None**, then the [!INCLUDE[server](../developer/includes/server.md)] instance cannot start.|
|**ExchangeIdentity and TaskScheduler**| For internal use only. Do not use.|

> [!IMPORTANT]  
>  If [!INCLUDE[server](../developer/includes/server.md)] is configured to use NavUserPassword or AccessControlService authentication, then the username, password, and access key can be exposed if the SOAP or OData data traffic is intercepted and the connection string is decoded. To avoid this condition, configure SOAP and OData web services to use Secure Socket Layer \(SSL\). For more information, see [How to: Implement Security Certificates in a Production Environment](/dynamics-nav/How-to--Implement-Security-Certificates-in-a-Production-Environment) in the ITPro content for [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)].  

### Configuring the Credential Type for Client and Server  
For on-premises deployment, you must make sure that clients and [!INCLUDE[server](../developer/includes/server.md)] are configured to use the same credential type.  

When you change the credential type for a [!INCLUDE[server](../developer/includes/server.md)] instance and the relevant client configurations, the changes take effect when you restart the [!INCLUDE[server](../developer/includes/server.md)] instance and users connect to the instance again.  

#### Server Configuration

To edit the configuration for the [!INCLUDE[server](../developer/includes/server.md)] instance, you can use either the [!INCLUDE[admintool](../developer/includes/admintool.md)] or the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. In the [!INCLUDE[admintool](../developer/includes/admintool.md)], you configure the credential type in the **Credential Type** field on the **General** tab. Alternatively, you can edit the CustomSettings.config file. For more information, see [Configuring Business Central Server](configure-server-instance.md).  

<!--
> [!IMPORTANT]  
>  When [!INCLUDE[server](../developer/includes/server.md)] services are deployed on Azure but not as part of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, you must configure them on Azure. For more information, see [How to: Open Microsoft Dynamics NAV Clients that Connect to Microsoft Dynamics NAV on Microsoft Azure](/dynamics-nav/How-to--Open-Microsoft-Dynamics-NAV-Clients-that-Connect-to-Microsoft-Dynamics-NAV-on-Microsoft-Azure) in the ITPro content for [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)].  
-->
#### Client Configuration

In the relevant configuration file, find the **ClientServicesCredentialType** parameter and change the value to one of the options listed earlier.  

For the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] users, you must modify the *navsettings.json* for the [!INCLUDE[webserver](../developer/includes/webserver.md)]. The navsettings.json file is a Java Script Object Notification file type that is similar to files that use the XML file format. The file is stored in the physical path of the web server instance, which is by default is *c:\inetpub\\wwwroot\\[!INCLUDE[serverinstance](../developer/includes/serverinstance.md)]*. For more information, see [Settings in the navsettings.json](configure-web-server.md#Settings).  

For each [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] user, you must modify the ClientUserSettings.config file. The default location for this file is **C:\\Users\\\<username>\\AppData\\Roaming\\Microsoft\\Microsoft Dynamics NAV\\130**, where *\<username>* is the name of the user. For more information, see [Configuring the Microsoft Dynamics NAV Windows Client](/dynamics-nav/configuring-the-windows-client) in the ITPro content for [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]. 

### Security Certificates 
With UserName, NavUserPassword, and AccessControlService credential types require that you install and configure security certificates on components. For more information, see [Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md)

## See Also  

[Understanding Users, Profiles, and Role Centers](/dynamics365/business-central/admin-users-profiles-roles)  
[Configuring Business Central Server](configure-server-instance.md)  
<!--[Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview.md)-->  
