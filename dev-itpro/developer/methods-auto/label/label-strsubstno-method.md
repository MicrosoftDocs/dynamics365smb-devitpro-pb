---
title: "Label.StrSubstNo(Text [, Any,...]) Method"
description: "Replaces %1, %2, %3..."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.StrSubstNo(Text [, Any,...]) Method
> **Version**: _Available or changed with runtime version 15.0._

Replaces %1, %2, %3... and #1, #2, #3... fields in a string with the values you provide as optional parameters.


## Syntax
```AL
NewString :=   Label.StrSubstNo(String: Text [, Value1: Any,...])
```
## Parameters
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
A string containing '#' and/or '%' fields.  

*[Optional] Value1*  
&emsp;Type: [Any](../any/any-data-type.md)  
One or more values (expressions) that you want to insert into String. You can specify up to 10 values.  


## Return Value
*NewString*  
&emsp;Type: [Text](../text/text-data-type.md)  
Returns a new string with the provided values inserted into the specified string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)