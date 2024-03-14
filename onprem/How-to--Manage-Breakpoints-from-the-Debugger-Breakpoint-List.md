---
title: "How to: Manage Breakpoints from the Debugger Breakpoint List"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 41d743cb-9980-4985-a9b4-86e13232d3f8
caps.latest.revision: 19
---
# How to: Manage Breakpoints from the Debugger Breakpoint List
You use the debugger breakpoint list to view, set, enable, disable, or delete breakpoints.  
  
 For more information about how to open the **Debugger** window, see [Activating the Debugger](Activating-the-Debugger.md).  
  
> [!NOTE]  
>  If you set a breakpoint from the debugger, then it is not displayed in the C/AL Editor. If you enable, disable, or delete a breakpoint from the debugger, that change is not displayed in the C/AL Editor until you open the editor again.  
  
### To view breakpoints in the Debugger Breakpoint List window  
  
-   In the **Debugger** window, on the **Home** tab, in the **Breakpoints** group, choose **Breakpoints**.  
  
### To set a breakpoint in the Debugger Breakpoint List window  
  
1.  In the **Debugger Breakpoint List** window, in the **Object Type** column, select the object type from the drop-down list box.  
  
2.  In the **Object ID** column, select the object ID from the drop-down list box.  
  
3.  In the **Line No.** column, enter the line number on which you want to set a breakpoint. You can view the line number in the **Call Stack** FactBox on the **Debugger** window.  
  
4.  Verify that the **Enabled** column is selected.  
  
5.  Choose **OK**.  
  
6.  \(optional\) In the **Condition** column, enter a condition for the breakpoint. For more information, see [How to: Set Conditional Breakpoints](How-to--Set-Conditional-Breakpoints.md).  
  
### To enable or disable a single breakpoint in the Debugger Breakpoint List window  
  
-   In the **Debugger Breakpoint List** window, do one of the following:  
  
    -   In the **Enabled** column of the breakpoint list, select the check box to enable the breakpoint. Clear the check box to disable the breakpoint.  
  
    -   Select the breakpoint, and then on the **Home** tab, in the **Process** group, choose **Enable** or **Disable**.  
  
### To enable all breakpoints in the Debugger Breakpoint List window  
  
-   In the **Debugger Breakpoint List** window, on the **Home** tab, in the **Process** group, choose **Enable All**.  
  
### To disable all breakpoints  
  
-   Do one of the following:  
  
    -   In the **Debugger Breakpoint List** window, on the **Home** tab, in the **Process** group, choose **Disable All**.  
  
    -   In the **Debugger** window, on the **Home** tab, in the **Breakpoints** group, choose **Disable All**.  
  
### To delete a single breakpoint  
  
-   Do one of the following:  
  
    -   In the **Debugger** window, in the **Code** part, place the pointer on the line of code from which you want to delete a breakpoint. On the **Home** tab, in the **Breakpoints** group, choose **Toggle**.  
  
    -   In the **Debugger Breakpoint List** window, select the breakpoint in the list, and then on the **Home** tab, in the **Manage** group, choose **Delete**.  
  
### To delete all breakpoints  
  
1.  In the **Debugger** window, on the **Home** tab, in the **Breakpoints** group, choose **Breakpoints**.  
  
2.  In the **Debugger Breakpoint List** window, on the **Home** tab, in the **Process** group, choose **Delete All**.  
  
## See Also  
 [How to: Manage Breakpoints from the Debugger Code Viewer](How-to--Manage-Breakpoints-from-the-Debugger-Code-Viewer.md)   
 [How to: Manage Breakpoints from the Development Environment](How-to--Manage-Breakpoints-from-the-Development-Environment.md)   
 [How to: Break on the Next Statement](How-to--Break-on-the-Next-Statement.md)   
 [How to: Break on Errors](How-to--Break-on-Errors.md)   
 [How to: Set Conditional Breakpoints](How-to--Set-Conditional-Breakpoints.md)   
 [Breakpoints](Breakpoints.md)