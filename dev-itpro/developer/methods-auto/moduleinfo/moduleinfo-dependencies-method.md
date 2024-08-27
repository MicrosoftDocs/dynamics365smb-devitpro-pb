---
title: "ModuleInfo.Dependencies() Method"
description: "Gets the collection of application dependencies."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ModuleInfo.Dependencies() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the collection of application dependencies.


## Syntax
```AL
Dependencies :=   ModuleInfo.Dependencies()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ModuleInfo*  
&emsp;Type: [ModuleInfo](moduleinfo-data-type.md)  
An instance of the [ModuleInfo](moduleinfo-data-type.md) data type.  

## Return Value
*Dependencies*  
&emsp;Type: [List of [ModuleDependencyInfo]](../list/list-data-type.md)  
Collection of application dependencies.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[ModuleInfo Data Type](moduleinfo-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)