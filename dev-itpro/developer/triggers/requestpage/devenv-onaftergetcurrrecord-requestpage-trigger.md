---
title: "OnAfterGetCurrRecord (Request Page) Trigger"
description: "Runs after the current record is retrieved from the table."
ms.author: solsen
ms.custom: na
ms.date: 04/27/2021
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

# OnAfterGetCurrRecord (Request Page) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after the current record is retrieved from the table.


## Syntax
```
trigger OnAfterGetCurrRecord()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

In a page with a repeater control, the trigger is only called when the current record in the repeater is updated. **OnAfterGetCurrRecord** is called directly after all **OnAfterGetRecord** triggers are called for each row in a list.  

If there is an error in the trigger code, then the page is closed.  

> [!IMPORTANT]  
> For pages of the type `Card`, `List`, `ListPlus`, `Document`, or `Worksheet`, the **OnAfterGetCurrRecord** trigger is called more than once if the page is opened in the edit mode and does not have any records to display. If the page is opened in the view mode or displays a record, the trigger is called only once.

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnAfterGetCurrRecord (Page) Trigger](../page/devenv-onaftergetcurrrecord-page-trigger.md)  
[OnAfterGetCurrRecord (Request Page Extension) Trigger](../requestpageextension/devenv-onaftergetcurrrecord-requestpageextension-trigger.md)  
[OnAfterGetCurrRecord (Page Extension) Trigger](../pageextension/devenv-onaftergetcurrrecord-pageextension-trigger.md)
