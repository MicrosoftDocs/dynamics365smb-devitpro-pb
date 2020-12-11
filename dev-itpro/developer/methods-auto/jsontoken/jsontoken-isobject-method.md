---
title: "JsonToken.IsObject Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# JsonToken.IsObject Method
> **Version**: _Available from runtime version 1.0._

Indicates whether a JsonToken contains a JSON object.


## Syntax
```
Ok :=   JsonToken.IsObject()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*JsonToken*
&emsp;Type: [JsonToken](jsontoken-data-type.md)
An instance of the [JsonToken](jsontoken-data-type.md) data type.

## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the JsonToken represents a JSON object; otherwise, **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonToken Data Type](jsontoken-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)