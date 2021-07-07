---
title: "Record.TransferFields(var Record, Boolean, Boolean) Method"
description: "Copies all matching fields in one record to another record."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.TransferFields(var Record, Boolean, Boolean) Method
> **Version**: _Available or changed with runtime version 4.2._

Copies all matching fields in one record to another record.


## Syntax
```AL
 Record.TransferFields(var FromRecord: Record, InitPrimaryKeyFields: Boolean, SkipFieldsNotMatchingType: Boolean)
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*FromRecord*  
&emsp;Type: [Record](record-data-type.md)  
The record from which to copy.  
*InitPrimaryKeyFields*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Default: true
        If this parameter is true and the records are in the same table, both the timestamp and the Primary Key fields of the destination record will be changed.
        If this parameter is true and the records are not in the same table, then the Primary Key fields of the destination record will be changed but the timestamp of the destination record will not be changed.
        If this parameter is false, then neither the timestamp nor the Primary Key fields of the destination record are changed.
        
*SkipFieldsNotMatchingType*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether fields where the field type on the source record do not match the field type on the target record should be ignored.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)