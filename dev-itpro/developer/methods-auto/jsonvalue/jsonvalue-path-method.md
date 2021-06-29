---
title: "JsonValue.Path Method"
description: "Retrieves the JSON path of the value relative to its containing tree."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonValue.Path Method
> **Version**: _Available or changed with runtime version 1.0._

Retrieves the JSON path of the value relative to its containing tree.


## Syntax
```
Path :=   JsonValue.Path()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*JsonValue*  
&emsp;Type: [JsonValue](jsonvalue-data-type.md)  
An instance of the [JsonValue](jsonvalue-data-type.md) data type.  

## Return Value
*Path*  
&emsp;Type: [String](../string/string-data-type.md)  
The path of the value relative to its containing JSON tree. If the object is the root of the JSON tree, the path will be empty.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonValue Data Type](jsonvalue-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)