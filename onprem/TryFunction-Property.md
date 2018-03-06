---
title: "TryFunction Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 71d0080e-a02c-4545-8bb3-299ad80b1db8
caps.latest.revision: 4
manager: edupont
---
# TryFunction Property
Specifies the function to be try function, which can be used to catch and handle errors and exceptions that occur when code is run.  
  
## Applies to  
 C/AL functions.  
  
> [!NOTE]  
>  In test and upgrade codeunits, this property only applies to normal functions as specified by the [FunctionType Property \(Test Codeunits\)](FunctionType-Property--Test-Codeunits-.md) or [FunctionType Property \(Upgrade Codeunits\)](FunctionType-Property--Upgrade-Codeunits-.md).  
  
## Remarks  
 Try functions in C/AL enable you to handle errors that occur in the application during code execution. For example, with try functions, you can provide more user-friendly error messages to the end user than those thrown by the system. You can use try functions to catch errors/exceptions that thrown by [!INCLUDE[navnow](includes/navnow_md.md)] or exceptions that are thrown during .NET Framework interoperability operations.  
  
 For more information, see [Handling Errors by Using Try Functions](Handling-Errors-by-Using-Try-Functions.md).  
  
## See Also  
 [C/AL Function Statements](C-AL-Function-Statements.md)