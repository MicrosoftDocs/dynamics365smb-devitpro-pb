---
title: "OnInsertRecordEvent (Page) trigger event"
description: "Executed after the OnInsertRecord trigger, which is called before a record is inserted in a table."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnInsertRecordEvent (Page) trigger event
> **Version**: _Available or changed with runtime version 1.0._

Executed after the OnInsertRecord trigger, which is called before a record is inserted in a table.


## Syntax
```AL
[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnInsertRecordEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]
local procedure MyProcedure(var Rec: Record; BelowxRec: Boolean; var xRec: Record; var AllowInsert: Boolean)
begin
    ...
end;
```

### Parameters

*Rec*  
&emsp;Type: [Record](../../../methods-auto/record/record-data-type.md)  
The table that raises the event.  

*BelowxRec*  
&emsp;Type: [Boolean](../../../methods-auto/boolean/boolean-data-type.md)  
Specifies whether the new record was inserted after the last record in the table (xRec).  

*xRec*  
&emsp;Type: [Record](../../../methods-auto/record/record-data-type.md)  
The table that raises the event.  

*AllowInsert*  
&emsp;Type: [Boolean](../../../methods-auto/boolean/boolean-data-type.md)  
Specifies whether the OnInsertRecord trigger call was successful and the record can be modified. If this parameter is true, the code will be executed. If this parameter is false, then the code is not executed.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Get Started with AL](../../../devenv-get-started.md)  
[Developing Extensions](../../../devenv-dev-overview.md)   