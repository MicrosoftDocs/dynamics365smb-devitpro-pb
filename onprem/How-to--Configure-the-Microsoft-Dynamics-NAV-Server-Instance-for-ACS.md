---
title: Configure Server Instance for ACS
description: You configure your Dynamics NAV Server instance for Access Control Service by using either the Server Admininstration Tool or the PowerShell API. 
author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 33f5c0d7-5bf9-487c-b9a3-ef25e4c65216
ms.author: jswymer
---
# Configuring Dynamics NAV Server Instance for ACS

[!INCLUDE[ACS_md](includes/ACS_md.md)]

You configure your [!INCLUDE[nav_server](includes/nav_server_md.md)] instance for Access Control Service \(ACS\) by using either the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] or the [!INCLUDE[navnow](includes/navnow_md.md)] PowerShell API.  

 Before you begin this procedure, you must perform the steps to configure your deployment for ACS. For more information, see [Authenticating Users with Microsoft Azure Access Control Service](Authenticating-Users-with-Microsoft-Azure-Access-Control-Service.md).  

### To configure the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance for ACS  

1.  Start either the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] or the [!INCLUDE[dyn_nav](includes/dyn_nav_md.md)] PowerShell API.  

     For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md) or [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md).  

2.  Find the **ClientServicesCredentialType** parameter in the configuration for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

     In the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], the parameter is named **Credential Type** and is on the **General** tab.  

     For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  

3.  Change the value to **AccessControlService**.  

    > [!IMPORTANT]  
    >  If not already done, under the **Client Services** tab, you must set the **Certificate Thumbprint** parameter to the thumbprint of the security certificate that is used by [!INCLUDE[nav_server](includes/nav_server_md.md)].  

4.  Find the **ClientServicesTokenSigningKey** parameter in the configuration for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

     In the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], the parameter is named **Token Signing Key** and is on the **Client Services** tab.  

     For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  

5.  Replace the current value with the string of characters from the **Token signing key** field in the **Add Relying Party Application** page.  

6.  Restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

 The next steps are to configure your clients for ACS. For more information, see [How to: Configure the Microsoft Dynamics NAV Windows Client for ACS](How-to--Configure-the-Microsoft-Dynamics-NAV-Windows-Client-for-ACS.md) and [How to: Configure the Microsoft Dynamics NAV Web Client for ACS](How-to--Configure-the-Microsoft-Dynamics-NAV-Web-Client-for-ACS.md).  

## See Also  
 [Configure Microsoft Dynamics NAV Components for ACS](Configure-Microsoft-Dynamics-NAV-Components-for-ACS.md)
