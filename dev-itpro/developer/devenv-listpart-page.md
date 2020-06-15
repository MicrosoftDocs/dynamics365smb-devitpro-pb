---
title: "ListPart Pages"
description: "A ListPart page is a type of page part used to display a list of records embedded within another page."
ms.custom: na
ms.date: 04/01/2020
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: t-blrobl
author: blrobl
---

# ListPart pages

A *ListPart* page is a type of page part used to display a list of records embedded within another page. It consists of fields and cue groups, and optionally, of an action menu. 

A list part can be contained in Role Centers, in the FactBox area of other pages, in a tabular step in a Wizard and as a sub-page on a Document page. Depending on the type of the hosting page, a list part is subject to different constraints, like location and size limitations. For more information about design considerations, see [Design Considerations](devenv-designing-parts#design-considerations.md).

## Adding a list part to a page

The first step is to create a list part. To do so, you create a page object and set the [PageType Property](properties/devenv-pagetype-property.md) to `ListPart`. The structure is similar to that of a `List` page, except that there is no FactBox section. For more information, see [List Page Structure](devenv-designing-list-pages.md?tabs=structure#structure-1). 

To include the list part on a page, you add a `part` control to the hosting page referencing the list part. Here you can also define properties and actions. These will only apply to the container of the list part, since its functionality is independent from the hosting page.

<!--The container of the list part is functionally independent from the hosting page, such that the properties and actions defined inside the part control only apply to the container. -->

## Example

The following code sample illustrates how to create a `ListPart` page, `"Pending Shipments"`, and how to integrate it in the `"Customer Card"`. 

```
page 50101 "Pending Shipments"
{
    PageType = ListPart;
    SourceTable = "Sales Header";
    // Filter on the sales orders that are pending completion.
    SourceTableView = WHERE("Completely Shipped" = CONST(False));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Order Date"; "Order Date")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

page 50102 "Customer Card"
{
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
            }
            group(Shipments)
            {
                part("Pending Shipments"; "Pending Shipments")
                {
                    // Filter on the sales orders that relate to the customer on the card page.
                    SubPageLink = "Sell-to Customer No." = FIELD("No.");
                }
            }
        }
    }
}
```

## See Also

[Page Parts Overview](devenv-designing-parts.md)   
[Designing List Pages](devenv-designing-list-pages.md)   
[CardPart Pages](devenv-cardpart-pages.md)   