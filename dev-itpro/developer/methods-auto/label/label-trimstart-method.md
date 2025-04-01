---
title: "Label.TrimStart([Text]) Method"
description: "Removes all leading occurrences of a set of characters specified in an array from the current Text object."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.TrimStart([Text]) Method
> **Version**: _Available or changed with runtime version 15.0._

Removes all leading occurrences of a set of characters specified in an array from the current Text object.


## Syntax
```AL
Result :=   Label.TrimStart([Chars: Text])
```
## Parameters
*Label*  
&emsp;Type: [Label](label-data-type.md)  
An instance of the [Label](label-data-type.md) data type.  

*[Optional] Chars*  
&emsp;Type: [Text](../text/text-data-type.md)  
A string containing the characters to remove.  


## Return Value
*Result*  
&emsp;Type: [Text](../text/text-data-type.md)  
A copy of this string without all leading occurrences of the characters specified in the *Chars* parameter.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)