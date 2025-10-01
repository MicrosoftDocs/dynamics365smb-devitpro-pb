---
title: "TextConst.TrimEnd([Text]) Method"
description: "Removes all trailing occurrences of a set of characters specified in an array from the current Text object."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TextConst.TrimEnd([Text]) Method
> **Version**: _Available or changed with runtime version 15.1._

Removes all trailing occurrences of a set of characters specified in an array from the current Text object.


## Syntax
```AL
Result :=   TextConst.TrimEnd([Chars: Text])
```
## Parameters
*TextConst*  
&emsp;Type: [TextConst](textconst-data-type.md)  
An instance of the [TextConst](textconst-data-type.md) data type.  

*[Optional] Chars*  
&emsp;Type: [Text](../text/text-data-type.md)  
A string containing the characters to remove.  


## Return Value
*Result*  
&emsp;Type: [Text](../text/text-data-type.md)  
A copy of this string without all trailing occurrences of the characters specified in the *Chars* parameter.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextConst data type](textconst-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)