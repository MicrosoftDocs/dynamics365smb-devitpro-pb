---
title: "STEPOUT Method (Debugger)"
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-business-central
ms.assetid: bd303217-ac93-436b-9f6f-b3cfa0f9032f
caps.latest.revision: 4
manager: edupont
redirect_url: /dynamics365/business-central/dev-itpro/developer/methods-auto/library
---

 

# STEPOUT Method (Debugger)
Enables debugging to return to the calling method after it steps into a method call.  
  
## Syntax  
  
```  
[Ok :=] STEPOUT   
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **True** if the debugger returns to the calling method; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## See Also  
[STEPOVER Method \(Debugger\)](devenv-STEPOVER-Method-Debugger.md)   
[STEPINTO Method \(Debugger\)](devenv-STEPINTO-Method-Debugger.md)  
<!--  [Breakpoints](Breakpoints.md)  -->