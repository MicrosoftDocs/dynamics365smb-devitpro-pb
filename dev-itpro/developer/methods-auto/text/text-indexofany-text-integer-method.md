---
title: "Text.IndexOfAny(Text [, Integer]) Method"
description: "Reports the one-based index of the first occurrence of the specified string in this instance."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Text.IndexOfAny(Text [, Integer]) Method
> **Version**: _Available or changed with runtime version 1.0._

Reports the one-based index of the first occurrence of the specified string in this instance. The search starts at a specified character position.


## Syntax
```AL
Index :=   Text.IndexOfAny(Values: Text [, StartIndex: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Text*  
&emsp;Type: [Text](text-data-type.md)  
An instance of the [Text](text-data-type.md) data type.  

*Values*  
&emsp;Type: [Text](text-data-type.md)  
The collection of characters to seek.  

*[Optional] StartIndex*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based search starting position.  


## Return Value
*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based index of the first occurrence of the specified string in this instance. If the index returned is 0, the value is not present in the string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Text Data Type](text-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)