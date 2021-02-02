---
title: "JsonObject.AsToken Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# JsonObject.AsToken Method
> **Version**: _Available from runtime version 1.0._

Converts the value in a JsonObject to a JsonToken data type.


## Syntax
```
Token :=   JsonObject.AsToken()
```

## Parameters
*JsonObject*
&emsp;Type: [JsonObject](jsonobject-data-type.md)
An instance of the [JsonObject](jsonobject-data-type.md) data type.

## Return Value
*Token*
&emsp;Type: [JsonToken](../jsontoken/jsontoken-data-type.md)
The returned JsonToken contains the same data as the JsonObject, but allows for treating the data in a generic manner.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonObject Data Type](jsonobject-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)