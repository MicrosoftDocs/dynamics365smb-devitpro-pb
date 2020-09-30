---
title: "JsonObject.Path Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# JsonObject.Path Method
Retrieves the JSON path of the object relative to the root of its containing tree.


## Syntax
```
Path :=   JsonObject.Path()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
An instance of the [JsonObject](jsonobject-data-type.md) data type.  

## Return Value
*Path*  
&emsp;Type: [String](../string/string-data-type.md)  
The path of the object relative to its containing JSON tree. If the object is the root of the JSON tree, the path will be empty.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonObject Data Type](jsonobject-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)