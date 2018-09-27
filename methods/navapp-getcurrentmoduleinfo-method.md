---
title: "GetCurrentModuleInfo Method"
ms.author: solsen
ms.custom: na
ms.date: 09/27/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# GetCurrentModuleInfo Method
Gets information about the application that contains the AL object that is currently running.

## Syntax
```
[Ok := ]  NavApp.GetCurrentModuleInfo(var Info: ModuleInfo)
```
## Parameters
*Info*  
&emsp;Type: [ModuleInfo](moduleinfo-data-type.md)  
A value containing information about the currently running application.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if the information could be retrieved, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[NavApp Data Type](navapp-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)