---
title: "How to: Manage Breakpoints from the Development Environment"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2cb691cf-c88b-4f54-90d1-47f193112b2f
caps.latest.revision: 15
---
# How to: Manage Breakpoints from the Development Environment
You can view, set, enable, disable, or delete breakpoints on lines of code in the C/AL Editor in the development environment. The breakpoints that you set, enable, disable, or delete in the C/AL Editor are displayed in the code viewer in the debugger and in the debugger breakpoint list.  
  
> [!NOTE]  
>  You cannot manage breaks on the next statement, breaks on errors, or breaks on record changes from the development environment. You must manage these breaks from the debugger.  
  
> [!NOTE]  
>  If you set a breakpoint from the debugger, then it is not displayed in the C/AL Editor. If you enable, disable, or delete a breakpoint from the debugger, that change is not displayed in the C/AL Editor until you open the editor again.  
  
### To view breakpoints in the development environment  
  
1.  In the development environment, on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select the object that you want to debug, and then choose **Design**. If the object is not a codeunit, then on the **View** menu, choose **C/AL Code**.  
  
     In the C/AL Editor, breakpoints are displayed in the margin. An enabled breakpoint is identified by a red dot. A disabled breakpoint is identified by an unfilled red circle.  
  
### To set breakpoints from the development environment  
  
1.  In the C/AL Editor, place the cursor on the line of code on which you want to set a breakpoint.  
  
2.  On the **Tools** menu, point to **Debugger**, and then choose **Toggle Breakpoint**. A red dot is displayed in the margin, and the breakpoint is immediately enabled.  
  
### To enable breakpoints from the development environment  
  
1.  In the C/AL Editor, place the cursor on the line of code that has a disabled breakpoint.  
  
2.  On the **Tools** menu, point to **Debugger**, and then choose **Toggle Breakpoint**. The red unfilled circle disappears, and the breakpoint is immediately deleted.  
  
3.  On the **Tools** menu, point to **Debugger**, and then choose **Toggle Breakpoint** again. A red dot is displayed in the margin, and the breakpoint is immediately enabled.  
  
### To disable breakpoints from the development environment  
  
1.  In the C/AL Editor, place the cursor on the line of code that has an enabled breakpoint.  
  
2.  On the **Tools** menu, point to **Debugger**, and then choose **Toggle Breakpoint**. The red dot changes to a red unfilled circle, and the breakpoint is immediately disabled.  
  
### To delete breakpoints from the development environment  
  
1.  In the C/AL Editor, place the cursor on the line of code that has a disabled breakpoint.  
  
2.  On the **Tools** menu, point to **Debugger**, and then choose **Toggle Breakpoint**. The red unfilled circle disappears, and the breakpoint is immediately deleted.  
  
## See Also  
 [Breakpoints](Breakpoints.md)   
 [How to: Manage Breakpoints from the Debugger Code Viewer](How-to--Manage-Breakpoints-from-the-Debugger-Code-Viewer.md)   
 [How to: Manage Breakpoints from the Debugger Breakpoint List](How-to--Manage-Breakpoints-from-the-Debugger-Breakpoint-List.md)
