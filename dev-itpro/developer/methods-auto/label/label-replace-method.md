---
title: "Label.Replace(Text, Text) Method"
description: "Returns a new Text in which all occurrences of a specified string in the current instance are replaced with another specified string."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.Replace(Text, Text) Method
> **Version**: _Available or changed with runtime version 15.0._

Returns a new Text in which all occurrences of a specified string in the current instance are replaced with another specified string.


## Syntax
```AL
Result :=   Label.Replace(OldValue: Text, NewValue: Text)
```
## Parameters
*Label*  
&emsp;Type: [Label](label-data-type.md)  
An instance of the [Label](label-data-type.md) data type.  

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
## Related information
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)