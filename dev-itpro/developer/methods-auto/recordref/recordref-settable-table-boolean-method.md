---
title: "RecordRef.SetTable(Record, Boolean) Method"
description: "Sets the table to which a Record variable refers as the same table as a RecordRef variable."
ms.author: solsen
ms.custom: na
ms.date: 12/06/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.SetTable(Record, Boolean) Method
> **Version**: _Available or changed with runtime version 11.0._

Sets the table to which a Record variable refers as the same table as a RecordRef variable.


## Syntax
```AL
 RecordRef.SetTable(Rec: Record, ShareTable: Boolean)
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*Rec*  
&emsp;Type: [Record](../record/record-data-type.md)  
Specifies the Record that you want to refer to the table.  

*ShareTable*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the method copies filters, views, automatically calculated FlowFields, marks, fields, and keys of the record or creates a reference to a temporary record. If RecordRef and Record are both temporary and ShareTable is true, then the COPY method causes Record to reference the same table as RecordRef. If ShareTable is true, then both Record and RecordRef must be temporary; otherwise an error will occur. If you specify false, only filters, marks, and keys are copied.
        



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)