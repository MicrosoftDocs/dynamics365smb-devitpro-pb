---
title: OnBeforeValidate Trigger in AL for Business Central
description: Learn how the OnBeforeValidate trigger runs in AL before field input is validated in Business Central, with an example of validating a field in a table extension.
ms.date: 04/01/2021
ms.topic: reference
ms.reviewer: solsen
ms.author: solsen
author: SusanneWindfeldPedersen
---

# OnBeforeValidate trigger

Runs before the user input is validated.

## Applies to

- Fields

## Remarks

This trigger is run before the default validation behavior is executed on a record field entry, which are default checks such as data type validation. An error message displays if an error occurs in the trigger code. In case of an error, the user entry is not written to the database.

It applies to an already existing table field when it is being modified in a table extension.

## Example

```al
tableextension 50111 CustomerExt extends Customer
{
    fields
    {
        modify("Address 2")
        {
            trigger OnBeforeValidate()
            begin
                if Rec.Address = '' then
                    Error('Enter a first address before you specify a second one.');
            end;
        }
    }
}
```

## Related information

[Triggers](devenv-triggers.md)  
[Table and Field Triggers](devenv-table-and-field-triggers.md)  
[OnAfterValidate Trigger](devenv-onaftervalidate-fields-trigger.md)  
[Table Properties](../properties/devenv-table-properties.md)
