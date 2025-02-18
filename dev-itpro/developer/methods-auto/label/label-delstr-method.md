---
title: "Label.DelStr(Text, Integer [, Integer]) Method"
description: "Deletes a substring inside a string (text or code)."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.DelStr(Text, Integer [, Integer]) Method
> **Version**: _Available or changed with runtime version 15.0._

Deletes a substring inside a string (text or code).


## Syntax
```AL
NewString :=   Label.DelStr(String: Text, Position: Integer [, Length: Integer])
```
## Parameters
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
The input string.  

*Position*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The position of the first character that you want to delete. Position must be greater than zero (0). If Position exceeds the length of String, DELSTR returns the original string, unchanged.  

*[Optional] Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies how many characters to delete. Length must be greater than zero (0).  


## Return Value
*NewString*  
&emsp;Type: [Text](../text/text-data-type.md)  
The input string without the specified substring.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)