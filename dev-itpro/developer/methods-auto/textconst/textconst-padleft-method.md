---
title: "TextConst.PadLeft(Integer [, Char]) Method"
description: "Returns a new Text that right-aligns the characters in this instance by padding them on the left, for a specified total length."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TextConst.PadLeft(Integer [, Char]) Method
> **Version**: _Available or changed with runtime version 15.1._

Returns a new Text that right-aligns the characters in this instance by padding them on the left, for a specified total length.


## Syntax
```AL
Result :=   TextConst.PadLeft(Count: Integer [, Char: Char])
```
## Parameters
*TextConst*  
&emsp;Type: [TextConst](textconst-data-type.md)  
An instance of the [TextConst](textconst-data-type.md) data type.  

*Count*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of characters in the resulting string, equal to the number of original characters plus any additional padding characters.  

*[Optional] Char*  
&emsp;Type: [Char](../char/char-data-type.md)  
A padding character.  


## Return Value
*Result*  
&emsp;Type: [Text](../text/text-data-type.md)  
The end result Text.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextConst data type](textconst-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)