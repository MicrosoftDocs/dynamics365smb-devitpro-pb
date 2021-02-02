---
title: "List.Get Method"
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
# List.Get Method
> **Version**: _Available from runtime version 1.0._

Gets the element at the specified index. This method will raise an error if the index is outside the valid range.


## Syntax
```
Result :=   List.Get(Index: Integer)
```
## Parameters
*List*
&emsp;Type: [List](list-data-type.md)
An instance of the [List](list-data-type.md) data type.

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based index of the element to get.  


## Return Value
*Result*
&emsp;Type: [T](list-data-type.md)
The element at the specified index.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[List Data Type](list-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)