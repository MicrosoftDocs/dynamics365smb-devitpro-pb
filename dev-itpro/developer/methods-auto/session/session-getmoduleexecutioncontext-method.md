---
title: "Session.GetModuleExecutionContext Method"
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
# Session.GetModuleExecutionContext Method
> **Version**: _Available from runtime version 1.0._

Gets the current session's execution context scoped to a specific module.


## Syntax
```
ExecutionContext :=   Session.GetModuleExecutionContext([AppId: Guid])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*AppId*  
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