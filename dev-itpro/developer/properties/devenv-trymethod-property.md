---
title: "TryMethod Property"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 71d0080e-a02c-4545-8bb3-299ad80b1db8
caps.latest.revision: 4
author: SusanneWindfeldPedersen
---

 

# TryMethod Property
Specifies the method to be try method, which can be used to catch and handle errors and exceptions that occur when code is run.  
  
## Applies to  
 AL Methods.  
  
> [!NOTE]  
>  In test and upgrade codeunits, this property only applies to normal methods as specified by the [MethodType Property \(Test Codeunits\)](devenv-methodtype-property-test-codeunits.md) or [MethodType Property \(Upgrade Codeunits\)](devenv-methodtype-property-upgrade-codeunits.md).  
  
## Remarks  
 Try methods in AL enable you to handle errors that occur in the application during code execution. For example, with try methods, you can provide more user-friendly error messages to the end user than those thrown by the system. You can use try methods to catch errors/exceptions that thrown by [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] or exceptions that are thrown during .NET Framework interoperability operations.  
<!-- 
For more information, see [Handling Errors by Using Try Methods](../methods/devenv-Handling-Errors-by-Using-Try-Methods.md).  
-->  
## See Also  
[Essential AL Methods](../devenv-essential-al-methods.md)  
[Properties](devenv-properties.md)