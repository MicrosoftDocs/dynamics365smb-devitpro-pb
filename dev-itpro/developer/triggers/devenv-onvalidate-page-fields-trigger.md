---
title: "OnValidate (Page fields) Trigger"
description: "OnValidate trigger for page fields in AL for Business Central."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnValidate (Page fields) Trigger

Runs when a field loses focus after its value has been changed.  
  
## Syntax  
  
```AL
trigger OnValidate()
begin
    ...
end;
```  
  
## Applies to  
  
- Pages  
  
## Remarks

Use this trigger to validate user entries in a page field. If validation fails, then the field is marked with an error and its value is not saved.  
  
The OnValidate trigger is also a field trigger at the table level. For more information, see [OnValidate (Fields) Trigger](devenv-onvalidate-fields-trigger.md). If both the table field and page field triggers are defined, then the OnValidate trigger on the table field is run before the OnValidate trigger on the page field.  
  
> [!NOTE]  
> You can use this trigger to write to the database.

## See Also

[OnValidate (Fields) Trigger](devenv-onvalidate-fields-trigger.md)  
[Page and Action Triggers](devenv-page-and-action-triggers.md)  
[Page Properties](../properties/devenv-page-properties.md)  
[Triggers](devenv-triggers.md)  
