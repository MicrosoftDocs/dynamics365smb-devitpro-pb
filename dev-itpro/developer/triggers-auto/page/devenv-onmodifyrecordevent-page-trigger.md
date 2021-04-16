---
title: "OnModifyRecordEvent (Page) Event Trigger"
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

# OnModifyRecordEvent (Page) Event Trigger
> **Version**: _Available or changed with runtime version 1.0._

Executed after the OnModifyRecord trigger, which is called before a record is modified in a table.


## Syntax
```
trigger OnModifyRecordEvent(Rec: Record, xRec: Record, AllowModify: Boolean)
begin
    ...
end;
```

### Parameters

*Rec*  
&emsp;Type: [Record](../../methods-auto/record/record-data-type.md)  
The table that raises the event.  

*xRec*  
&emsp;Type: [Record](../../methods-auto/record/record-data-type.md)  
The table that raises the event.  

*AllowModify*  
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
Specifies whether the OnModifyRecord trigger call was successful and the record can be modified. If this parameter is true, the code will be executed. If this parameter is false, then the code is not executed.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  