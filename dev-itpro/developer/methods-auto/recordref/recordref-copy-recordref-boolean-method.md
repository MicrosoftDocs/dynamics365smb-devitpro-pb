---
title: "RecordRef.Copy(RecordRef [, Boolean]) Method"
description: "Copies a specified record referece's filters, views, automatically calculated FlowFields, marks, fields, and keys that are associated with the record from a table or creates a reference to a record."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.Copy(RecordRef [, Boolean]) Method
> **Version**: _Available or changed with runtime version 5.3._

Copies a specified record referece's filters, views, automatically calculated FlowFields, marks, fields, and keys that are associated with the record from a table or creates a reference to a record.


## Syntax
```AL
 RecordRef.Copy(FromRecordRef: RecordRef [, ShareTable: Boolean])
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*FromRecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
The record reference to copy.  

*[Optional] ShareTable*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the method copies filters, views, automatically calculated FlowFields, marks, fields, and keys of the record or creates a reference to a temporary record. If FromRecord and Record are both temporary and ShareTable is true, then the COPY method causes Record to reference the same table as FromRecord. If ShareTable is true, then both Record and FromRecord must be temporary; otherwise an error will occur. The default value is false. If you specify false, only filters, marks, and keys are copied.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[RecordRef Data Type](recordref-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)