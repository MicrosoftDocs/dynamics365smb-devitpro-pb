---
title: "Session.GetExecutionContext() Method"
description: "Gets the current session's execution context."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Session.GetExecutionContext() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the current session's execution context.


## Syntax
```AL
ExecutionContext :=   Session.GetExecutionContext()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.

## Return Value
*ExecutionContext*  
&emsp;Type: [ExecutionContext](../executioncontext/executioncontext-option.md)  
The current session's execution context.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
For an example of when and how to run the `GetExecutionContext` method, see [Protecting sensitive code from running during upgrade](../../devenv-upgrading-extensions.md#protecting-sensitive-code-from-running-during-upgrade).

## See Also
[Session Data Type](session-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)