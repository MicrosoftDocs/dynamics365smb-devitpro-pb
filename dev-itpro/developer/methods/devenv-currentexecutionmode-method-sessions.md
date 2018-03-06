---
title: "CURRENTEXECUTIONMODE Method (Sessions)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8381d595-c371-4b95-b0f6-c66164976819
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CURRENTEXECUTIONMODE Method (Sessions)
Specifies the mode in which the session is running.  

## Syntax  

```  

ExecutionMode := CURRENTEXECUTIONMODE  
```  

## Property Value/Return Value  
 Type: ExecutionMode  

 The execution mode is one of the following:  

-   Debug  

-   Standard  

<!--NAV
## Remarks  
 If you start the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)] at a command prompt and use the –**debug** parameter, then the execution mode is **Debug**. Otherwise, the execution mode is **Standard**.  
-->

## Example  
 This example requires that you create a variable named Mode that has a DataType of ExecutionMode.  

```  
Mode := CURRENTEXECUTIONMODE;   
MESSAGE('Current execution mode is %1.', Mode);  
```  

## See Also  
 [Session Methods](devenv-session-methods.md)   
 <!--Links [Debugging](Debugging.md) -->
