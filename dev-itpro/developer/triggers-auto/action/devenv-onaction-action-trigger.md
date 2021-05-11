---
title: "OnAction (Action) Trigger"
description: "Runs when a user selects an action on a page."
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

# OnAction (Action) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs when a user selects an action on a page.


## Syntax
```
trigger OnAction()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This is called after the action properties, such as the [RunObject Property](../../properties/devenv-runobject-property.md), are invoked.  

You typically use the [RunObject Property](../../properties/devenv-runobject-property.md) to run objects such as pages, reports, and codeunits from an action. You can use the **OnAction** trigger when you require more processing than the [RunObject Property](../../properties/devenv-runobject-property.md) can support, such as filtering data before a page is displayed or writing to the database.  

> [!NOTE]  
> The **OnAction** trigger is not used on Role Center pages. If you add AL code to the trigger, the Role Center page will compile, but the AL code will be ignored at runtime.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[RunObject Property](../../properties/devenv-runobject-property.md)  
