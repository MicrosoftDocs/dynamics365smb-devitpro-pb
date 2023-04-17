---
title: Break on Record Changes
description: Specify if the debugger breaks on record changes. If it is set to break on record changes, then it breaks before creating, modifying, or deleting a record.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4a443cec-f31c-4c74-a9e5-5be8d6ca9cc0
caps.latest.revision: 7
---
# How to Break on Record Changes in Dynamics NAV
You can specify if the debugger breaks on record changes. If the debugger is set to break on record changes, then it breaks before creating, modifying, or deleting a record. The following table shows each record change and the C/AL functions that cause each change.  
  
|Record change|C/AL functions|  
|-------------------|---------------------|  
|Create a new record|[INSERT Function \(Record\)](INSERT-Function--Record-.md)|  
|Update an existing record|[MODIFY Function \(Record\)](MODIFY-Function--Record-.md), [MODIFYALL Function \(Record\)](MODIFYALL-Function--Record-.md), [RENAME Function \(Record\)](RENAME-Function--Record-.md)|  
|Delete an existing record|[DELETE Function \(Record\)](DELETE-Function--Record-.md), [DELETEALL Function \(Record\)](DELETEALL-Function--Record-.md)|  
  
 By default, the debugger is not set to break on record changes.  
  
 For more information about how to open the **Debugger** window, see [Activating the Debugger](Activating-the-Debugger.md).  
  
### To break on record changes  
  
1.  In the **Debugger** window, on the **Home** tab, in the **Breakpoints** group, choose **Break Rules**.  
  
2.  In the **Debugger Break Rules** window, select the **Break On Record Changes** check box, and then choose the **OK** button.  
  
## See Also  
 [How to: Manage Breakpoints from the Development Environment](How-to--Manage-Breakpoints-from-the-Development-Environment.md)   
 [How to: Manage Breakpoints from the Debugger Breakpoint List](How-to--Manage-Breakpoints-from-the-Debugger-Breakpoint-List.md)   
 [How to: Break on the Next Statement](How-to--Break-on-the-Next-Statement.md)   
 [How to: Break on Errors](How-to--Break-on-Errors.md)   
 [How to: Set Conditional Breakpoints](How-to--Set-Conditional-Breakpoints.md)   
 [Breakpoints](Breakpoints.md)
