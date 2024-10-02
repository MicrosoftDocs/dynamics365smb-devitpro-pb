---
title: "NavApp.GetCallerCallstackModuleInfos() Method"
description: "Gets information about extensions on the callstack that contain the method, which called the currently running method."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp.GetCallerCallstackModuleInfos() Method
> **Version**: _Available or changed with runtime version 14.0._

Gets information about extensions on the callstack that contain the method, which called the currently running method. For example, if method 1 (in extension A) calls method 2 (in extension B) calls method 3 (in extension C), which calls GetCallerModuleInfo, then GetCallerModuleInfo will return information about extension A and B.


## Syntax
```AL
ModuleInfos :=   NavApp.GetCallerCallstackModuleInfos()
```

## Return Value
*ModuleInfos*  
&emsp;Type: [List of [ModuleInfo]](../list/list-data-type.md)  
The unique set of application information.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[NavApp Data Type](navapp-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)