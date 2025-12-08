---
title: "RecordRef.Field(Integer) Method"
description: "Gets a FieldRef for the field that has the number FieldNo in the table that is currently selected."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.Field(Integer) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a FieldRef for the field that has the number FieldNo in the table that is currently selected. If no field has this number, the method returns an error.


## Syntax
```AL
Field :=   RecordRef.Field(FieldNo: Integer)
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*FieldNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number that the field has in the table that is currently selected. This is the field for which you want the FieldRef.  


## Return Value
*Field*  
&emsp;Type: [FieldRef](../fieldref/fieldref-data-type.md)  
A new FieldRef of the record


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RecordRef data type](recordref-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)