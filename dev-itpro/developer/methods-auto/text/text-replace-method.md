---
title: "Text.Replace(Text, Text) Method"
description: "Returns a new Text in which all occurrences of a specified string in the current instance are replaced with another specified string."
ms.author: solsen
ms.custom: na
ms.date: 07/11/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Text.Replace(Text, Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Returns a new Text in which all occurrences of a specified string in the current instance are replaced with another specified string.


## Syntax
```AL
Result :=   Text.Replace(OldValue: Text, NewValue: Text)
```
## Parameters
*Text*  
&emsp;Type: [Text](text-data-type.md)  
An instance of the [Text](text-data-type.md) data type.  

*OldValue*  
&emsp;Type: [Text](text-data-type.md)  
The string to be replaced.  

*NewValue*  
&emsp;Type: [Text](text-data-type.md)  
The string to replace all occurrences of OldValue.  


## Return Value
*Result*  
&emsp;Type: [Text](text-data-type.md)  
The end result Text.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Text Data Type](text-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)