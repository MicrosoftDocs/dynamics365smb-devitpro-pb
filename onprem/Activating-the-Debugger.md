---
title: "Activating the Debugger"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0a08fde8-9d7e-4db6-8e38-1a2934559e8c
caps.latest.revision: 16
---
# Activating the Debugger
You can use the [!INCLUDE[navnow](includes/navnow_md.md)] Debugger to debug your application. When you *activate* the debugger, you start it. When the debugger is activated, it can be in one of the following states:  

-   Attached to a session.  

-   Waiting to attach to a session.  

 You can activate the debugger in the following ways:  

-   In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, point to **Debugger**, and then choose **Debug Session**. For more information, see [How to: Activate the Debugger from the Development Environment](How-to--Activate-the-Debugger-from-the-Development-Environment.md).  

-   At the command prompt. For more information, see [How to: Activate the Debugger at the Command Prompt](How-to--Activate-the-Debugger-at-the-Command-Prompt.md).  

-   In the RoleTailored client, in the **Search** box, enter **Sessions**, and then choose the related link.  

 You attach the debugger to a session by doing one of the following:  

-   Selecting a specific session in the **Session List** page.  

-   Selecting **Debug Next** in the **Session List** page and then starting a new session.  

 Selecting a specific session to debug is useful if you know exactly which session you want to debug or if you want to debug a session that is running in the background.  

 Selecting **Debug Next** is useful if you want to debug web services. A web service call exists as a session only for the duration of the web service call, which typically is not long enough for you to select the specific session on the **Session List** page. To debug a web service, we recommend that you set your breakpoint, select **Debug Next**, and then make the web service call.  

 If the session that you want to debug is connected to a different [!INCLUDE[nav_server](includes/nav_server_md.md)] instance than the one that is currently specified in the [Options](uiref/-$-S_2355-Options-$-.md) window, then you can change to a different instance, and then activate the debugger in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. For more information, see [How to: Change the Microsoft Dynamics NAV Server Instance](How-to--Change-the-Microsoft-Dynamics-NAV-Server-Instance.md).  

## See Also  
 [Debugging](Debugging.md)
