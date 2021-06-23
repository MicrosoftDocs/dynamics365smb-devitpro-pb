---
title: "List.Set Method"
description: "Sets the element at the specified index."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# List.Set Method
> **Version**: _Available or changed with runtime version 1.0._

Sets the element at the specified index.


## Syntax
```AL
[Ok := ]  List.Set(Index: Integer, NewValue: T)
```
## Parameters
*List*  
&emsp;Type: [List](list-data-type.md)  
An instance of the [List](list-data-type.md) data type.  

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based index of the element to set.  
*NewValue*  
&emsp;Type: [T](list-data-type.md)  
The new value associated with the specified index.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the index was within the valid range, **false** otherwise. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[List Data Type](list-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)