---
title: "CardPart Pages"
description: "A CardPart page is a type of page part used to display almost any page controls, such as fields, cue tiles, charts, images, or control add-ins, embedded within another page."
ms.custom: na
ms.date: 04/01/2020
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: t-blrobl
author: blrobl
---

# CardPart pages

A *CardPart* page is a type of page part used to display overviews of the data embedded within another page. It can consist of almost any page control, such as fields, cue tiles, charts, images, or control add-ins, and optionally, of an action menu.

A card part can be contained in Role Centers, in the FactBox area of other pages or in a tabular step in a Wizard. Depending on the type of the hosting page, a card part is subject to different constraints, like location and size limitations. For more information about design considerations, see [Design Considerations](devenv-designing-parts#design-considerations.md).

## Adding card part to a page

The first step is to create a card part. To do so, you create a page object and set the [PageType Property](properties/devenv-pagetype-property.md) to `CardPart`. You can add several controls depending on how you want to display the data. For example, add a `cuegroup` control if you want to use cue tiles or a `chartpart` control to add charts.

To include a card part on a page, you add a `part` control to the hosting page referencing the card part. Here you can also define properties and actions. These will only apply to the container of the card part, since its functionality is independent from the hosting page.


## Example

The following code sample illustrates how to create a `CardPart` page, `"Customer Sales History"`, and how to integrate it in the `"Customer Card"`. 

```
page 50101 "Customer Sales History"
{
    PageType = CardPart;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            // Display data as cue tiles
            cuegroup(Overview)
            {
                field("No. of Quotes"; "No. of Quotes")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Sales Quotes";
                }
                field("No. of Orders"; "No. of Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Sales Order List";
                }
                field("No. of Invoices"; "No. of Invoices")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Sales Invoice List";
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
        }
        
        // Display the card part on the Factbox area
        area(FactBoxes)
        {
            part("Customer Sales History"; "Customer Sales History")
            {
                // Filter on the sales history that relate to the customer on the card page.
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
}
```

## See Also

[Page Parts Overview](developer/devenv-designing-parts.md)   
[ListPart Pages](devenv-listpart-pages.md)   