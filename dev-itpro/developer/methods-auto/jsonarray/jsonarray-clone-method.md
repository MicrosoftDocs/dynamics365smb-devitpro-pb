---
title: "JsonArray.Clone() Method"
description: "Creates a deep-copy of the JsonArray value."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# JsonArray.Clone() Method
> **Version**: _Available or changed with runtime version 1.0._

Creates a deep-copy of the JsonArray value.


## Syntax
```AL
Clone :=   JsonArray.Clone()
```

## Parameters
*JsonArray*  
&emsp;Type: [JsonArray](jsonarray-data-type.md)  
An instance of the [JsonArray](jsonarray-data-type.md) data type.  

## Return Value
*Clone*  
&emsp;Type: [JsonToken](../jsontoken/jsontoken-data-type.md)  
The Result will be a full, deep-copy of the Value.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonArray Data Type](jsonarray-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)