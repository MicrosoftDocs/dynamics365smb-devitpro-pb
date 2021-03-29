---
title: "System.GetLastErrorCallStack Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.GetLastErrorCallStack Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the call stack from where the last error occurred.


## Syntax
```
String :=   System.GetLastErrorCallStack()
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*String*
&emsp;Type: [String](../string/string-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks

For some errors, such as divide by zero errors and overflow errors, **GetLastErrorCallStack** does not return every call in the stack. To get the complete call stack for these types of errors, use the debugger and specify that you want to break on errors. On the **Debugger** page, in the **Call Stack** FactBox, you can view all the method calls that led to the error. 
 
<!-- Links For more information, see [How to: Break on Errors](How-to-Break-on-Errors.md). --> 
  
## Example  

In this example, an error occurs in codeunit 50003. The text of the Message includes a call to the GetLastErrorCallStack method.  
  
```al
// Codeunit 50001, TestErrors1  
// OnRun trigger  
Error('Some error message')  
  
// Codeunit 50002, TestErrors2  
// OnRun trigger  
ClearLastError;  
if not Codeunit.Run(50001) then  
  Message('The call stack for the last error is:\' + GetLastErrorCallStack);  
  
```  

When you run codeunit 50002, the message window displays the following:  
  
**The call stack for the last error is:**  
  
**TestErrors1\(CodeUnit 50001\).OnRun\(Trigger\) line 1**  
  
**TestErrors2\(CodeUnit 50002\).OnRun\(Trigger\) line 2**  
  
## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)