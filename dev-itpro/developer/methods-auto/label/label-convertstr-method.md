---
title: "Label.ConvertStr(Text, Text, Text) Method"
description: "Replaces all chars in source found in FromCharacters with the corresponding char in ToCharacters and returns the converted string."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.ConvertStr(Text, Text, Text) Method
> **Version**: _Available or changed with runtime version 15.0._

Replaces all chars in source found in FromCharacters with the corresponding char in ToCharacters and returns the converted string. If the length of the FromCharacters parameter and the ToChars parameter are different, an exception is thrown. If the parameter FromCharacters or the parameter ToChars is empty, the source is returned unmodified. Each element in source is only converted ONCE a double-replacement cannot happen.


## Syntax
```AL
NewString :=   Label.ConvertStr(String: Text, FromCharacters: Text, ToCharacters: Text)
```
## Parameters
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string that you want to convert.  

*FromCharacters*  
&emsp;Type: [Text](../text/text-data-type.md)  
The characters that you want to replace. This function is case-sensitive.  

*ToCharacters*  
&emsp;Type: [Text](../text/text-data-type.md)  
The new characters with which you want to replace the FromCharacters. This function is case-sensitive.  


## Return Value
*NewString*  
&emsp;Type: [Text](../text/text-data-type.md)  
The input string with the converted characters.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)