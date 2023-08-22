---
title: Configure the Web Server and Client
description: This article explains how to configure the initial Setup and the Installed Microsoft Dynamics NAV Web Server and Client.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Configuring the Microsoft Dynamics NAV Web Server and Client
When you run [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup to initially deploy the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], you provide information that is used as the configuration for the default [!INCLUDE[navnow](includes/navnow_md.md)] web server instance, which is then used by the web, tablet, and phone clients.
For example, during Setup, you specify the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that the [!INCLUDE[navnow](includes/navnow_md.md)] Web Server connects to and the port that is used. For more information about Setup, see [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md).  
  
## Configuring the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] After Installation 
After installation, you can change any of the configuration settings that you provided during Setup and configure additional settings to suit your deployment requirements.

There are different ways to configure the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], depending on what is it is you want to change:

1. Modify the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)].

     Using a text editor, you can change the configuration of a [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] instance. The file is located where you installed the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].

     For more information, see  [Configuring Microsoft Dynamics NAV Web Client by Modifying the Web.config File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md).

2. Use the [!INCLUDE[nav_shell_md](includes/nav_shell_md.md)].

    The [!INCLUDE[nav_shell_md](includes/nav_shell_md.md)] includes the following cmdlets for managing [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances:

    <table>
     <tr>
     <th>Cmdlet</th>
     <th>[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]</th>
     </tr>
     <tr>
     <td>[Get-NAVWebServerInstance](/powershell/module/microsoft.dynamics.nav.management/Get-NAVWebServerInstance)</td>
     <td>Gets the information about the instances that are registered on a computer.</td>
     </tr>
     <td>[New-NAVWebServerInstance](/powershell/module/microsoft.dynamics.nav.management/New-NAVWebServerInstance)</td>
     <td>Creates a new web server instance and binds this instance to a [!INCLUDE[nav_server_instance_md](includes/nav_server_instance_md.md)] instance.</td>
     </tr>
     <tr>
    </tr>
     <td>[Remove-NAVWebServerInstance](/powershell/module/microsoft.dynamics.nav.management/Remove-NAVWebServerInstance)</td>
     <td>Removes an existing instance.</td>
     </tr>
    </tr>
     <td>[Set-NAVWebServerInstanceConfiguration](/powershell/module/microsoft.dynamics.nav.management/Set-NAVWebServerInstanceConfiguration)</td>
     <td>Specifies configuration values for a named web server instance. You can use this cmdlet to configure all the settings in the  </td>
     </tr>
     </table>  

     For more information, see [Microsoft.Dynamics.Nav.Management Module](/powershell/module/microsoft.dynamics.nav.management)

## Typical Tasks

Here are links to the most common configuration tasks that you will perform on the [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances and clients:

 [Configuring the Web Browser for the Microsoft Dynamics NAV Web Client](Configuring-the-Web-Browser-for-the-Microsoft-Dynamics-NAV-Web-Client.md)  
  
 [How to: Configure Delegation for Microsoft Dynamics NAV Web Client](How-to--Configure-Delegation-for-Microsoft-Dynamics-NAV-Web-Client.md)  
  
 [How to: Configure Authentication of Microsoft Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md)  
  
 [How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md)  
  
 [How to: Set Up Multiple Web Server Instances for the Microsoft Dynamics NAV Web Client](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client.md)  

 [How to: Change the Microsoft Dynamics NAV Server for the Microsoft NAV Web Client](How-to--Change-the-Microsoft-Dynamics-NAV-Server-for-the-Microsoft-NAV-Web-Client.md)
  
## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)   
 [Troubleshooting the Microsoft Dynamics NAV Web Client Installation](Troubleshooting-the-Microsoft-Dynamics-NAV-Web-Client-Installation.md)