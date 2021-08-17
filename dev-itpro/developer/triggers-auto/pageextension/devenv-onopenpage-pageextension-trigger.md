---
title: "OnOpenPage (Page Extension) Trigger"
description: "Runs after a page is initialized and run."
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

# OnOpenPage (Page Extension) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a page is initialized and run.


## Syntax
```AL
trigger OnOpenPage()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This trigger is executed after the [OnInit Trigger](../page/devenv-oninit-page-trigger.md).  

You use the **OnOpenPage** trigger to change dynamic properties, including those which can only be changed when the page is opened, such as the [Visible Property](../../properties/devenv-visible-property.md). You can also write to the database from the trigger.  

The **OnOpenPage** trigger is the only trigger that can toggle the [Visible Property](../../properties/devenv-visible-property.md) and the property can only be toggled on columns. 

If an error occurs in the trigger execution, then the page closes.  

> [!NOTE]  
> If you use the [LockTable Record](../../methods-auto/record/record-locktable-method.md) in the OnOpenPage trigger, then the table lock will be released when the trigger completes execution and not when the user closes the page.  

> [!NOTE]  
> The **OnOpenPage** trigger does not support calls to control add-in methods and properties because the trigger is invoked before the page is instantiated. <!-- For more information see, [Exposing Methods and Properties in a Windows Client Control Add-in](exposing-methods-and-properties-in-a-windows-client-pagefield-add-in.md).-->

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnOpenPage (Page) Trigger](../page/devenv-onopenpage-page-trigger.md)  
[OnOpenPage (Request Page) Trigger](../requestpage/devenv-onopenpage-requestpage-trigger.md)  
[OnOpenPage (Request Page Extension) Trigger](../requestpageextension/devenv-onopenpage-requestpageextension-trigger.md)
