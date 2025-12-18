---
title: "TextConst.Replace(Text, Text) Method"
description: "Returns a new Text in which all occurrences of a specified string in the current instance are replaced with another specified string."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TextConst.Replace(Text, Text) Method
> **Version**: _Available or changed with runtime version 15.1._

Returns a new Text in which all occurrences of a specified string in the current instance are replaced with another specified string.


## Syntax
```AL
Result :=   TextConst.Replace(OldValue: Text, NewValue: Text)
```
## Parameters
*TextConst*  
&emsp;Type: [TextConst](textconst-data-type.md)  
An instance of the [TextConst](textconst-data-type.md) data type.  

*OldValue*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string to be replaced.  

*NewValue*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string to replace all occurrences of OldValue.  


## Return Value
*Result*  
&emsp;Type: [Text](../text/text-data-type.md)  
The end result Text.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextConst data type](textconst-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)