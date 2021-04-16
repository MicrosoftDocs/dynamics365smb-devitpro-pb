---
title: "OnInsertRecordEvent (Page) Event Trigger"
ms.description: "Executed after the OnInsertRecord trigger, which is called before a record is inserted in a table."
ms.author: solsen
ms.custom: na
ms.date: 04/16/2021
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

# OnInsertRecordEvent (Page) Event Trigger
> **Version**: _Available or changed with runtime version 1.0._

Executed after the OnInsertRecord trigger, which is called before a record is inserted in a table.


## Syntax
```
trigger OnInsertRecordEvent(Rec: Record, BelowxRec: Boolean, xRec: Record, AllowInsert: Boolean)
begin
    ...
end;
```

### Parameters

*Rec*  
&emsp;Type: [Record](../../methods-auto/record/record-data-type.md)  
The table that raises the event.  

*BelowxRec*  
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
Specifies whether the new record was inserted after the last record in the table (xRec).  

*xRec*  
&emsp;Type: [Record](../../methods-auto/record/record-data-type.md)  
The table that raises the event.  

*AllowInsert*  
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
Specifies whether the OnInsertRecord trigger call was successful and the record can be modified. If this parameter is true, the code will be executed. If this parameter is false, then the code is not executed.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  