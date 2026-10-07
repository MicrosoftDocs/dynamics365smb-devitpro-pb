---
title: "NavApp.ListAppsWithPublicResources([Text]) Method"
description: "Gets the IDs of apps that expose public resources matching the optional filter."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp.ListAppsWithPublicResources([Text]) Method
> **Version**: _Available or changed with runtime version 18.0._

Gets the IDs of apps that expose public resources matching the optional filter.


## Syntax
```AL
Result :=   NavApp.ListAppsWithPublicResources([Filter: Text])
```
## Parameters
*[Optional] Filter*  
&emsp;Type: [Text](../text/text-data-type.md)  
Wildcard based filter to match public resource names. If not provided, apps with any public resources are listed.  


## Return Value
*Result*  
&emsp;Type: [List of [Guid]](../list/list-data-type.md)  
The IDs of apps that expose matching public resources.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[NavApp data type](navapp-data-type.md)  
[Adding and accessing resources in Business Central extensions](../../devenv-app-resources.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)