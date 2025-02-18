---
title: "Label.InsStr(Text, Text, Integer) Method"
description: "Inserts a substring into a string."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.InsStr(Text, Text, Integer) Method
> **Version**: _Available or changed with runtime version 15.0._

Inserts a substring into a string.


## Syntax
```AL
NewString :=   Label.InsStr(String: Text, SubString: Text, Position: Integer)
```
## Parameters
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string into which you want to insert a substring.  

*SubString*  
&emsp;Type: [Text](../text/text-data-type.md)  
The substring that you want to insert into String.  

*Position*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies where to insert SubString. Position must be greater than or equal to 1. If Position is greater than the length of String, then the result is concatenated and copied to NewString.  


## Return Value
*NewString*  
&emsp;Type: [Text](../text/text-data-type.md)  
The input string including the specified substring


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)