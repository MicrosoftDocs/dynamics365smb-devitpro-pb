---
title: Change the Web Client Server
description: Dynamics NAV Server configures the web client settings in the web.config file. Modify the web.config file to change the Server instance after installation.
ms.date: 10/01/2018
ms.topic: article
author: jswymer
---
# Changing the Microsoft Dynamics NAV Server for the Microsoft NAV Web Client
The [!INCLUDE[nav_server](includes/nav_server_md.md)] that the [!INCLUDE[nav_web](includes/nav_web_md.md)] connects to is configured in the web.config file for the website that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. By default, [!INCLUDE[navnow](includes/navnow_md.md)] Setup configures the [!INCLUDE[nav_web](includes/nav_web_md.md)] to connect to the following [!INCLUDE[nav_server](includes/nav_server_md.md)] instance:  

-   Server name: localhost  

-   Service instance: [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]  

-   Client service port: 7046  

 To change the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance after you install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], you modify the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)].  

### To change the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance  

1.  On the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], open the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)] for the web server instance of [!INCLUDE[nav_web](includes/nav_web_md.md)]. Use a text editor, such as Notepad.  

     The [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)] is located in the physical path of the virtual directory for the web server instance on Internet Information Services \(IIS\). By default, the path is *%systemroot%\\inetpub\\wwwroot\\\[VirtualDirectoryName\]*. For example, the folder for the default [!INCLUDE[nav_web](includes/nav_web_md.md)] instance is %systemroot%\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)].  

    > [!IMPORTANT]  
    >  You must open the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)] as an administrator or have permission to modify the file.  

2.  Locate the `<DynamicsNAVSettings>` element.  

3.  Change the values for the following `<add />` elements.  

    |Value|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |-----------|---------------------------------------|  
    |ClientServicesPort|Specifies the TCP port for the [!INCLUDE[nav_server](includes/nav_server_md.md)].<br /><br /> Values: 1-65535<br /><br /> Default value: 7046|  
    |Server|Specifies the name of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].<br /><br /> Default value: localhost|  
    |ServerInstance|Specifies the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that the [!INCLUDE[nav_web](includes/nav_web_md.md)] connects to.<br /><br /> For more information, see [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md).<br /><br /> Default value: [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]|  

4.  Save the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)].  

## See Also  
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)   
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)
