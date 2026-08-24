---
title: AL Properties Overview for Business Central
description: Explore AL properties for tables, pages, reports, queries, and other objects in Dynamics 365 Business Central development.
ms.date: 08/21/2026
ms.topic: overview
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Properties overview

<!-- this article is manually created -->

Properties control the behavior of AL objects and their elements, such as fields, actions, data items, and columns.

> [!TIP]
> If you know the name of a data type, method, property, or trigger, use the **Filter by title** field above the table of contents to find its article. Otherwise, browse the table of contents.

Different properties apply to different AL object types and elements. Set object-level properties after the object declaration. Set element properties inside the element definition. Use the syntax `<PropertyName> = <Value>;`.

The following example sets properties on a page object and one of its fields:

```al
page 50100 MyPage
{
    Caption = 'Customer names';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the customer name.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
```

> [!TIP]
> Use <kbd>Ctrl</kbd>+<kbd>Space</kbd> to open IntelliSense and see the properties available for the current object or element.

## Related information

[Methods](../methods-auto/library.md)  
[Triggers](../triggers-auto/devenv-triggers.md)
