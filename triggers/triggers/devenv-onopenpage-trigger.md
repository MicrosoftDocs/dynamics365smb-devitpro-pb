---
title: "OnOpenPage Trigger"
description: "OnOpenPage trigger in AL for Business Central."
ms.author: solsen
ms.date: 04/01/2021
ms.topic: reference
author: SusanneWindfeldPedersen
---

# OnOpenPage Trigger

Runs after a page is initialized and run.  

## Syntax  

```AL
trigger OnOpenPage()
begin
    ...
end;
```  

## Applies to
- Pages  

## Remarks

This trigger is executed after the [OnInit Trigger](devenv-oninit-trigger.md).  

You use the OnOpenPage trigger to change dynamic properties, including those which can only be changed when the page is opened, such as the [Visible Property](../properties/devenv-visible-property.md). You can also write to the database from the trigger.  

The `OnOpenPage` trigger is the only trigger that can toggle the [Visible Property](../properties/devenv-visible-property.md) and the property can only be toggled on columns. 

If an error occurs in the trigger execution, then the page closes.  

> [!NOTE]  
> If you use the [LockTable Record](../methods-auto/record/record-locktable-method.md) in the OnOpenPage trigger, then the table lock will be released when the trigger completes execution and not when the user closes the page.  

> [!NOTE]  
> The OnOpenPage trigger does not support calls to control add-in methods and properties because the trigger is invoked before the page is instantiated. <!-- For more information see, [Exposing Methods and Properties in a Windows Client Control Add-in](exposing-methods-and-properties-in-a-windows-client-control-add-in.md).-->

## See Also

[Triggers](devenv-triggers.md)  
[Page and Action Triggers](devenv-page-and-action-triggers.md)  
[LockTable Record](../methods-auto/library.md)