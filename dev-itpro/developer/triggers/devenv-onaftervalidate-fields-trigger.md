---
title: "OnAfterValidate Trigger"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: t-blrobl
ms.service: "dynamics365-business-central"
author: blrobl
---

# OnAfterValidate Trigger
Runs after the user input is validated. 

## Applies to  
- Fields  
  
## Remarks  
 This trigger is after the default validation behavior is executed on a record field entry, which are default checks such as data type validation. An error message displays if an error occurs in the trigger code. In case of an error, the user entry is not written to the database.  

It applies to an already existing table field when it is being modified in a table extension. 

## Example
```
tableextension 50111 "CustomerExt" extends Customer
{
    fields
    {
        modify("Address 2")
        {
            trigger OnAfterValidate()
            begin
                if (rec."Address 2" = rec.Address) then
                    error('The second address cannot be the same as the first one.');
            end;
        }
    }
}    
```

## See Also  
 [Triggers](devenv-triggers.md)  
 [Table and Field Triggers](devenv-table-and-field-triggers.md)  
 [OnBeforeValidate Trigger](devenv-onbeforevalidate-fields-trigger.md)  
 [Table Properties](../properties/devenv-table-properties.md)   