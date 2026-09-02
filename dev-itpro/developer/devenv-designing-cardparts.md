---
title: CardPart Pages in Business Central
description: Learn how to design a CardPart page in Business Central, add it to a Role Center or FactBox, and display data with fields, cue tiles, and control add-ins.
ms.date: 08/24/2026
ms.topic: concept-article
ms.author: solsen
author: SusanneWindfeldPedersen
ms.reviewer: jswymer
---

# Working with CardPart pages

A *CardPart* page is a type of page part that you embed in another page to display more data relevant to the page that hosts it. It can display the data in the form of almost any page control, such as fields, cue tiles, images, or control add-ins. You can also define actions to operate on the card part page.

You can place a card part in Role Centers, in the FactBox and content area of other pages, or in a tabular step in a wizard. Depending on the type of the hosting page, a card part is subject to different design constraints, which determine its position and dimensions. Learn more in [Design considerations](devenv-designing-parts.md#design-considerations).

## Creating a card part

To create a card part, create a page object, set the [PageType property](properties/devenv-pagetype-property.md) to `CardPart`, and specify the source table. You can nest different controls inside the `area(Content)` control depending on how you want to display the data. You can specify the following controls.

|Control|Definition|
|---|---|
|`field`|Defines a field. It can also be used to display an image.|
|`cuegroup`|Defines a group of cue tiles. Learn more in [Designing cues](devenv-cues-action-tiles.md#CueDesign).|
|`usercontrol`|Defines a control add-in. Learn more in [Control add-in object](devenv-control-addin-object.md).|

## Adding a card part to a page

To place a card part in a page, add a `part` control to the hosting page and associate it with the card part page object. Define more properties. These properties only apply to the container of the card part, whose functionality is independent from the hosting page.

## Example

The following code sample illustrates how to create a `CardPart` page, `"Customer Sales History"`, and how to integrate it in the FactBox area of the card page `"Customer Card"`.

```al
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
                    // Make the cue interactive
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
        
        // Display the card part in the Factbox area
        area(FactBoxes)
        {
            part("Customer Sales History"; "Customer Sales History")
            {
                // Filter on the sales history that relate to the customer in the card page.
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
}
```

## Related information

[Page parts overview](devenv-designing-parts.md)  
[Page types and layouts](devenv-page-types-and-layouts.md)  
[Page object](devenv-page-object.md)  
[Page extension object](devenv-page-ext-object.md)  
[Adding a FactBox to a page](devenv-adding-a-factbox-to-page.md)  
[ListPart pages](devenv-designing-listparts.md)  
[AL development environment](devenv-reference-overview.md)  
[Use Designer](devenv-inclient-designer.md)  
