---
title: "Debugger.SkipSystemTriggers Method"
description: "Enables the debugger to skip code that is inside system triggers."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# Debugger.SkipSystemTriggers Method
> **Version**: _Available or changed with runtime version 1.0 until version 4.0 where it was deprecated._

Enables the debugger to skip code that is inside system triggers.


## Syntax
```
[Ok := ]  Debugger.SkipSystemTriggers(Ok: Boolean)
```
## Parameters
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if the debugger should skip system triggers.
        


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

If you omit this optional return value and if the break is not set successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.

## See Also
[Debugger Data Type](debugger-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)