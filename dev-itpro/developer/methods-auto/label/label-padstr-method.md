---
title: "Label.PadStr(Text, Integer [, Text]) Method"
description: "Changes the length of a string to a specified length."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.PadStr(Text, Integer [, Text]) Method
> **Version**: _Available or changed with runtime version 15.0._

Changes the length of a string to a specified length. If the string is shorter than the specified length, length spaces are added at the end of the string to match the length. If the string is longer than the specified length, the string is truncated. If the specified length is less than 0, an exception is thrown.


## Syntax
```AL
NewString :=   Label.PadStr(String: Text, Length: Integer [, FillCharacter: Text])
```
## Parameters
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string that you want to increase or decrease.  

*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The new length of the output string. If Length is less than the length of String, then String is truncated. Otherwise String is expanded with filler characters. If Length is less than 0, then an error is returned.  

*[Optional] FillCharacter*  
&emsp;Type: [Text](../text/text-data-type.md)  
This is a string of length 1. This character is used to fill empty spaces at the end of the output string. If not specified, spaces are used as default. If the length of FillCharacter is not 1, an error is returned.  


## Return Value
*NewString*  
&emsp;Type: [Text](../text/text-data-type.md)  
A copy of the string with the expected length.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)