---
title: SourceTableView Property for Pages
description: Learn how the SourceTableView property sets the key, sort order, and filters for records on a page in Dynamics 365 Business Central.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# SourceTableView property on pages

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-sourcetableview-property.md -->

Specifies the key, sort order, and filters that define the view of the source table on a page.

## Applies to

- Pages

## Example

```al
page 50101 MyCustomers
{
    PageType = List;
    SourceTable = Customer;
    SourceTableView = sorting(Name) order(descending)
        where("Balance (LCY)" = filter(>= 50000), "Sales (LCY)" = filter(<> 0));

    layout
    {
        area(Content)
        {
            repeater(Customers)
            {
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the customer name.';
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the customer address.';
                    ApplicationArea = All;
                }
                field(Balance; Rec."Balance (LCY)")
                {
                    Caption = 'Balance (LCY)';
                    ToolTip = 'Specifies the customer balance in local currency.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
```

For information about finding and limiting records in a list, see [Sorting, searching, and filtering lists](/dynamics365/business-central/ui-enter-criteria-filters).

## Remarks

If you combine a descending `SourceTableView` sort order with an overridden `OnFindRecord` trigger, the page might display the last record instead of the first when it opens. To control the initial record, use `Rec.FindFirst()` in the `OnOpenPage` trigger or implement the required search behavior in `OnFindRecord`.

## Related information

[Page object](../devenv-page-object.md)  
[SourceTableView property for XMLports](devenv-sourcetableview-xmlports-property.md)  
[Properties](devenv-properties.md)
