---
title: "OnLookup (Page Field) Trigger"
ms.description: "Runs in place of the normal lookup features for the current page."
ms.author: solsen
ms.custom: na
ms.date: 04/16/2021
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

# OnLookup (Page Field) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs in place of the normal lookup features for the current page.


## Syntax
```
trigger OnLookup(Text: Text): Ok
begin
    ...
end;
```

### Parameters

*Text*  
&emsp;Type: [Text](../../methods-auto/text/text-data-type.md)  
Text string entered into the text box and used as the lookup value.  


## Return Value

*Ok*
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
**true** if the lookup was carried out,otherwise, **false**.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

There are three lookup options:  

- Default Lookup - The lookup into the table is performed without applying filters or other special parameters.  

- Field Lookup - You can define a lookup trigger on a field that will be used in place of the default lookup. For more information, see [OnLookup (Field) Trigger](../field/devenv-onlookup-field-trigger.md).  

- Text box Lookup - You can use this trigger to define a lookup based on the value of a text box. This value will be used in place of the default lookup or the field lookup.  

For example, for the Customer Code field, a lookup into the Customer table is provided. If you want a lookup into another table or if you want to place a filter on the table before displaying the lookup, use this trigger.  

If an error occurs in the trigger code, the lookup is canceled.  

You can use this trigger to write to the database.  

> [!NOTE]  
> If you have defined an `OnLookup` trigger, the [OnAfterLookup Trigger](devenv-onafterlookup-pagefield-trigger.md) will not be fired.


> [!NOTE]  
> **OnLookup** is also a field trigger at the table level. The flow is different for this trigger. When a lookup is requested, the page field's OnLookup trigger is executed if it is defined in the field lookup or system default. If no control lookup trigger is defined, the [OnLookup (Field) Trigger](../field/devenv-onlookup-field-trigger.md) \(if defined\) replaces the system default lookup.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnLookup (Field) Trigger](../field/devenv-onlookup-field-trigger.md)  
[OnLookup (Page Field Extension) Trigger](../pagefieldextension/devenv-onlookup-pagefieldextension-trigger.md)
