---
title: "DEACTIVATE Function (Debugger)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 84593610-5a5f-4ad0-bc74-139acaf43f99
caps.latest.revision: 3
manager: edupont
---
# DEACTIVATE Function (Debugger)
Deactivates the debugger.  
  
## Syntax  
  
```  
[Ok :=] DEACTIVATE  
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the debugger is deactivated successfully; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## See Also  
 [Activating the Debugger](Activating-the-Debugger.md)   
 [ACTIVATE Function \(Debugger\)](ACTIVATE-Function--Debugger-.md)