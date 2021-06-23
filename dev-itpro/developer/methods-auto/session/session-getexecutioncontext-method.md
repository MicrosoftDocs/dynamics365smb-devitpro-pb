---
title: "Session.GetExecutionContext Method"
description: "Gets the current session's execution context."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# Session.GetExecutionContext Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the current session's execution context.


## Syntax
```AL
ExecutionContext :=   Session.GetExecutionContext()
```
> [!NOTE]
> This method can be invoked using property access syntax.
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
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)