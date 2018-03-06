---
title: Users and Credential Authorization
description: This article explains how the credential authorization mechanism works for Microsoft Dynamics NAV users and how to configure credential types.
ms.custom: na
ms.date: 10/17/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ec4b3a58-4834-41b5-a382-6d619fa12636
caps.latest.revision: 32
---
# Credential Types for Dynamics NAV Users
[!INCLUDE[navnowlong](includes/navnowlong_md.md)] supports four credential authorization mechanisms for [!INCLUDE[navnow](includes/navnow_md.md)] users. When you create a user, you provide different information depending on the credential type that you are using in the current [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
> [!IMPORTANT]  
>  All users of a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance must be using the same credential type. You specify which credential type is used for a particular [!INCLUDE[nav_server](includes/nav_server_md.md)] instance in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)].  
  
 For more information about how to create users, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md). Alternatively, you can create new users using the Windows PowerShell cmdlet, **New-NAVServerUser**. For more information, see [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md).  
  
## Credential Types  
 [!INCLUDE[navnow](includes/navnow_md.md)] supports the following credential types.  
  
|Credential types|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------------------|---------------------------------------|  
|**Windows**|With this credential type, users are authenticated using their Windows credentials. You can only specify Windows as the credential type if the corresponding user exists in Windows \(Active Directory, local workgroup, or the local computer’s users\). Because they are authenticated through Windows, Windows users are not prompted for credentials when they access [!INCLUDE[navnow](includes/navnow_md.md)].|  
|**UserName**|With this setting, the user is prompted for username/password credentials when they access [!INCLUDE[navnow](includes/navnow_md.md)]. These credentials are then validated against Windows authentication by [!INCLUDE[nav_server](includes/nav_server_md.md)]. There must already be a corresponding user in Windows. Security certificates are required to protect the passing of credentials across a wide-area network. Typically, this setting should be used when the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer is part of an authenticating Active Directory domain, but the computer where the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is installed is not part of the domain.|  
|**NavUserPassword**|With this setting, authentication is managed by [!INCLUDE[nav_server](includes/nav_server_md.md)] but is not based on Windows users or Active Directory. The user is prompted for username/password credentials when they start the client. The credentials are then validated by an external mechanism. Security certificates are required to protect the passing of credentials. This mode is intended for hosted environments, for example, where [!INCLUDE[navnow](includes/navnow_md.md)] is implemented in Azure.|  
|**AccessControlService**|With this setting, [!INCLUDE[navnow](includes/navnow_md.md)] relies on Microsoft Azure Access Control service \(ACS\) or Azure Active Directory \(Azure AD\) for user authentication services.<br /><br /> ACS is a cloud service that provides user authentication and authorization for web applications and services. ACS integrates with standards-based identity providers, including enterprise directories such as Active Directory, and web identities such as Microsoft account, Google, Yahoo\!, and Facebook. For more information, see [Authenticating Users with Microsoft Azure Access Control Service](Authenticating-Users-with-Microsoft-Azure-Access-Control-Service.md).<br /><br /> Azure AD is a cloud service that provides identity and access capabilities, such as for applications on Azure, in Microsoft Office 365, and for applications that install on-premises. If the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is configured to use AccessControlService authentication, you can specify an Azure AD account for each user in the **Office 365 Authentication** field so that they can access both the [!INCLUDE[nav_web](includes/nav_web_md.md)] and their Office 365 site. Also, if you use [!INCLUDE[navnow](includes/navnow_md.md)] in an app for SharePoint, users have single sign-on between the SharePoint site and [!INCLUDE[navnow](includes/navnow_md.md)]. For more information, see [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md).|  
  
> [!IMPORTANT]  
>  If [!INCLUDE[nav_server](includes/nav_server_md.md)] is configured to use NavUserPassword or AccessControlService authentication, then the username, password, and access key can be exposed if the SOAP or OData data traffic is intercepted and the connection string is decoded. To avoid this condition, configure SOAP and OData web services to use Secure Socket Layer \(SSL\). For more information, see [Walkthrough: Configuring Web Services to Use SSL \(SOAP and OData\)](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md).  
  
## Configuring the Credential Type  
 [!INCLUDE[rtc](includes/rtc_md.md)]s and [!INCLUDE[nav_server](includes/nav_server_md.md)] must be configured to use the same credential type.  
  
 To edit the configuration for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, you can use either the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] or the [!INCLUDE[nav_shell](includes/nav_shell_md.md)]. In the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], you configure the credential type in the **Credential Type** field on the **General** tab. Alternatively, you can edit the CustomSettings.config file. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
  
> [!IMPORTANT]  
>  When [!INCLUDE[nav_server](includes/nav_server_md.md)] services are deployed on Azure, you must configure them on Azure. For more information, see [How to: Open Microsoft Dynamics NAV Clients that Connect to Microsoft Dynamics NAV on Microsoft Azure](How-to--Open-Microsoft-Dynamics-NAV-Clients-that-Connect-to-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md).  
  
 For each [!INCLUDE[nav_windows](includes/nav_windows_md.md)] user, you must modify the ClientUserSettings.config file. The default location for this file is **C:\\Users\\\<username>\\AppData\\Roaming\\Microsoft\\Microsoft Dynamics NAV\\100**, where *\<username>* is the name of the user. For the [!INCLUDE[nav_web](includes/nav_web_md.md)] users, you must modify the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)] for the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. For information, see [Configuring Microsoft Dynamics NAV Web Client by Modifying the Web.config File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md). In the relevant configuration file, find the **ClientServicesCredentialType** parameter and change the value to one of the options listed earlier.  
  
 When you change the credential type for a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and the relevant client configurations, the changes take effect when you restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and users connect to the instance again.  
  
## See Also  
 [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Configuring Microsoft Dynamics NAV Web Client by Modifying the Web.config File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md)   
 [Configuring the Windows Client](Configuring-the-Windows-Client.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)   
 [How to: Open Microsoft Dynamics NAV Clients that Connect to Microsoft Dynamics NAV on Microsoft Azure](How-to--Open-Microsoft-Dynamics-NAV-Clients-that-Connect-to-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)