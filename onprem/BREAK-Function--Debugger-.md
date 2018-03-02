---
title: "BREAK Function (Debugger)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e0b2c3ac-950b-44f5-a291-268ab70d8a96
caps.latest.revision: 6
manager: edupont
---
# BREAK Function (Debugger)
Breaks code execution of a debugging session.  
  
## Syntax  
  
```  
[Ok :=] BREAK   
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if a breakpoint is set in the debugging session; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## See Also  
 [Breakpoints](Breakpoints.md)   
 [How to: Break on the Next Statement](How-to--Break-on-the-Next-Statement.md)   
 [How to: Manage Breakpoints from the Development Environment](How-to--Manage-Breakpoints-from-the-Development-Environment.md)