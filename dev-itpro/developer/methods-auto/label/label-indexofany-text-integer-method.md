---
title: "Label.IndexOfAny(Text [, Integer]) Method"
description: "Reports the one-based index of the first occurrence of the specified string in this instance."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.IndexOfAny(Text [, Integer]) Method
> **Version**: _Available or changed with runtime version 15.0._

Reports the one-based index of the first occurrence of the specified string in this instance. The search starts at a specified character position.


## Syntax
```AL
Index :=   Label.IndexOfAny(Values: Text [, StartIndex: Integer])
```
## Parameters
*Label*  
&emsp;Type: [Label](label-data-type.md)  
An instance of the [Label](label-data-type.md) data type.  

*Values*  
&emsp;Type: [Text](../text/text-data-type.md)  
The collection of characters to seek.  

*[Optional] StartIndex*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based search starting position.  


## Return Value
*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based index of the first occurrence of the specified string in this instance. If the index returned is 0, the value is not present in the string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)