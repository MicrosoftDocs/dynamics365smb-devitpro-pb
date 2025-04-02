---
title: "Date.ToText([Boolean]) Method"
description: "Converts the value to a text."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Date.ToText([Boolean]) Method
> **Version**: _Available or changed with runtime version 15.0._

Converts the value to a text. Equvilant to calling Format(value, 0, 0).


## Syntax
```AL
Text :=   Date.ToText([Invariant: Boolean])
```
## Parameters
*Date*  
&emsp;Type: [Date](date-data-type.md)  
An instance of the [Date](date-data-type.md) data type.  

*[Optional] Invariant*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If true, invariant formatting will be performed. Equvilant to calling Format(value, 0, 9).  


## Return Value
*Text*  
&emsp;Type: [Text](../text/text-data-type.md)  
The text representation of the value.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Date data type](date-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)