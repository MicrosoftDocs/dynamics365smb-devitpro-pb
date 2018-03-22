---
title: "STEPINTO Method (Debugger)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 63acfb1d-c14e-42a5-87fe-7ed401324647
caps.latest.revision: 4
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# STEPINTO Method (Debugger)
Executes a method call and then stops at the first line of code inside the method.  
  
## Syntax  
  
```  
[Ok :=] STEPINTO   
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the debugger executes a method call; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## See Also  
 [STEPOVER Method \(Debugger\)](devenv-STEPOVER-Method-Debugger.md)   
 [STEPOUT Method \(Debugger\)](devenv-STEPOUT-Method-Debugger.md)   
 <!--Links [Breakpoints](Breakpoints.md)-->