---
title: "Label.DelChr(Text [, Text] [, Text]) Method"
description: "Deletes chars contained in the which parameter in a string based on the contents on the where parameter."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.DelChr(Text [, Text] [, Text]) Method
> **Version**: _Available or changed with runtime version 15.0._

Deletes chars contained in the which parameter in a string based on the contents on the where parameter. If the where parameter contains an equal-sign, then all occurrences of characters in which is deleted from the current value. If the where parameter contains a less-than, then the characters are only deleted when they are first in the string. If the where parameter contains a greater-than, then the characters are only deleted when they are the last in the string. If the where parameter contains any other char, an exception is thrown. If the where parameter or the which parameter is empty, the source is returned unmodified. The which parameter is to be considered as an array of chars to delete where the order does not matter.


## Syntax
```AL
NewString :=   Label.DelChr(String: Text [, Where: Text] [, Which: Text])
```
## Parameters
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
The input string.  

*[Optional] Where*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies where to delete characters.  

*[Optional] Which*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies the characters that you want to delete.  


## Return Value
*NewString*  
&emsp;Type: [Text](../text/text-data-type.md)  
The end result String.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)