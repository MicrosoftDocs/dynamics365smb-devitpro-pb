---
title: "GetModuleInfo Method"
ms.author: solsen
ms.custom: na
ms.date: 08/07/2018
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
# GetModuleInfo Method


## Syntax
```
[Result := ]  NavApp.GetModuleInfo(AppId: Guid, var Info: ModuleInfo)
```
## Parameters
*AppId*  
&emsp;Type: [Guid](guid-data-type.md)  
  
*Info*  
&emsp;Type: [ModuleInfo](moduleinfo-data-type.md)  
  


## Return Value
*Result*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[NavApp Data Type](navapp-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)