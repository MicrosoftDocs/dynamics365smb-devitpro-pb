---
title: "NavApp.ListResources([Text]) Method"
description: "Gets an optionally filtered list of resources packaged with this app."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp.ListResources([Text]) Method
> **Version**: _Available or changed with runtime version 14.1._

Gets an optionally filtered list of resources packaged with this app.


## Syntax
```AL
Result :=   NavApp.ListResources([Filter: Text])
```
## Parameters
*[Optional] Filter*  
&emsp;Type: [Text](../text/text-data-type.md)  
Wildcard based filter to filter resource names by. If not provided, all resources are listed.  


## Return Value
*Result*  
&emsp;Type: [List of [Text]](../list/list-data-type.md)  
The list of resources, filtered by the given pattern if provided.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[NavApp data type](navapp-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)