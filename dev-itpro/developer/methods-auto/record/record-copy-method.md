---
title: "Record.Copy(Record [, Boolean]) Method"
description: "Copies a specified record's filters, views, automatically calculated FlowFields, marks, fields, and keys that are associated with the record from a table or creates a reference to a record."
ms.author: solsen
ms.custom: na
ms.date: 08/18/2021
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
# Record.Copy(Record [, Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Copies a specified record's filters, views, automatically calculated FlowFields, marks, fields, and keys that are associated with the record from a table or creates a reference to a record.


## Syntax
```AL
 Record.Copy(FromRecord: Record [, ShareTable: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*FromRecord*  
&emsp;Type: [Record](record-data-type.md)  
The record to copy.
          
*[Optional] ShareTable*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the method copies filters, views, automatically calculated FlowFields, marks, fields, and keys of the record or creates a reference to a temporary record. If FromRecord and Record are both temporary and ShareTable is true, then the COPY method causes Record to reference the same table as FromRecord. If ShareTable is true, then both Record and FromRecord must be temporary; otherwise an error will occur. The default value is false. If you specify false, only filters, marks, and keys are copied.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example
 The following example copies a record to another record in the **Customer** table. The [GET Function \(Record\)](GET-Function--Record-.md) retrieves record number 30000 from the **Customer** table and stores record in the sourceRecord variable. The **COPY** function copies the record that is stored in the sourceRecord to the destRecord. The *ShareTable* parameter is set to **true** because the [Temporary Property](Temporary-Property.md) for the both sourceRecord and destRecord are set to **Yes** to make the records temporary. If the record is copied, then a message indicating that the record is copied is displayed in a message box. Otherwise, a message indicating that the record is not copied is displayed. This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)