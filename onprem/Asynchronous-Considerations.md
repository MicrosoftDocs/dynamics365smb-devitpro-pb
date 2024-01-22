---
title: "Asynchronous considerations"
ms.custom: na
ms.date: 12/29/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6c90376e-b86e-406d-880d-3cc905bf6527
caps.latest.revision: 6
---
# Asynchronous considerations
Writing control add-ins that work on all display targets, you have to consider some limitations regarding asynchronous communication. Compared to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] control add-in extensibility framework, the [!INCLUDE[navnow](includes/navnow_md.md)] framework has some limitations regarding the interface of the control add-in. The limitations come from the nature of the asynchronous communication between the clients and the [!INCLUDE[nav_server](includes/nav_server_md.md)]. All calls between the C/AL code running on the [!INCLUDE[nav_server](includes/nav_server_md.md)] and the script function running in the Web browser are asynchronous. This means that methods in the control add-in interface must be of type void and property methods shouldn't be used.  
  
 To transfer a result from a C/AL trigger to the calling script function, just add a method to the control add-in interface that the C/AL trigger can invoke to send the result to the script.  
  
 To transfer a result from a script function to C/AL trigger, just add an event to the control add-in interface that the script function can use to invoke a C/AL trigger that receives the result.  
  
## See also  
 [Extending Microsoft Dynamics NAV Using Control Add-ins](Extending-Microsoft-Dynamics-NAV-Using-Control-Add-ins.md)   
 [Walkthrough: Creating and Using a Client Control Add-in](Walkthrough--Creating-and-Using-a-Client-Control-Add-in.md)   
 [InvokeExtensibilityMethod Method](InvokeExtensibilityMethod-Method.md)   
 [GetImageResource Method](GetImageResource-Method.md)