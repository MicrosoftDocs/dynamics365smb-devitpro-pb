---
title: "Troubleshooting: HTTP Error 500 (or 500.21) - Internal Server Error Handler"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b306d263-4c44-4d22-81b8-a3b15070f29a
caps.latest.revision: 14
---
# Troubleshooting: HTTP Error 500 (or 500.21) - Internal Server Error Handler
When you try to access the [!INCLUDE[nav_web](includes/nav_web_md.md)], you get an error message that is similar to one of the following:  
  
 **HTTP Error 500 - Internal Server Error Handler**  
  
 **HTTP Error 500.21 - Internal Server Error Handler "PageHandlerFactory-Integrated" has a bad module "ManagedPipelineHandler" in its module list.**  
  
## Resolution  
 This error occurs because the Microsoft .NET Framework 4.0 configuration for ASP .NET has been damaged, which can occur if Microsoft Visual Studio 2012 was installed before Visual Studio 2010 or Microsoft SQL Server 2008.  
  
 To resolve this error, you must repair the .NET Framework 4.0.30319 version. However, the Microsoft .NET Framework 4.0 installation and configuration can vary depending on your system. You can try to repair the .NET Framework 4.0.30319 version from a command prompt \(as described in the following procedure\) or use the Microsoft .NET Framework Repair Tool that is available at [https://support.microsoft.com/kb/2698555](https://support.microsoft.com/kb/2698555).  
  
#### To repair the .NET Framework  
  
1.  On the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], open a Command Prompt window as an administrator as follows:  
  
    1.  From the **Start** menu, choose **All Programs**, and then choose **Accessories**.  
  
    2.  Right-click **Command Prompt**, and then choose **Run as administrator**.  
  
2.  At the command prompt, do the following.  
  
    -   If the computer is running the full Microsoft .NET Framework, enter the following commands to change to the *Microsoft.NET\\Framework64\\v4.0.30319\\SetupCache* folder, and then run setup.exe:  
  
        ```  
        cd\Windows\Microsoft.NET\Framework64\v4.0.30319\SetupCache  
        ```  
  
        ```  
        setup.exe /repair /x86 /x64 /ia64 /norestart  
        ```  
  
    -   If the computer is running the Microsoft .NET Framework client profile, enter the following commands to change to the *Microsoft.NET\\Framework64\\v4.0.30319\\SetupCache\\Client* folder, and then run the setup.exe:  
  
        ```  
        cd\Windows\Microsoft.NET\Framework64\v4.0.30319\SetupCache\Client  
        ```  
  
        ```  
        setup.exe /repair /x86 /x64 /ia64 /parameterfolder Client /norestart  
        ```  
  
3.  At the command prompt, type the following command, and then press Enter:  
  
    ```  
    iisreset  
    ```  
  
## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Troubleshooting the Microsoft Dynamics NAV Web Client Installation](Troubleshooting-the-Microsoft-Dynamics-NAV-Web-Client-Installation.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)
