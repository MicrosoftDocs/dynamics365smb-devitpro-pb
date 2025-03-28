---
title: "OnAfterModifyEvent (Table) trigger event"
description: "Executed after a record is modified in a table."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnAfterModifyEvent (Table) trigger event
> **Version**: _Available or changed with runtime version 1.0._

Executed after a record is modified in a table.


## Syntax
```AL
[EventSubscriber(ObjectType::Table, Database::<Table Name>, 'OnAfterModifyEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]
local procedure MyProcedure(var Rec: Record; var xRec: Record; RunTrigger: Boolean)
begin
    ...
end;
```

### Parameters

*Rec*  
&emsp;Type: [Record](../../../methods-auto/record/record-data-type.md)  
The table that raises the event.  

*xRec*  
&emsp;Type: [Record](../../../methods-auto/record/record-data-type.md)  
The table that raises the event.  

*RunTrigger*  
&emsp;Type: [Boolean](../../../methods-auto/boolean/boolean-data-type.md)  
Specifies whether to execute the code in the event trigger when it is invoked. If this parameter is true, the code will be executed. If this parameter is false, then the code is not executed.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Get Started with AL](../../../devenv-get-started.md)  
[Developing Extensions](../../../devenv-dev-overview.md)   