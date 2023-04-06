--- 
title: Activate Debugger from Development Environment
description: This article explains how to activate the debugger from the development environment and attach it to a session in Microsoft Dynamics NAV.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2e73a3c1-af01-4b5c-b96d-c1e7e3985f73
caps.latest.revision: 11
---
# Activate Debugger from Development Environment in Dynamics NAV
You can activate the debugger from the development environment. After you activate the debugger and attach it to a session, program flow in that session continues normally until a breakpoint is hit. For more information, see [Breakpoints](Breakpoints.md).  

### To activate the debugger from the development environment  

1.  In the development environment, on the **Tools** menu, point to **Debugger**, and then choose **Debug Session**.  

    > [!NOTE]  
    >  You may encounter the following error when activating the debugger.  
    >   
    >  **Microsoft.Dynamics.Nav.Client has stopped working.**  
    >   
    >  To fix this error, see [Troubleshooting: "Microsoft.Dynamics.Nav.Client has stopped working" error when starting debugger](Troubleshooting---Microsoft.Dynamics.Nav.Client-has-stopped-working--error-when-starting-debugger.md).  

2.  On the **Session List** page, do one of the following:  

    -   Choose **Debug Next**. The debugger is now active and is waiting to attach to the next session.  

    -   Select a session, and then choose **Debug**. The debugger is now active and attached to the selected session.  

 In the **View – Debugger** window, you can enable and disable breakpoints, step through lines of code, and view variable and call stack information. Additionally, you can manage breakpoints on lines of code in the C/AL Editor in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. For more information, see [Walkthrough: Debugging the Microsoft Dynamics NAV Windows Client](Walkthrough--Debugging-the-Microsoft-Dynamics-NAV-Windows-Client.md).  

## See Also  
 [Activating the Debugger](Activating-the-Debugger.md)   
 [Debugging](Debugging.md)
