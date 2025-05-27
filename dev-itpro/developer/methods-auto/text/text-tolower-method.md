---
title: "Text.ToLower() Method"
description: "Returns a copy of this string converted to lowercase."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Text.ToLower() Method
> **Version**: _Available or changed with runtime version 1.0._

Returns a copy of this string converted to lowercase.


## Syntax
```AL
Result :=   Text.ToLower()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Text*  
&emsp;Type: [Text](text-data-type.md)  
An instance of the [Text](text-data-type.md) data type.  

## Return Value
*Result*  
&emsp;Type: [Text](text-data-type.md)  
A copy of this string converted to lowercase.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The Text.ToLower method performs a culture-invariant transformation to lowercase. This guarantees consistent results regardless of the application's cultural context, which is particularly useful in scenarios requiring predictable string manipulation.
For culture-variant method check [Text.LowerCase(Text)](./text-lowercase-method.md)

## Related information
[Text Data Type](text-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
