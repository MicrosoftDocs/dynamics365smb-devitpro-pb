---
title: "How to: Skip Codeunit 1"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3b5317c7-b7b1-4604-95c1-67800c544ca7
caps.latest.revision: 8
---
# How to: Skip Codeunit 1
Many of the triggers in codeunit 1, Application Management, are not important for debugging a business scenario. Because they are seldom important for debugging and because codeunit 1 triggers are called very often in the application, you can specify that the debugger skips all code in codeunit 1. If you skip codeunit 1, then when you break on the next statement, the debugger does not break on code in codeunit 1. It continues until the first line of code after codeunit 1. In addition, when you step through lines of code, the debugger does not step into code in codeunit 1.  
  
 If you skip codeunit 1, then you also implicitly skip all code that is called from codeunit 1.  
  
 If you explicitly set a breakpoint in codeunit 1 or in code that is called from codeunit 1, then the debugger breaks execution when it hits the specific breakpoint, regardless of whether you have selected the setting to skip codeunit 1.  
  
 By default, the debugger is set to skip codeunit 1.  
  
 For more information about how to open the **Debugger** window, see [Activating the Debugger](Activating-the-Debugger.md).  
  
### To skip codeunit 1  
  
1.  In the **Debugger** window, on the **Home** tab, in the **Breakpoints** group, choose **Break Rules**.  
  
2.  In the **Debugger Break Rules** window, select the **Skip Codeunit 1** check box, and then choose the **OK** button.  
  
## See Also  
 [Breakpoints](Breakpoints.md)   
 [How to: Break on Errors](How-to--Break-on-Errors.md)   
 [How to: Break on Record Changes](How-to--Break-on-Record-Changes.md)
