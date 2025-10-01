---
title: "RecordRef.FieldExist(Text) Method"
description: "Determines if the field that has the name FieldName exists in the table that is referred to by the RecordRef."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.FieldExist(Text) Method
> **Version**: _Available or changed with runtime version 16.0._

Determines if the field that has the name FieldName exists in the table that is referred to by the RecordRef. Returns an error if no table is currently selected.


## Syntax
```AL
Exist :=   RecordRef.FieldExist(FieldName: Text)
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*FieldName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The FieldName that you want to know whether it exists in the table.  


## Return Value
*Exist*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the field exists; otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RecordRef data type](recordref-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)