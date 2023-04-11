---
title: Debug a Background Session
description: To debug a background session, verify that no breakpoints are enabled and then set a breakpoint in the codeunit that runs when the session is started.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f97b1d48-6ced-42ac-9e8a-7264f5fbfe77
caps.latest.revision: 6
---
# How to Debug a Background Session
A background session that is started by using the [STARTSESSION Function \(Sessions\)](STARTSESSION-Function--Sessions-.md) can be difficult to debug because it is called by C/AL code for which you often do not have dedicated control. Therefore, you cannot debug the calling code and step through it to access the background session. To debug a background session, you must first set a breakpoint in the codeunit that runs when the session is started.  
  
 Before you begin, you must verify that no breakpoints are currently enabled in the calling code. For more information about how to view and disable breakpoints, see [How to: Manage Breakpoints from the Debugger Breakpoint List](How-to--Manage-Breakpoints-from-the-Debugger-Breakpoint-List.md).  
  
### To debug a background session  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose the **Codeunit** button, select the codeunit that is run when you start the background session, and then choose the **Design** button. The ID of this codeunit is the value that you pass to the **STARTSESSION** function in the *CodeunitID* parameter.  
  
3.  In the C/AL Editor, place the cursor on the first line of the **OnRun** trigger.  
  
4.  On the **Tools** menu, choose **Debugger**, and then choose **Toggle Breakpoint**. A red dot is displayed in the margin, and the breakpoint is immediately enabled.  
  
5.  On the **Tools** menu, choose **Debugger**, and then choose **Debug Session**. The **Session List** page opens.  
  
6.  On the **Session List** page, choose **Debug Next**. The debugger is now active and is waiting to attach to a session.  
  
7.  Start a new business session. For more information about types of business sessions, see [Debugging](Debugging.md).  
  
8.  In the new business session, perform the action required to call the **STARTSESSION** function. The background session starts and calls the codeunit in which you have set a breakpoint. The debugger breaks at the breakpoint in the background session.  
  
## See Also  
 [STARTSESSION Function \(Sessions\)](STARTSESSION-Function--Sessions-.md)
