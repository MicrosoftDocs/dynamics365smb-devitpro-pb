---
title: "JsonArray.IndexOf Method"
description: "Determines the index of a specific value in the JsonArray."
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
# JsonArray.IndexOf Method
> **Version**: _Available or changed with runtime version 1.0._

Determines the index of a specific value in the JsonArray.


## Syntax
```
Index :=   JsonArray.IndexOf(Value: Char)
```
## Parameters
*JsonArray*  
&emsp;Type: [JsonArray](jsonarray-data-type.md)  
An instance of the [JsonArray](jsonarray-data-type.md) data type.

*Value*  
&emsp;Type: [Char](../char/char-data-type.md)  
  


## Return Value
*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The position of the value in the JsonArray. -1 will be returned if Value cannot be found in the array.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonArray Data Type](jsonarray-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)