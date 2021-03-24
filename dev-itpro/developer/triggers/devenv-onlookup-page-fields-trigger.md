---
title: "OnLookup (Page fields) Trigger"
description: "OnLookup trigger for page fields in AL for Business Central."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnLookup (Page fields) Trigger

Runs in place of the normal lookup features for the current page.  

## Syntax  

```AL
trigger OnLookup(var Text: Text): Boolean
begin
    ...
end;
```  

#### Parameters

 *TextString*  

 Text string entered into the text box and used as the lookup value.  

## Applies to

- Fields on pages  

## Remarks

There are three lookup options:  

- Default Lookup - The lookup into the table is performed without applying filters or other special parameters.  

- Field Lookup - You can define a lookup trigger on a field that will be used in place of the default lookup. For more information, see [OnLookup (Fields) Trigger](devenv-onlookup-fields-trigger.md).  

- Text box Lookup - You can use this trigger to define a lookup based on the value of a text box. This value will be used in place of the default lookup or the field lookup.  

For example, for the Customer Code field, a lookup into the Customer table is provided. If you want a lookup into another table or if you want to place a filter on the table before displaying the lookup, use this trigger.  

If an error occurs in the trigger code, the lookup is canceled.  

You can use this trigger to write to the database.  

> [!NOTE]  
> If you have defined an `OnLookup` trigger, the [OnAfterLookup Trigger](devenv-onafterlookup-trigger.md) will not be fired.


> [!NOTE]  
> **OnLookup** is also a field trigger at the table level. The flow is different for this trigger. When a lookup is requested, the page field's OnLookup trigger is executed if it is defined in the field lookup or system default. If no control lookup trigger is defined, the [OnLookup (Fields) Trigger](devenv-onlookup-fields-trigger.md) \(if defined\) replaces the system default lookup.  

## See Also

[OnLookup (Fields) Trigger](devenv-onlookup-fields-trigger.md)  
[OnAfterLookup Trigger](devenv-onafterlookup-trigger.md)  
[Page and Action Triggers](devenv-page-and-action-triggers.md)  
[Page Properties](../properties/devenv-properties.md)  
[Triggers](devenv-triggers.md)