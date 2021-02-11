---
title: "Designing CardParts"
description: "Design and implementation tips for page part of type CardPart."
ms.custom: na
ms.date: 10/01/2020
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: t-blrobl
author: blrobl
---

# Working with Card Parts

A *CardPart* page is a type of page part embedded within another page used to display additional data relevant to the page that hosts it. It can display the data in the form of almost any page control, such as fields, cue tiles, charts, images, or control add-ins. You can also define actions to operate on the card part page. 

A card part can be placed in Role Centers, in the FactBox and content area of other pages or in a tabular step in a Wizard. Depending on the type of the hosting page, a card part is subject to different design constraints, which determine its position and dimensions. For more information, see [Design Considerations](devenv-designing-parts.md#design-considerations).

## Creating a card part

To create a card part, you create a page object, set the [PageType Property](properties/devenv-pagetype-property.md) to `CardPart` and specify the source table. You can nest different controls inside the `area(Content)` control depending on how you want to display the data. The controls you can specify are the following.

|Control|Definition|
|---|---|
|`field`|Defines a field. It can also be used to display an image.|
|`cuegroup`|Defines a group of cue tiles. For more information, see [Designing Cues](devenv-cues-action-tiles.md#CueDesign).|
|`chartpart`|Defines a chart.|
|`usercontrol`|Defines a control add-in. For more information, see [Control Add-In Object](devenv-control-addin-object.md).

## Adding a card part to a page

To place a card part in a page, you add a `part` control to the hosting page and associate it with the card part page object. Here you can also define additional properties. These will only apply to the container of the card part, whose functionality is independent from the hosting page.


## Example

The following code sample illustrates how to create a `CardPart` page, `"Customer Sales History"`, and how to integrate it in the FactBox area of the card page `"Customer Card"`. 

```AL
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

## See Also

[Page Parts Overview](devenv-designing-parts.md)  
[Page Types and Layouts](devenv-page-types-and-layouts.md)  
[Page Object](devenv-page-object.md)   
[Page Extension Object](devenv-page-ext-object.md)    
[Adding a FactBox to a page](devenv-adding-a-factbox-to-page.md)   
[ListPart Pages](devenv-designing-listparts.md)   
[AL Development Environment](devenv-reference-overview.md)  
[Using Designer](devenv-inclient-designer.md)  

