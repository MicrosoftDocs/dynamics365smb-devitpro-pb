---
title: SourceTableView Property (Pages)
description: Sets the key, sort order, and filter you want to use to determine the view of the source table presented to the user.
ms.date: 11/13/2024
ms.topic: reference
ms.author: solsen
author: SusanneWindfeldPedersen
---

# SourceTableView Property (Pages)
> **Version**: _Available from runtime version 1.0._

Sets the key, sort order, and filter you want to use to determine the view of the source table presented to the user.  
  
## Applies to  
  
- Pages  

## Example

```AL
page 50101 MyCustomers
{
    PageType = List;
    SourceTable = Customer;
    // The view of the Customer table is sorted by the Name and "No." fields on descending order.
    SourceTableView = sorting (Name, "No.") order(descending)
 where ("Balance (LCY)" = filter (>= 50000), "Sales (LCY)" = filter (<> 0));
    layout
    {
        area(Content)
        {
            repeater(MyRepeater)
            {
                field(Name; Name) { }
                field(Address; Address) { }
                field("Balance (LCY)"; "Balance (LCY)") { }
            }
        }
    }
}
```

Learn more about how you can scan, find, and limit records in a list in [Sorting, searching, and filtering lists](/dynamics365/business-central/ui-enter-criteria-filters).

## Remarks  
 
When you combine a descending sort order on SourceTableView with overriding the OnFindRecord, you may experience that the page displays the last record instead of the first when the page opens. You can resolve this condition by adding `Rec.FindFirst` in the OnOpenPage trigger, or using `Find(-)` in the OnFindRecord trigger.
  
## Related information  

[Properties](devenv-properties.md)
