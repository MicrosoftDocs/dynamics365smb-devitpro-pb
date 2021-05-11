---
title: "JsonToken.AsValue Method"
description: "Converts the value in a JsonToken to a JsonValue data type."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# JsonToken.AsValue Method
> **Version**: _Available or changed with runtime version 1.0._

Converts the value in a JsonToken to a JsonValue data type.


## Syntax
```
Value :=   JsonToken.AsValue()
```

## Parameters
*JsonToken*  
&emsp;Type: [JsonToken](jsontoken-data-type.md)  
An instance of the [JsonToken](jsontoken-data-type.md) data type.

## Return Value
*Value*  
&emsp;Type: [JsonValue](../jsonvalue/jsonvalue-data-type.md)  
The returned JsonValue contains the same data as the JsonToken, but allows value-specific operations to be performed on the data.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonToken Data Type](jsontoken-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)