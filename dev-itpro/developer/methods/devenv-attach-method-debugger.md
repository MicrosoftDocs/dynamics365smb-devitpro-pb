---
title: "ATTACH Method (Debugger)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: af94252b-2c76-48a0-8303-e5109622b8b5
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ATTACH Method (Debugger)
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

-   [!INCLUDE[d365fin_long](../includes/d365fin_long_md.md)]  

-   NAS services session  

-   SOAP web services client session  

-   OData web services client session  

-   Background session  

## Property Value/Return Value  
 Type: Boolean  

 **True** if the debugger is attached to a session; otherwise, **false**.  

 If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  

## Remarks  
 The **ATTACH** method behaves like the **Debug** action on the **Sessions** page.  

 You can call the **ATTACH** method<!--NAV or the [ACTIVATE Method \(Debugger\)](devenv-ACTIVATE-Method-Debugger.md)--> to activate the debugger.  
<!--Links
## See Also  
 [Activating the Debugger](Activating-the-Debugger.md)  
-->