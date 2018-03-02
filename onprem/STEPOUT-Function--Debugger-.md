---
title: "STEPOUT Function (Debugger)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bd303217-ac93-436b-9f6f-b3cfa0f9032f
caps.latest.revision: 4
manager: edupont
---
# STEPOUT Function (Debugger)
Enables debugging to return to the calling function after it steps into a function call.  
  
## Syntax  
  
```  
[Ok :=] STEPOUT   
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the debugger returns to the calling function; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## See Also  
 [Breakpoints](Breakpoints.md)   
 [STEPOVER Function \(Debugger\)](STEPOVER-Function--Debugger-.md)   
 [STEPINTO Function \(Debugger\)](STEPINTO-Function--Debugger-.md)