---
title: "How to: Manage Breakpoints from the Debugger Code Viewer"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6c16aab5-df22-4af4-a215-beff55b67c8e
caps.latest.revision: 11
---
# How to: Manage Breakpoints from the Debugger Code Viewer
You can view, set, enable, disable, or delete breakpoints directly in the **Code** part of the **Debugger** window.  
  
 For more information about how to open the **Debugger** window, see [Activating the Debugger](Activating-the-Debugger.md).  
  
> [!NOTE]  
>  If you set a breakpoint from the debugger, then it is not displayed in the C/AL Editor. If you enable, disable, or delete a breakpoint from the debugger, that change is not displayed in the C/AL Editor until you open the editor again.  
  
### To view breakpoints in the code viewer  
  
-   In the **Debugger** window, in the code viewer, breakpoints are displayed in the margin. An enabled breakpoint is identified by a red dot. A disabled breakpoint is identified by an unfilled red circle.  
  
### To set a breakpoint in the code viewer  
  
-   In the **Debugger** window, in the code viewer, do one of the following:  
  
    -   Place the cursor on the line of code on which you want to set a breakpoint, and then on the **Home** tab, in the **Breakpoints** group, choose **Toggle**.  
  
         A red dot is displayed in the margin of the code, and the breakpoint is immediately enabled.  
  
    -   Choose the margin to the left of the line of code on which you want to set a breakpoint.  
  
         A red dot is displayed in the margin of the code, and the breakpoint is immediately enabled.  
  
### To enable a single breakpoint in the code viewer  
  
-   In the **Debugger** window, in the code viewer, do one of the following:  
  
    -   Place the cursor on the line of code that has a disabled breakpoint, and then on the **Home** tab, in the **Breakpoints** group, choose **Toggle**.  
  
         The unfilled red circle changes to a red dot, and the breakpoint is immediately enabled.  
  
    -   Choose the unfilled red circle in the margin to the left of the line of code with the disabled breakpoint.  
  
         The unfilled red circle changes to a red dot, and the breakpoint is immediately enabled.  
  
### To disable all breakpoints in the code viewer  
  
-   In the **Debugger** window, on the **Home** tab, in the **Breakpoints** group, choose **Disable All**. All breakpoints, including breakpoints in other codeunits that are not currently displayed in the code viewer, are immediately disabled.  
  
### To delete a single breakpoint in the code viewer  
  
-   In the **Debugger** window, in the code viewer, do one of the following:  
  
    -   Place the cursor on the line of code that has an enabled breakpoint, and then on the **Home** tab, in the **Breakpoints** group, choose **Toggle**.  
  
    -   Choose the red dot in the margin to the left of the line of code with the enabled breakpoint.  
  
## See Also  
 [How to: Manage Breakpoints from the Development Environment](How-to--Manage-Breakpoints-from-the-Development-Environment.md)   
 [How to: Manage Breakpoints from the Debugger Breakpoint List](How-to--Manage-Breakpoints-from-the-Debugger-Breakpoint-List.md)   
 [How to: Break on the Next Statement](How-to--Break-on-the-Next-Statement.md)   
 [How to: Break on Errors](How-to--Break-on-Errors.md)   
 [Breakpoints](Breakpoints.md)
