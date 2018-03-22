---
title: "CONTINUE Method (Debugger)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 586b4a42-f4dc-4bd8-87fb-535477ac58ba
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CONTINUE Method (Debugger)
Executes code until the next breakpoint or until execution ends.  
  
## Syntax  
  
```  
[Ok :=] CONTINUE   
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **True** if code executes until the next breakpoint or until execution ends; otherwise, **false**.  
  
 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
<!--  
## See Also  
 [Breakpoints](Breakpoints.md) -->