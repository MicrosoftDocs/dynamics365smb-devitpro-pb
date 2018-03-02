---
title: "GETLASTERRORCALLSTACK Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 47ec219e-3af8-4b5d-a9ec-ca618b130e3e
caps.latest.revision: 11
manager: edupont
---
# GETLASTERRORCALLSTACK Function
Gets the call stack from where the last error occurred.  
  
## Syntax  
  
```  
  
String := GETLASTERRORCALLSTACK  
```  
  
## Property Value/Return Value  
 Type: Text  
  
 A text string that contains the call stack from where the error occurred.  
  
 The format of the string is:  
  
 \<*codeunit name*>\(Codeunit \<*number*>\).\<*function name*> line \<*line number*>\\\[\<*calling codeunit name*>\(Codeunit \<*number*>\).\<*calling function name*> line \<*line number*>\\...\]  
  
 The string cannot exceed the maximum string length that is specified in [!INCLUDE[navnow](includes/navnow_md.md)], which is 1,024 characters.  
  
 If no error has occurred, then the function returns an empty string.  
  
## Remarks  
 For some errors, such as divide by zero errors and overflow errors, **GETLASTERRORCALLSTACK** does not return every call in the stack. To get the complete call stack for these types of errors, use the debugger and specify that you want to break on errors. On the **Debugger** page, in the **Call Stack** FactBox, you can view all the function calls that led to the error. For more information, see [How to: Break on Errors](How-to--Break-on-Errors.md).  
  
## Example  
 In this example, an error occurs in codeunit 50003. The text of the MESSAGE includes a call to the GETLASTERRORCALLSTACK function.  
  
```  
// Codeunit 50001, TestErrors1  
// OnRun trigger  
ERROR('Some error message')  
  
// Codeunit 50002, TestErrors2  
// OnRun trigger  
CLEARLASTERROR;  
IF NOT Codeunit.RUN(50001) THEN  
  MESSAGE('The call stack for the last error is:\' + GETLASTERRORCALLSTACK);  
  
```  
  
 When you run codeunit 50002, the message window displays the following:  
  
 **The call stack for the last error is:**  
  
 **TestErrors1\(CodeUnit 50001\).OnRun\(Trigger\) line 1**  
  
 **TestErrors2\(CodeUnit 50002\).OnRun\(Trigger\) line 2**  
  
## See Also  
 <!-- [Error Handling](Error-Handling.md) -->