---
title: "Label.SelectStr(Integer, Text) Method"
description: "Retrieves a substring from a comma-separated string."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.SelectStr(Integer, Text) Method
> **Version**: _Available or changed with runtime version 15.0._

Retrieves a substring from a comma-separated string.


## Syntax
```AL
NewString :=   Label.SelectStr(Number: Integer, CommaString: Text)
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies which substring to retrieve. The substrings in the comma-separated string are numbered 1, 2, 3, and so on. If Number is greater than the actual number of substrings, then a run-time error occurs.  

*CommaString*  
&emsp;Type: [Text](../text/text-data-type.md)  
A string that contains substrings separated by commas. The maximum length of this string is 391 characters.  


## Return Value
*NewString*  
&emsp;Type: [Text](../text/text-data-type.md)  
The substring from the comma-separated string at the index specified.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)