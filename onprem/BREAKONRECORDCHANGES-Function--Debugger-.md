---
title: "BREAKONRECORDCHANGES Function (Debugger)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5f0cd768-4b6f-4c11-a10a-c67972521916
caps.latest.revision: 4
manager: edupont
---
# BREAKONRECORDCHANGES Function (Debugger)
Breaks execution before a change to a record occurs.  
  
## Syntax  
  
```  
[Ok :=] BREAKONRECORDCHANGES(Ok)   
```  
  
#### Parameters  
 *Ok*  
 Type: Boolean  
  
 Specifies whether the debugger should break execution when a change to a record occurs.  
  
 If *Ok* is true, then the debugger breaks before creating, updating, or deleting a record.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the debugger breaks when a change occurs in a record; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## See Also  
 [Breakpoints](Breakpoints.md)   
 [BREAK Function \(Debugger\)](BREAK-Function--Debugger-.md)