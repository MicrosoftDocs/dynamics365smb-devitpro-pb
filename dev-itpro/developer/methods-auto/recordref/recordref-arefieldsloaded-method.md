---
title: "RecordRef.AreFieldsLoaded Method"
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
# RecordRef.AreFieldsLoaded Method
Checks whether the specified fields are all initially loaded.


## Syntax
```
Ok :=   RecordRef.AreFieldsLoaded(Fields: Integer,...)
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*Fields*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The FieldNo's of the fields to check.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if all the fields specified by the Fields parameter are currently loaded; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method is part of the partial records capability for improving performance. For more information, see [Using Partial Records](../../devenv-partial-records.md).

## See Also

[Using Partial Records](../../devenv-partial-records.md)  
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)