---
title: "OnAfterActionEvent (Page) Trigger Event"
description: "Executed after the OnAction trigger, which is called when a user selects an action on the page."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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

# OnAfterActionEvent (Page) Trigger Event
> **Version**: _Available or changed with runtime version 1.0._

Executed after the OnAction trigger, which is called when a user selects an action on the page.


## Syntax
```AL
[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnAfterActionEvent', '<Action Name>', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]
local procedure MyProcedure(Rec: Record)
begin
    ...
end;
```

### Parameters

*Rec*  
&emsp;Type: [Record](../../../methods-auto/record/record-data-type.md)  
The table that raises the event.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../../devenv-get-started.md)  
[Developing Extensions](../../../devenv-dev-overview.md)   