---
title: "JsonArray.Insert Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# JsonArray.Insert Method
> **Version**: _Available or changed with runtime version 1.0._

Inserts the value at the given index in the array while shifting all the values to the right by one position.


## Syntax
```
[Ok := ]  JsonArray.Insert(Index: Integer, Value: DateTime)
```
## Parameters
*JsonArray*
&emsp;Type: [JsonArray](jsonarray-data-type.md)
An instance of the [JsonArray](jsonarray-data-type.md) data type.

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
  
*Value*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the read was successful; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonArray Data Type](jsonarray-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)