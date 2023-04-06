---
title: Configure Web Client for ACS
description: Configure Dynamics NAV Web Client for Access Control Service by editing an xml file called web.config file, edit with any text editor, for example- notepad.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.prod: "dynamics-nav-2018"
---
# Configuring Dynamics NAV Web Client for ACS

[!INCLUDE[ACS_md](includes/ACS_md.md)]

You configure the [!INCLUDE[nav_web](includes/nav_web_md.md)] for Access Control Service \(ACS\) by editing the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)]. The [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)] is an .xml file that you can edit with a text editor, such as Notepad. By default, the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)] is located in the [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Web Client\\ folder.   

 Before you begin this procedure, you must perform the steps to configure your deployment for ACS. For more information, see [Authenticating Users with Microsoft Azure Access Control Service](Authenticating-Users-with-Microsoft-Azure-Access-Control-Service.md).  

### To configure the [!INCLUDE[nav_web](includes/nav_web_md.md)] for ACS  

1.  Edit the web server configuration file \(web.config\) for each instance of the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] that will be supporting users for ACS authentication.  

     A separate instance of the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)] is maintained for each server instance. The default location for this file is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\WebClient\\.  

    > [!CAUTION]  
    >  To ensure that your edits to web.config are saved, first open Notepad as an Administrator and then, in Notepad, open the settings file. To open Notepad as an Administrator, from the **Start** menu, right-click **Notepad**, and then choose **Run as Administrator**.  

2.  In the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)], modify the following setting.  

    | Setting | Value |  
    |---------|-------|  
    |ClientServicesCredentialType|"AccessControlService"|  

3.  After updating the values, save ClientUserSettings.config.  

## See Also  
 [Configure Microsoft Dynamics NAV Components for ACS](Configure-Microsoft-Dynamics-NAV-Components-for-ACS.md)
