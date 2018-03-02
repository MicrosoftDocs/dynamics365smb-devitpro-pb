---
title: "STEPOVER Function (Debugger)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 06c982d7-04f9-420b-9cc2-a92e8f1d76a5
caps.latest.revision: 4
manager: edupont
---
# STEPOVER Function (Debugger)
Executes a function call and then stops at the first line outside the function call.  
  
## Syntax  
  
```  
[Ok :=] STEPOVER   
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the debugger steps over a function call; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## See Also  
 [Breakpoints](Breakpoints.md)   
 [STEPINTO Function \(Debugger\)](STEPINTO-Function--Debugger-.md)   
 [STEPOUT Function \(Debugger\)](STEPOUT-Function--Debugger-.md)