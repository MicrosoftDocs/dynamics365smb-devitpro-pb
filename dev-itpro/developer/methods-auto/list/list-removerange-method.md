---
title: "List.RemoveRange Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# List.RemoveRange Method
> **Version**: _Available or changed with runtime version 1.0._

Removes a range of elements from the List.


## Syntax
```
[Ok := ]  List.RemoveRange(Index: Integer, Count: Integer)
```
## Parameters
*List*
&emsp;Type: [List](list-data-type.md)
An instance of the [List](list-data-type.md) data type.

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based starting index of the range of elements to remove.
        
*Count*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of elements to remove.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the range is a valid range, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[List Data Type](list-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)