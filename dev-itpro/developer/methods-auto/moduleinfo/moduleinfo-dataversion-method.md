---
title: "ModuleInfo.DataVersion() Method"
description: "Gets the version of the specified application's data in the context of a given tenant."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ModuleInfo.DataVersion() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the version of the specified application's data in the context of a given tenant. This indicates the last version that was installed or successfully upgraded to and will not match the application version if the tenant is in a data upgrade pending state.


## Syntax
```AL
DataVersion :=   ModuleInfo.DataVersion()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ModuleInfo*  
&emsp;Type: [ModuleInfo](moduleinfo-data-type.md)  
An instance of the [ModuleInfo](moduleinfo-data-type.md) data type.  

## Return Value
*DataVersion*  
&emsp;Type: [Version](../version/version-data-type.md)  
The version


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[ModuleInfo Data Type](moduleinfo-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)