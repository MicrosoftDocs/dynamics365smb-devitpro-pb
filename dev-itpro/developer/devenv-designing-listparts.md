---
title: Designing ListParts
description: Learn how to create and integrate ListPart pages in Business Central.
ms.date: 01/30/2025
ms.topic: concept-article
ms.author: brobledodiaz
author: blrobl
ms.reviewer: solsen
---

# Working with ListPart pages

A *ListPart* page is a type of page part used to display a list of records embedded within another page. It consists of a repeater control, which presents the records of the source table as rows and columns, and optionally, of an action bar.

A list part can be contained in Role Centers, in the FactBox and content area of other pages, in a tabular step in a Wizard, and as a subpage in a Document page. Depending on the type of the hosting page, a list part is subject to different design constraints, which determine its position and dimensions. Learn more in [Design considerations](devenv-designing-parts.md#design-considerations).

## Creating a list part

To create a list part, you start by creating a page object, set the [PageType property](properties/devenv-pagetype-property.md) to `ListPart` and then specify the source table. A list part page uses a single `repeater` control, located inside `area(Content)`, where you specify the `field` controls that you want to display. The structure is similar to that of a `List` page, except that there isn't any FactBox section, since part pages can't host other parts. Learn more in [List page structure](devenv-designing-list-pages.md?tabs=structure#structure-1). 

## Adding a list part to a page

To place the list part in a page, you add a `part` control to the *hosting page* and associate it with the list part page object that you created. Here you can also define more properties. These only apply to the container of the list part, whose functionality is independent from the hosting page.

## Example

The following code sample illustrates how to create a `ListPart` page, `"Pending Shipments"`, and how to integrate it in the card page `"Customer Card"`. 

```AL
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
                    // Filter on the sales orders that relate to the customer in the card page.
                    SubPageLink = "Sell-to Customer No." = FIELD("No.");
                }
            }
        }
    }
}
```

## Related information

[Page parts overview](devenv-designing-parts.md)  
[Page types and layouts](devenv-page-types-and-layouts.md)  
[Designing list pages](devenv-designing-list-pages.md)  
[Page object](devenv-page-object.md)  
[Page extension object](devenv-page-ext-object.md)  
[Adding a FactBox to a page](devenv-adding-a-factbox-to-page.md)  
[CardPart pages](devenv-designing-cardparts.md)  
[AL development environment](devenv-reference-overview.md)  
[Use Designer](devenv-inclient-designer.md)  
