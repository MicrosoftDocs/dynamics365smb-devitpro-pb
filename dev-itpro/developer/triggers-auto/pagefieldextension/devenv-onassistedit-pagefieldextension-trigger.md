---
title: "OnAssistEdit (Page Field Extension) trigger"
description: "Runs in place of the AssistEdit property features that are provided in the application."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnAssistEdit (Page Field Extension) trigger
> **Version**: _Available or changed with runtime version 3.0._

Runs in place of the AssistEdit property features that are provided in the application.


## Syntax
```AL
trigger OnAssistEdit()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> The trigger is not invoked on a page that is in view mode<!--NAV in the [!INCLUDE[nav_web](../includes/nav_web_md.md)]-->.  

## Remarks

The [AssistEdit Property](../../properties/devenv-assistedit-property.md) must be set to **true** to enable the assist-edit capabilities.

If there's an error in the trigger code, then the page is closed. You can use this trigger to write to the database.  

## Related information

[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnAssistEdit (Page Field) Trigger](../pagefield/devenv-onassistedit-pagefield-trigger.md)
