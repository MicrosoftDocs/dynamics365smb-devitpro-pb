---
title: Configure Windows Client for ACS
description: To configure the Dynamics NAV Windows Client for Access Control Services, edit the client configuration file, named as ClientUserSetting.config file. 
author: jswymer
ms.date: 10/01/2018
ms.topic: article
ms.assetid: da4d2148-9846-43f6-a12f-d0af70f23d70
ms.author: jswymer
---
# Configuring the Microsoft Dynamics NAV Windows Client for ACS

[!INCLUDE[ACS_md](includes/ACS_md.md)]

You configure the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] for Access Control Service \(ACS\) by editing the client configuration file \(ClientUserSettings.config\).  

 Before you begin this procedure, you must perform the steps to configure your deployment for ACS. For more information, see [Authenticating Users with Microsoft Azure Access Control Service](Authenticating-Users-with-Microsoft-Azure-Access-Control-Service.md).  

### To configure the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] for ACS  

1.  Edit the client configuration file \(ClientUserSettings.config\) for each copy of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] that will be supporting users for ACS authentication.  

     A separate instance of the ClientUserSettings.config file is maintained for each client user. The default location for this file is C:\\Users\\*\<username>*\\AppData\\Roaming\\Microsoft\\[!INCLUDE[navnow](includes/navnow_md.md)]\\90, where \<username> is the name of the user. By default, this folder and file are hidden. Change your folder options in Windows Explorer to view hidden files before you modify the ClientUserSettings.config file.  

    > [!CAUTION]  
    >  To ensure that your edits to ClientUserSettings.config are saved, first open Notepad as an Administrator and then, in Notepad, open the settings file. To open Notepad as an Administrator, from the **Start** menu, right-click **Notepad**, and then choose **Run as Administrator**.  

2.  In ClientUserSettings.config, modify the following settings.  

    |Setting|Value|  
    |-------------|-----------|  
    |ClientServicesCredentialType|"AccessControlService"|  
    |ACSUri|Use the URI for your relying party application from the **Application Integration** section of the Access Control configuration. For more information, see [How to: Configure a Deployment for ACS](How-to--Configure-a-Deployment-for-ACS.md).|  

3.  After updating the values, save ClientUserSettings.config.  

## See Also  
 [Configure Microsoft Dynamics NAV Components for ACS](Configure-Microsoft-Dynamics-NAV-Components-for-ACS.md)
