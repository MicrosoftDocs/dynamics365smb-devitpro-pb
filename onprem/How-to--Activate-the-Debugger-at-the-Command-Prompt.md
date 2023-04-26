---
title: Activate Debugger at Command Prompt
description: Activate the debugger at the command prompt and attach it to a session, the program flow continues normally until a breakpoint is hit. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c5f399ab-ddcc-4f88-9f77-c7cc898e8ffb
caps.latest.revision: 19
---
# How to Activate the Debugger at the Command Prompt in Dynamics NAV
You can activate the debugger at the command prompt. After you activate the debugger and attach it to a session, program flow in that session continues normally until a breakpoint is hit. For more information, see [Breakpoints](Breakpoints.md).  
  
### To activate the debugger at the command prompt  
  
1.  At the command prompt, locate the [!INCLUDE[rtc](includes/rtc_md.md)] directory. The default location on a 32-bit computer is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\RoleTailored Client. The default location on a 64-bit computer is [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client.  
  
2.  Enter the following command:  
  
    ```  
    Microsoft.Dynamics.Nav.Client.exe "DynamicsNAV://< Server>[:<port]>/<ServerInstance>/<Company>/debug"  
    ```  
  
3.  In the **Session List** window, do one of the following:  
  
    -   Choose **Debug Next**. The debugger is now active and is waiting to attach to a session.  
  
    -   Select a session, and then choose **Debug**. The debugger is now active and attached to the selected session.  
  
 In the **Debugger** window, you can enable and disable breakpoints, step through lines of code, and view variable and call stack information. For more information, see [Walkthrough: Debugging the Microsoft Dynamics NAV Windows Client](Walkthrough--Debugging-the-Microsoft-Dynamics-NAV-Windows-Client.md).  
  
## See Also  
 [Activating the Debugger](Activating-the-Debugger.md)   
 [Debugging](Debugging.md)
