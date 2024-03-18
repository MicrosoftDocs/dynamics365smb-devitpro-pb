---
title: "Troubleshooting HTTP Error 500.21 Internal Server Error Handler aspNetCore has a bad module AspNetCoreModule in its module list"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# Troubleshooting: HTTP Error 500.21 - Internal Server Error Handler "aspNetCore" has a bad module "AspNetCoreModule" in its module list
When you try to access the [!INCLUDE[nav_web](includes/nav_web_md.md)], you get the following error:  
  
 **HTTP Error 500.21 - Internal Server Error Handler "aspNetCore" has a bad module "AspNetCoreModule" in its module list**  

  
## Resolution  
This error can occur if the AspNetCoreModule is not installed properly in IIS on the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. The AspNetCoreModule is installed with the Microsoft .NET Core Windows Server Hosting bundle. You can get this error if this has been not been fully installed or the installation has been damaged in some way. 

To resolve this issue, open **Programs and Features** in Control Panel and check whether Microsoft .NET Core Windows Server Hosting is installed. Then, try one of the following:

-   If it is installed, repair it from **Programs and Features**, by selecting it, choosing **Change**, and then choosing **Repair**.

-   If it is not installed, download and install Microsoft .NET Core - Windows Server Hosting bundle.<!--[Microsoft .NET Core - Windows Server Hosting package](https://aka.ms/dotnetcore.2.0.0-windowshosting).-->



  
## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Troubleshooting the Microsoft Dynamics NAV Web Client Installation](Troubleshooting-the-Microsoft-Dynamics-NAV-Web-Client-Installation.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)