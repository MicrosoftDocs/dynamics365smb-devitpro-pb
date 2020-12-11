---
title: "JsonArray.RemoveAt Method"
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
# JsonArray.RemoveAt Method
> **Version**: _Available from runtime version 1.0._

Removes the token at the given index.


## Syntax
```
[Ok := ]  JsonArray.RemoveAt(Index: Integer)
```
## Parameters
*JsonArray*
&emsp;Type: [JsonArray](jsonarray-data-type.md)
An instance of the [JsonArray](jsonarray-data-type.md) data type.

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The position of the element that will be removed.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the read was successful; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
1. The operation will fail if the Index is smaller than 0 or (greater or equal) than JsonArray.Count.
2. Objects of type JsonArray represent a 0-based array.

## See Also
[JsonArray Data Type](jsonarray-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)