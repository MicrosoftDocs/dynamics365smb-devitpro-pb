---
title: "TextConst.Substring(Integer [, Integer]) Method"
description: "Retrieves a substring from this instance."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TextConst.Substring(Integer [, Integer]) Method
> **Version**: _Available or changed with runtime version 15.1._

Retrieves a substring from this instance.


## Syntax
```AL
Substring :=   TextConst.Substring(StartIndex: Integer [, Count: Integer])
```
## Parameters
*TextConst*  
&emsp;Type: [TextConst](textconst-data-type.md)  
An instance of the [TextConst](textconst-data-type.md) data type.  

*StartIndex*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based starting character position of a substring in this instance.  

*[Optional] Count*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of characters in the substring.  


## Return Value
*Substring*  
&emsp;Type: [Text](../text/text-data-type.md)  
The substring extracted from this instance.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextConst data type](textconst-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)