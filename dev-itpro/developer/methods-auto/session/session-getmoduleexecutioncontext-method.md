---
title: "Session.GetModuleExecutionContext Method"
description: "Gets the current session's execution context scoped to a specific module."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# Session.GetModuleExecutionContext Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the current session's execution context scoped to a specific module.


## Syntax
```
ExecutionContext :=   Session.GetModuleExecutionContext([AppId: Guid])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*[Optional] AppId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The application ID.  


## Return Value
*ExecutionContext*  
&emsp;Type: [ExecutionContext](../executioncontext/executioncontext-option.md)  
The current session's execution context scoped to a specific module.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)