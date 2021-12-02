---
title: "List.LastIndexOf(T) Method"
description: "Searches for the specified value and returns the one-based index of the last occurrence within the entire List."
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
# List.LastIndexOf(T) Method
> **Version**: _Available or changed with runtime version 1.0._

Searches for the specified value and returns the one-based index of the last occurrence within the entire List.


## Syntax
```AL
Index :=   List.LastIndexOf(Value: T)
```
## Parameters
*List*  
&emsp;Type: [List](list-data-type.md)  
An instance of the [List](list-data-type.md) data type.  

*Value*  
&emsp;Type: [T](list-data-type.md)  
The value to locate in the List.  


## Return Value
*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based index at which the value is found or 0 if the value does not exist in the List.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[List Data Type](list-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)