---
title: "NavApp.ListResources(Guid [, Text]) Method"
description: "Gets an optionally filtered list of public resources from the specified app."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp.ListResources(Guid [, Text]) Method
> **Version**: _Available or changed with runtime version 18.0._

Gets an optionally filtered list of public resources from the specified app.


## Syntax
```AL
Result :=   NavApp.ListResources(AppId: Guid [, Filter: Text])
```
## Parameters
*AppId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The ID of the app from which to list public resources.  

*[Optional] Filter*  
&emsp;Type: [Text](../text/text-data-type.md)  
Wildcard based filter to filter resource names by. If not provided, all public resources are listed.  


## Return Value
*Result*  
&emsp;Type: [List of [Text]](../list/list-data-type.md)  
The list of public resources from the specified app, filtered by the given pattern if provided.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[NavApp data type](navapp-data-type.md)  
[Adding and accessing resources in Business Central extensions](../../devenv-app-resources.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)