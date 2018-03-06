---
title: "ATTACH Function (Debugger)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: af94252b-2c76-48a0-8303-e5109622b8b5
caps.latest.revision: 9
manager: edupont
---
# ATTACH Function (Debugger)
Activates the debugger and attaches it to the specified session.  
  
## Syntax  
  
```  
[Ok :=] ATTACH(SessionID)   
```  
  
#### Parameters  
 *SessionID*  
 Type: Integer  
  
 The ID of the session that you want to attach the debugger to.  
  
 The session can be any of the following:  
  
-   [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  
  
-   [!INCLUDE[nav_web](includes/nav_web_md.md)]  
  
-   NAS services session  
  
-   SOAP web services client session  
  
-   OData web services client session  
  
-   Background session  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the debugger is attached to a session; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## Remarks  
 The **ATTACH** function behaves like the **Debug** action on the **Sessions** page.  
  
 You can call either the **ATTACH** function or the [ACTIVATE Function \(Debugger\)](ACTIVATE-Function--Debugger-.md) to activate the debugger.  
  
## See Also  
 [Activating the Debugger](Activating-the-Debugger.md)