---
title: "TextConst.Remove(Integer [, Integer]) Method"
description: "Returns a new Text in which a specified number of characters from the current string are deleted."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TextConst.Remove(Integer [, Integer]) Method
> **Version**: _Available or changed with runtime version 15.1._

Returns a new Text in which a specified number of characters from the current string are deleted.


## Syntax
```AL
Result :=   TextConst.Remove(StartIndex: Integer [, Count: Integer])
```
## Parameters
*TextConst*  
&emsp;Type: [TextConst](textconst-data-type.md)  
An instance of the [TextConst](textconst-data-type.md) data type.  

*StartIndex*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based position to begin deleting characters.  

*[Optional] Count*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of characters to delete.  


## Return Value
*Result*  
&emsp;Type: [Text](../text/text-data-type.md)  
The end result Text.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextConst data type](textconst-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)