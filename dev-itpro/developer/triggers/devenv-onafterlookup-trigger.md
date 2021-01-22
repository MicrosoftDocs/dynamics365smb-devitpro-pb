---
title: "OnAfterLookup Trigger"
description: "OnAfterLookup trigger in AL for Business Central."
ms.custom: na
ms.date: 01/22/2021
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: solsen
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnAfterLookup Trigger

Runs after a field in a lookup has been selected and the lookup is closed. This trigger is only called when a `TableRelation` is defined. 

## Applies to

- Fields
  
## Syntax

```al
trigger OnAfterLookup()
begin
    ...
end;
```

## Remarks

This trigger is introduced with runtime 7.0 to address issues that arise when, for example, more items have the same Description. With former solutions, the lookup mechanism would find the selected record based on the filtering in the lookup dialog. This made it impossible to predict which record the user had selected.

## Example

The following is a simplified example of how the `OnAfterLookup` trigger works. The `No.` and `Description` fields point to fields in the `Item` table and should be updated at the same time, even if only one of the fields is available in a dropdown; the corresponding field must also be set. `No.` is the primary key and unique, but there could be more records in the `Item` table with the same `Description`. The `OnAfterLookup` trigger looks up the chosen record and returns it in `RecordRef`.


```al

table 37 "Sales Line"
{
    // Skipped

    fields
    {
        // Skipped

        field(6; "No."; Code[20])
        {
            TableRelation = Item;
        }
        field(11; Description; Text[100])
        {
            TableRelation = Item.Description;
            ValidateTableRelation = false;
        }

        // Skipped
    }
}

page 46 "Sales Order Subform"
{
    SourceTable = "Sales Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                // Skipped 

                field("No."; "No.")
                {
                    trigger OnAfterLookup(Selected: RecordRef)
                    var
                        Item: record Item;
                    begin
                        Selected.SetTable(Item);
                        Validate(Description, Item.Description);
                    end;
                }
                field(Description; Description)
                {

                    trigger OnAfterLookup(Selected: RecordRef)
                    var
                        Item: record Item;
                    begin
                        Selected.SetTable(Item);
                        Validate("No.", Item."No.");
                    end;
                }
                // Skipped
            }
        }
    }
}

```

## See Also  

[Triggers](devenv-triggers.md)  
[Table and Field Triggers](devenv-table-and-field-triggers.md)  
