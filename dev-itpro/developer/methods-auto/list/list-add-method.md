---
title: "List.Add(T) Method"
description: "Adds a value to the end of the List."
ms.author: solsen
ms.date: 08/15/2024
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# List.Add(T) Method
> **Version**: _Available or changed with runtime version 1.0._

Adds a value to the end of the List.


## Syntax
```AL
 List.Add(Value: T)
```
## Parameters
*List*  
&emsp;Type: [List](list-data-type.md)  
An instance of the [List](list-data-type.md) data type.  

*Value*  
&emsp;Type: [T](list-data-type.md)  
The value to be added to the end of the List.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The type `T` is a dynamic type. When `List` is of type `Text` then `T` will change to `Text`. When `List` is of type `Integer`, then `T` will change to `Integer`.

## See Also

[List Data Type](list-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)