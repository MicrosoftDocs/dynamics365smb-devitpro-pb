---
title: "RecordRef.LoadFields Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.LoadFields Method
Accesses the table's corresponding data source and loads the values of the specified fields on the record.


## Syntax
```
[Ok := ]  RecordRef.LoadFields(Fields: Integer,...)
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*Fields*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The FieldNo's of the fields to be loaded.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if all values were loaded on the record; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method will trigger a JIT load, but allows for triggering the JIT load on multiple fields. If the fields are already loaded, another load will not be triggered.

This method is part of the partial records capability for improving performance. For more information, see [Using Partial Records](../../devenv-partial-records.md).

## See Also

[Using Partial Records](../../devenv-partial-records.md)  
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)