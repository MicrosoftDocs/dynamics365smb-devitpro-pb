---
title: "OnNewRecordEvent (Page) trigger event"
description: "Executed after the OnNewRecord trigger, which is called before a new record is initialized."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnNewRecordEvent (Page) trigger event
> **Version**: _Available or changed with runtime version 1.0._

Executed after the OnNewRecord trigger, which is called before a new record is initialized.


## Syntax
```AL
[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnNewRecordEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]
local procedure MyProcedure(var Rec: Record; BelowxRec: Boolean; var xRec: Record)
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



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Get Started with AL](../../../devenv-get-started.md)  
[Developing Extensions](../../../devenv-dev-overview.md)   