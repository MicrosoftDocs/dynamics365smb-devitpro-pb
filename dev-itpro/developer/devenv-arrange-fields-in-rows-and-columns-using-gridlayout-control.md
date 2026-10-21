---
title: Arrange Fields Using Grid Control
description: Arrange Business Central page fields in grid columns, control caption visibility, and understand the web client's limits for row layouts and field spanning.
ms.custom: bap-template
ms.date: 10/09/2026

ms.topic: how-to
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
---

# Arranging fields in rows and columns by using the grid control

Use a `grid` control to arrange groups of page fields in columns. Ordinary FastTabs automatically arrange fields and adjust to the available screen space. Learn more in [Field arrangement on FastTabs](devenv-arranging-fields-on-fasttab.md) and [Arranging fields using grid and fixed controls](devenv-arranging-fields-using-grid-and-fixed-controls.md).

> [!IMPORTANT]
> The web client partially supports grid controls. The web client doesn't support `GridLayout = Rows`, `RowSpan`, and `ColumnSpan`. Use column layouts and test the page at the screen sizes your users need.

In the web client, a grid control lets you arrange groups of fields in columns and show or hide captions.

## Set up a grid in a FastTab

Place the `grid` control inside a page group. Add groups inside the grid to define columns. Use `GridLayout = Columns` for a column layout. Learn more in [GridLayout property](properties/devenv-gridlayout-property.md).

### Example of a grid control

The following example arranges customer information in columns. It also shows a nested grid.

```al
page 50113 "Customers Page"
{
    PageType = Card;
    SourceTable = Customer;
    layout
    {
        area(content)
        {
            group(General)
            {
                grid(MyGrid)
                {
                    GridLayout = Columns;
                    group("General Info")
                    {
                        field("No."; Rec."No.")
                        {
                            ApplicationArea = All;
                            Caption = 'No.';
                            ToolTip = 'Specifies the customer number.';
                        }
                        field(Name; Rec.Name)
                        {
                            ApplicationArea = All;
                            Caption = 'Name';
                            ToolTip = 'Specifies the customer name.';
                        }
                        field("E-Mail"; Rec."E-Mail")
                        {
                            ShowCaption = false;
                            ApplicationArea = All;
                            Caption = 'E-Mail';
                            ToolTip = 'Specifies the customer email address.';
                        }
                    }
                    group("Address Details")
                    {
                        grid(Grid2)
                        {
                            group(GridForm)
                            {
                                field(Address; Rec.Address)
                                {
                                    ApplicationArea = All;
                                    Caption = 'Address';
                                    ToolTip = 'Specifies the customer address.';
                                }
                                field("Post Code"; Rec."Post Code")
                                {
                                    ApplicationArea = All;
                                    Caption = 'Post Code';
                                    ToolTip = 'Specifies the customer postal code.';
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
```
The following screenshot illustrates the column layout in the web client.

:::image type="content" source="media/screenshot_page_grid_format.png" alt-text="Customer page with general information in the left grid column and address details in the right column." lightbox="media/screenshot_page_grid_format.png":::

## Row and column spanning in the web client

The web client doesn't support field spanning. Setting `RowSpan` or `ColumnSpan` doesn't produce the spanning layouts from the former Windows client. Learn more in [RowSpan property](properties/devenv-rowspan-property.md) and [ColumnSpan property](properties/devenv-columnspan-property.md).

## <a name="position"></a> Hide field captions

To hide a field or group caption, set `ShowCaption = false`. The following example hides the email field's caption. Learn more in [ShowCaption property](properties/devenv-showcaption-property.md).

## Related information

[Field arrangement on FastTabs](devenv-arranging-fields-on-fasttab.md)  
[Arranging fields using grid and fixed controls](devenv-arranging-fields-using-grid-and-fixed-controls.md)  
[Arrange fields in rows and columns using the fixed control](devenv-arrange-fields-in-rows-and-columns-using-fixedlayout-control.md)  
