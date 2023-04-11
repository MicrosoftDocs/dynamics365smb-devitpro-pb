---
title: "Debugging"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9cfc02d2-2211-466f-b5e9-8178bdc79311
caps.latest.revision: 39
---
# Debugging
The process of finding and correcting errors is called *debugging*. [!INCLUDE[navnowlong](includes/navnowlong_md.md)] provides an integrated debugger to help you inspect your code to verify that your application can run as expected. The debugger UI runs in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](includes/nav_web_md.md)]. The debugger services run on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].  

 For a tour of the new [!INCLUDE[navnow](includes/navnow_md.md)] Debugger, see [Walkthrough: Debugging the Microsoft Dynamics NAV Windows Client](Walkthrough--Debugging-the-Microsoft-Dynamics-NAV-Windows-Client.md).  

> [!NOTE]  
>  In [!INCLUDE[nav2009](includes/nav2009_md.md)], you used Visual Studio to debug objects on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], and you used the [!INCLUDE[navnow](includes/navnow_md.md)] Debugger to debug objects running on the Classic client. You cannot use Visual Studio to debug objects on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] in [!INCLUDE[navnowlong](includes/navnowlong_md.md)]. Instead, you use the new [!INCLUDE[navnow](includes/navnow_md.md)] Debugger.  

## Business Sessions  
 To start debugging, you attach the debugger to a business session. The business session that you select can be any of the following:  

-   [!INCLUDE[nav_windows](includes/nav_windows_md.md)] session.  

-   [!INCLUDE[nav_web](includes/nav_web_md.md)] session.  

-   OData web services session.  

-   SOAP web services session.  

-   NAS services session.  

-   Background session that you start by using the [STARTSESSION Function \(Sessions\)](STARTSESSION-Function--Sessions-.md).  

 After you attach the debugger, program flow runs until it reaches a breakpoint.  

 The remaining unattached business sessions continue to run without interruption.  

 For more information, see [Activating the Debugger](Activating-the-Debugger.md).  

## Breakpoints  
 The basic concept in debugging is the *breakpoint*, which is a mark that you set on a statement. When the program flow reaches the breakpoint, the debugger stops execution until you instruct it to continue. Without any breakpoints, the code runs without interruption when the debugger is active. For more information, see [Breakpoints](Breakpoints.md).  

## Debugging Requirements  
 To use the [!INCLUDE[navnow](includes/navnow_md.md)] debugger, the user who is logged in must be assigned the SUPER permission set for all companies. To assign the permission set for all companies, on the **User Card** page, under **User Permission Sets**, leave the **Company** column blank. If you assign the SUPER permission set for a specific company, then you get an error that you must be a member of the SUPER user role. For more information, see [How to: Define Permissions for Users](How-to--Define-Permissions-for-Users.md).  

 Assigning the SUPER permission set for all companies is required because a user who is debugging has access to business data in the debugged session.  

> [!IMPORTANT]  
>  If you want to debug code that contains multiple INSERT statements, we recommend that you disable bulk inserts. If a loop with multiple INSERT statements is being buffered for a bulk insert, the [!INCLUDE[navnow](includes/navnow_md.md)] debugger cannot step through that code. If you disable bulk inserts, the debugger will step through the code as expected. For more information, see [Bulk Inserts](Bulk-Inserts.md) and [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  

## Disabling Debugging  
 If you do not want any user to be able to debug sessions on [!INCLUDE[nav_server](includes/nav_server_md.md)], then you must disable debugging. This is useful if you have concerns about how to allow your data to be seen through the debugger. For more information, see [How to: Disable Debugging](How-to--Disable-Debugging.md).  

## Troubleshooting Protocol Mismatch Errors  
 We recommend that you do not use the *settings* parameter when you start a [!INCLUDE[nav_windows](includes/nav_windows_md.md)] if you later want to use that [!INCLUDE[nav_windows](includes/nav_windows_md.md)] to start the debugger. When you start the debugger from **Sessions** page, it uses some information from the default ClientUserSettings.config file, not the config file that you specified with the *settings* parameter when you started the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. There can be differences in the connection properties, which causes a protocol mismatch error.  

 For more information about the *settings* parameter, see [Starting the Windows Client at the Command Prompt](Starting-the-Windows-Client-at-the-Command-Prompt.md).  

## See Also  
 [Walkthrough: Debugging the Microsoft Dynamics NAV Windows Client](Walkthrough--Debugging-the-Microsoft-Dynamics-NAV-Windows-Client.md)   
 [Avoiding Run-Time Errors](Avoiding-Run-Time-Errors.md)   
 [Using About This Page and About This Report](Using-About-This-Page-and-About-This-Report.md)
