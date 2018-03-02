---
title: "STOP Method (Debugger)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 1e7dad68-bd57-4952-a36d-ed6eabec093b
caps.latest.revision: 4
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# STOP Method (Debugger)
Stops execution as if the code hits an error.  
  
## Syntax  
  
```  
[Ok :=] STOP   
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the debugger stops execution; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## See Also  
 [Debugger Methods](devenv-debugger-methods.md)   
 <!--Links [Walkthrough: Debugging the Microsoft Dynamics NAV Windows Client](Walkthrough--Debugging-the-Microsoft-Dynamics-NAV-Windows-Client.md)-->