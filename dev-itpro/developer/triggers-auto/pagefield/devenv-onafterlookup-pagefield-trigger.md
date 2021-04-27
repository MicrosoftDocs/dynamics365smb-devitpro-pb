---
title: "OnAfterLookup (Page Field) Trigger"
description: "Runs after a lookup is activated passing the selected record as a RecordRef."
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

# OnAfterLookup (Page Field) Trigger
> **Version**: _Available or changed with runtime version 7.0._

Runs after a lookup is activated passing the selected record as a RecordRef.


## Syntax
```
trigger OnAfterLookup(Selected: RecordRef)
begin
    ...
end;
```

### Parameters

*Selected*  
&emsp;Type: [RecordRef](../../methods-auto/recordref/recordref-data-type.md)  
The selected record.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This trigger is introduced with runtime 7.0 of AL to address issues that arise when in [!INCLUDE [prod_short](../../includes/prod_short.md)], for example, more items have the same Description. With former solutions, the lookup mechanism would find the selected record based on the filtering in the lookup dialog. This made it impossible to predict which record the user had selected.

> [!NOTE]  
> If you have defined an [OnLookup Trigger](devenv-onlookup-pagefield-trigger.md), the [OnAfterLookup Trigger](devenv-onafterlookup-pagefield-trigger.md) will not be fired.

## Example

The following is a simplified example of how the **OnAfterLookup** trigger can be used. The `No.` and `Description` fields point to fields in the `Item` table and should be updated at the same time, even if only one of the fields is available in a dropdown; the corresponding field must also be set. `No.` is the primary key and unique, but there could be more records in the `Item` table with the same `Description`. The **OnAfterLookup** trigger looks up the chosen record and returns it in a RecordRef.

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
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
