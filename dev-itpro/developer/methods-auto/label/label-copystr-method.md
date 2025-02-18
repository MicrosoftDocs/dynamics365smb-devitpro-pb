---
title: "Label.CopyStr(Text, Integer [, Integer]) Method"
description: "Copies a substring of any length from a specific position in a string (text or code) to a new string."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.CopyStr(Text, Integer [, Integer]) Method
> **Version**: _Available or changed with runtime version 15.0._

Copies a substring of any length from a specific position in a string (text or code) to a new string.


## Syntax
```AL
NewString :=   Label.CopyStr(String: Text, Position: Integer [, Length: Integer])
```
## Parameters
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string that you want to copy from.  

*Position*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The position of the first character to copy. If the value of Position is less than 1, then the COPYSTR function returns an error. If Position is greater than the length of the string, then the COPYSTR function returns an empty string.  

*[Optional] Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of characters to copy. If the value of Length is less than 0, then the COPYSTR function returns an error. If the value of Length causes Position + Length to be \> (total length of the string), then the result includes all the characters from Position to the end of the string. If you omit Length, then the resulting string includes all the characters from Position to the end of the string.  


## Return Value
*NewString*  
&emsp;Type: [Text](../text/text-data-type.md)  
The copied string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)