---
title: "ListPart Pages"
description: "A ListPart page is a type of page part used to display a list of records embedded within another page."
ms.custom: na
ms.date: 06/17/2020
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: t-blrobl
author: blrobl
---

# ListPart pages

A *ListPart* page is a type of page part used to display a list of records embedded within another page. It consists of a repeater, which presents the records of the source table as rows and columns, and optionally, of an action bar.

A list part can be contained in Role Centers, in the FactBox area of other pages, in a tabular step in a Wizard and as a sub-page on a Document page. Depending on the type of the hosting page, a list part is subject to different design constraints, such as its position or size limitations. For more information, see [Design Considerations](devenv-designing-parts#design-considerations.md).

## Creating a list part

To create a list part, you create a page object, set the [PageType Property](properties/devenv-pagetype-property.md) to `ListPart` and specify the source table. A list part page uses a single `repeater` control, located inside `area(Content)`, where you specify the `field` controls that you want to display. The structure is similar to that of a `List` page, except that there is no FactBox section, since part pages cannot host other parts. For more information, see [List Page Structure](devenv-designing-list-pages.md?tabs=structure#structure-1). 

## Adding a list part to a page

To place the list part on a page, you add a `part` control to the hosting page and associate it with the list part page object. Here you can also define additional properties. These will only apply to the container of the list part, whose functionality is independent from the hosting page.


## Example

The following code sample illustrates how to create a `ListPart` page, `"Pending Shipments"`, and how to integrate it in the card page `"Customer Card"`. 

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
[Page Object](devenv-page-object.md)   
[Adding a FactBox to a page](devenv-adding-a-factbox-to-page.md)   
[CardPart Pages](devenv-cardpart-page.md)   


