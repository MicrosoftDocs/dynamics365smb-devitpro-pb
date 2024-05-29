---
title: "List.AddRange(List of [T]) Method"
description: "Adds the elements of the specified collection to the end of the list."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# List.AddRange(List of [T]) Method
> **Version**: _Available or changed with runtime version 1.0._

Adds the elements of the specified collection to the end of the list.


## Syntax
```AL
 List.AddRange(Values: List of [T])
```
## Parameters
*List*  
&emsp;Type: [List](list-data-type.md)  
An instance of the [List](list-data-type.md) data type.  

*Values*  
&emsp;Type: [List of [T]](list-data-type.md)  
The collection whose elements should be added to the end of the List.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The type `T` is a dynamic type. When `List` is of type `Text` then `T` will change to `Text`. When `List` is of type `Integer`, then `T` will change to `Integer`.

## See Also
[List Data Type](list-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)