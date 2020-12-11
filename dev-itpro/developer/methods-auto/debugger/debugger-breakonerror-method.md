---
title: "Debugger.BreakOnError Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Debugger.BreakOnError Method
> **Version**: _Available from runtime version 1.0 until version 4.0 where it was deprecated._

Sets whether the debugger breaks on errors.


## Syntax
```
[Ok := ]  Debugger.BreakOnError(Ok: Boolean)
```
## Parameters
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the debugger breaks on errors.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## Remarks  
 The debugger must be attached to a session when you run the BREAKONERROR method.  
  
## Example  
 This example shows how to implement the code for an action on a page that sets the break on error setting to **true**. You can use this code example in the OnAction trigger of that action. This code example requires that you create a Boolean variable named *Value*.  
  
```  
Value := true;  
DEBUGGER.BREAKONERROR(Value);  
  
```  

## See Also
[Debugger Data Type](debugger-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)