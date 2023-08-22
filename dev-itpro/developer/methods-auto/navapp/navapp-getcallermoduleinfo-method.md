---
title: "NavApp.GetCallerModuleInfo(var ModuleInfo) Method"
description: "Gets information about the extension that contains the method that called the currently running method."
ms.author: solsen
ms.custom: na
ms.date: 11/05/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp.GetCallerModuleInfo(var ModuleInfo) Method
> **Version**: _Available or changed with runtime version 6.0._

Gets information about the extension that contains the method that called the currently running method. For example, if method 1 (in extension A) calls method 2 (in extension B), which calls GetCallerModuleInfo, then GetCallerModuleInfo will return information about extension A.

> [!NOTE]
> From runtime version 8.0 and onward, this method is supported in Business Central online.

## Syntax
```AL
[Ok := ]  NavApp.GetCallerModuleInfo(var Info: ModuleInfo)
```
## Parameters
*Info*  
&emsp;Type: [ModuleInfo](../moduleinfo/moduleinfo-data-type.md)  
A value containing information about the calling application.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the information could be retrieved, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[NavApp Data Type](navapp-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)