---
title: "RecordRef.Open(Text [, Boolean] [, Text]) Method"
description: "Causes a RecordRef variable to refer to a table, which is identified by its number in a particular company."
ms.author: solsen
ms.date: 03/11/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.Open(Text [, Boolean] [, Text]) Method
> **Version**: _Available or changed with runtime version 17.0._

Causes a RecordRef variable to refer to a table, which is identified by its number in a particular company.


## Syntax
```AL
 RecordRef.Open(FullyQualifiedName: Text [, Temp: Boolean] [, CompanyName: Text])
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*FullyQualifiedName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The fully qualified name of the table.  

*[Optional] Temp*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  

*[Optional] CompanyName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The name of the company to which you want to change. If you omit this parameter, the current company is used.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RecordRef data type](recordref-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)