---
title: "JsonToken.AsArray Method"
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
# JsonToken.AsArray Method
> **Version**: _Available from runtime version 1.0._

Converts the value in a JsonToken to a JsonArray data type.


## Syntax
```
Array :=   JsonToken.AsArray()
```

## Parameters
*JsonToken*
&emsp;Type: [JsonToken](jsontoken-data-type.md)
An instance of the [JsonToken](jsontoken-data-type.md) data type.

## Return Value
*Array*
&emsp;Type: [JsonArray](../jsonarray/jsonarray-data-type.md)
The returned JsonArray contains the same data as the JsonToken, but allows array-specific operations to be performed on it.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonToken Data Type](jsontoken-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)