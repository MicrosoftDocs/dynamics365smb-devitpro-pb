---
title: "STEPOVER Method (Debugger)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 06c982d7-04f9-420b-9cc2-a92e8f1d76a5
caps.latest.revision: 4
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# STEPOVER Method (Debugger)
Executes a method call and then stops at the first line outside the method call.  
  
## Syntax  
  
```  
[Ok :=] STEPOVER   
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the debugger steps over a method call; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## See Also  
<!--Links [Breakpoints](Breakpoints.md) -->  
 [STEPINTO Method \(Debugger\)](devenv-STEPINTO-Method-Debugger.md)   
 [STEPOUT Method \(Debugger\)](devenv-STEPOUT-Method-Debugger.md)