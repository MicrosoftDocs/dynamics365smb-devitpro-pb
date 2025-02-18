---
title: "Label.Remove(Integer [, Integer]) Method"
description: "Returns a new Text in which a specified number of characters from the current string are deleted."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.Remove(Integer [, Integer]) Method
> **Version**: _Available or changed with runtime version 15.0._

Returns a new Text in which a specified number of characters from the current string are deleted.


## Syntax
```AL
Result :=   Label.Remove(StartIndex: Integer [, Count: Integer])
```
## Parameters
*Label*  
&emsp;Type: [Label](label-data-type.md)  
An instance of the [Label](label-data-type.md) data type.  

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
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)