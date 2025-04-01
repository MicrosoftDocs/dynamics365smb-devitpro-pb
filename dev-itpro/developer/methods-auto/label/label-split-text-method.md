---
title: "Label.Split([Text,...]) Method"
description: "Splits a string into a maximum number of substrings based on a collection of separators."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.Split([Text,...]) Method
> **Version**: _Available or changed with runtime version 15.0._

Splits a string into a maximum number of substrings based on a collection of separators.


## Syntax
```AL
Result :=   Label.Split([Separators: Text,...])
```
## Parameters
*Label*  
&emsp;Type: [Label](label-data-type.md)  
An instance of the [Label](label-data-type.md) data type.  

*[Optional] Separators*  
&emsp;Type: [Text](../text/text-data-type.md)  
A collection of separators that delimit the substrings in this string.  


## Return Value
*Result*  
&emsp;Type: [List of [Text]](../list/list-data-type.md)  
The collection of substrings from the original string based on the collection of separators.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)