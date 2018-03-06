---
title: "STEPINTO Function (Debugger)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 63acfb1d-c14e-42a5-87fe-7ed401324647
caps.latest.revision: 4
manager: edupont
---
# STEPINTO Function (Debugger)
Executes a function call and then stops at the first line of code inside the function.  
  
## Syntax  
  
```  
[Ok :=] STEPINTO   
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the debugger executes a function call; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## See Also  
 [STEPOVER Function \(Debugger\)](STEPOVER-Function--Debugger-.md)   
 [STEPOUT Function \(Debugger\)](STEPOUT-Function--Debugger-.md)   
 [Breakpoints](Breakpoints.md)