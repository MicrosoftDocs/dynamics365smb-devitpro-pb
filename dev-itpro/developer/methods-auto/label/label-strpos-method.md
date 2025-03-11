---
title: "Label.StrPos(Text, Text) Method"
description: "Searches for the first occurrence of substring inside a string."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.StrPos(Text, Text) Method
> **Version**: _Available or changed with runtime version 15.0._

Searches for the first occurrence of substring inside a string.


## Syntax
```AL
Position :=   Label.StrPos(String: Text, SubString: Text)
```
## Parameters
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
The string in which you want to search.  

*SubString*  
&emsp;Type: [Text](../text/text-data-type.md)  
The substring for which you want to search.  


## Return Value
*Position*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based index of the first occurrence of the substring inside the string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)