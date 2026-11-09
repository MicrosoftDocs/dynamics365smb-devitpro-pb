---
title: Creating and Customizing Business Central Cues
description: Learn how to create Business Central cues and action tiles with AL, choose layouts, calculate cue values, and configure tile actions and images.
ms.date: 07/03/2024
ms.topic: how-to
author: jswymer
---

# Creating cues and action tiles on role centers

Use cues to display business data and action tiles to start tasks on role centers. This article explains how to create both with AL.

The following illustration identifies cue groups, drill-down links, captions, and action tiles. Their appearance can vary by version and configuration.

:::image type="content" source="media/Cue-overview-online-v2.png" alt-text="Annotated role center cues showing normal and wide layouts, drill-down links, and action tiles." lightbox="media/Cue-overview-online-v2.png":::

> [!NOTE]
> Page extensions don't support adding actions to existing cue groups or modifying or moving existing cue group actions.

<a name="CueDesign"></a>

## Designing numeric cues

A *cue* displays business data, such as the number of open sales invoices. You can configure a cue to drill down to records, open another page, or run code. A page field in a `cuegroup` displays the value. The following example uses table fields for raw or calculated values.

<a name="CueWideLayout"></a>

### Normal and wide layouts

There are two layout options for cues: *normal* and *wide*.

- The normal layout displays cues as tiles. Groups fill the available workspace width, so multiple groups can appear side by side.

- The wide layout emphasizes cues with large values, such as monetary amounts. You can interleave wide and normal cue groups. Place wide groups before normal groups when you want to emphasize them. Wide cues retain their wide styling wherever they appear. Depending on the number of visible cues, the desktop client can add dividers between groups and expand their containing CardPart to the full workspace width. Set the [CuegroupLayout property](properties/devenv-cuegrouplayout-property.md) to `Wide`.

> [!NOTE]
> The wide cue layout is supported in the desktop web client. Phone and tablet clients use their mobile cue layout.
>
> The [Caption](properties/devenv-caption-property.md) and [CaptionML](properties/devenv-captionml-property.md) properties of the `cuegroup` control are ignored when the layout is wide.

### Supported cue data types

Cues support `Integer` and `Decimal` values. Other data types aren't supported.

### FlowFields versus normal fields

A table-backed cue can use a `FlowField` or `Normal` field.

- For a FlowField, define the calculation in the [CalcFormula property](properties/devenv-calcformula-property.md).
- For a Normal field, calculate the value in an AL trigger or method.

  Unlike a FlowField calculation over tables, AL code can populate a Normal field with data from other objects, such as queries.

<a name="CreateCue"></a>

### Creating a table-backed cue

This table-backed example uses:

- A table with a field for each cue value.
- A page that displays the values in cue fields.
- Logic that calculates the values, using a FlowField formula or AL code and objects such as queries and codeunits.

> [!NOTE]
> The examples count open sales invoices in the `Sales Header` table.

<a name="CreateTable"></a>

### Create a table for cue data

Create a table with fields for the cue values.

1. Create a table object or use an existing one.
2. Add a field for each cue in this table-backed example.
   - Use `Integer` or `Decimal` as the field type.
   - Set the [FieldClass property](properties/devenv-fieldclass-property.md) to `FlowField` or `Normal`.
   - For a FlowField, set the [CalcFormula property](properties/devenv-calcformula-property.md) to calculate the value.
3. Define a primary key using a Normal field. For a cue table that holds one record, you can use a `Code` field with a blank value. FlowFields aren't stored as data fields, so a table containing only cue FlowFields still needs this stored key field.

Learn more about field properties in [AL properties](properties/devenv-properties.md).

#### Cue data table example

```al
using Microsoft.Sales.Document;

table 50100 SalesInvoiceCueTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Code[250])
        {
            DataClassification = ToBeClassified;
        }
        field(2; SalesInvoicesOpen; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" where("Document Type" = filter(Invoice), Status = filter(Open)));
        }
    }

    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
}
```

<a name="CreatePage"></a>

### Add cues to a page object

Create a page that uses the cue table and displays its fields. Typically, you use a `CardPart` page embedded in a role center. Arrange the cues in groups with captions. After creating the page, add it as a part of the target role center. Learn more about adding the cue page to a role center in [Simple role center code example](devenv-simple-role-center-example.md).

1. Create a page object that has the [SourceTable property](properties/devenv-sourcetable-property.md) set to the cue data table.
2. Add a `cuegroup` control.
3. Under the `cuegroup` control, for each cue that you want to display, add a `field` control.

4. Set the field's [Caption property](properties/devenv-caption-property.md) or [CaptionML property](properties/devenv-captionml-property.md) to specify the label that appears on the cue. These properties also specify the heading in the drill-down page.

   > [!NOTE]
   > You can't use the [CaptionClass property](properties/devenv-captionclass-property.md) for this purpose.

5. To use the wide layout, set the `CuegroupLayout` property to `Wide`. Repeat steps 2-4 to add more groups.

6. Initialize the cue fields.

    For example, add the following code to the [OnOpenPage trigger](triggers-auto/page/devenv-onopenpage-page-trigger.md):

    ```al
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    ```

#### Cue page example

```al
using Microsoft.Sales.Document;

page 50105 SalesInvoiceCuePage
{
    PageType = CardPart;
    SourceTable = SalesInvoiceCueTable;
    Caption = 'Sales Invoices Cues';
    layout
    {
        area(content)
        {
            cuegroup(SalesCueContainer)
            {
                Caption = 'Sales Invoices';
                // CuegroupLayout = Wide;
                field(SalesCue; Rec.SalesInvoicesOpen)
                {
                    ApplicationArea = All;
                    Caption = 'Open';
                    ToolTip = 'Specifies the number of open sales invoices.';
                    DrillDownPageId = "Sales Invoice List";
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
```

<a name="ActionTiles"></a>

## Designing action tiles

*Action tiles* let users start tasks from the role center. An action tile can open a page, start a video, open a resource or URL, or run code. Action tiles are arranged like cues that use the normal layout.

Group action tiles under a common caption with a `cuegroup` control. Add actions, rather than fields, to the group's `actions` block.

### Create an action tile

1. Develop or locate the functionality for the action tile.

   For example, create the page that the tile opens or the AL code it runs.

2. Add a `cuegroup` control in the page layout where you want the action group.

3. Inside the cue group's `actions` block, add an `action` control. To open a page, set its [RunObject property](properties/devenv-runobject-property.md). To run AL code, add an `OnAction` trigger.

#### Action tile example

The following fragment adds a tile that opens the **Sales Invoice** page. Place it in the page layout's content area. The surrounding AL file needs the `Microsoft.Sales.Document` namespace in scope, as in the cue page example.

```al
cuegroup(SalesActionontainer)
{
    Caption = 'New Sales Invoice';

    actions
    {

        action(ActionName)
        {
            RunObject = page "Sales Invoice";
            Image = TileNew;
            trigger OnAction()
            begin

            end;
        }
    }
}
```

### Styling an action tile

Use the [Image property](properties/devenv-image-property.md) on the `action` control to change a tile's appearance. Supported values start with `Tile`, such as `TileNew` and `TileYellow`:

- A supported `Tile<Color>` value selects a circle icon and the specified background color. For example, `TileBlue` displays a circle on a blue background.

- A supported `Tile<Picture>` value selects an icon on a neutral background. For example, `TileCamera` displays a camera icon.

> [!NOTE]
> If the value isn't recognized, the tile displays the default circle icon on a neutral background.



<!--
## Customizing a Cue
 This section contains information about how you can change the appearance of the Cues.

###  <a name="SpecifyImage"></a> Specifying an Image on the Cue
 You can specify an image to display on the Cue or you can choose not to display an image at all.  You can select from several available images.

 Legacy reference: How to: Set Up an Image on a Cue (How-to--Set-Up-an-Image-on-a-Cue.md).

###  <a name="DrillDown"></a> Setting up a drill down page on the Cue
You can set up a Cue to link to a page that displays details about the transactions that make up the data in the Cue. This page is referred to as a *drill down page*. For example, if the Cue displays the number of open sales orders, you can set up the Cue to link to a list page that includes the sales orders. The page opens when a user selects the Cue.

 To set up a drill down page, you can do one of the following:

-   Set the DrillDown Property (legacy reference: DrillDown-Property.md) of the Cue field on the page to the ID of the page that you want to open from the Cue.

-   Add code to the OnDrillDown Trigger (legacy reference: OnDrillDown-Trigger.md) of the Cue field on the page that contains the Cue.

     The OnDrillDown trigger takes precedence over the DrillDown property.

> [!NOTE]
>  When the Cue is on a role center page type, an item that links to the drill down page automatically appears in the navigation pane of the role center under **Home** if the navigation pane contains an entity of the same type. For example, if you have a Cue named **Sales Return Orders – Open**, this item is added to the **Sales Return Orders** in the navigation pane.

###  <a name="FormatData"></a> Formatting the data in the Cue
 If the data type on the Cue is a decimal, you can change how the data is displayed, including converting amounts and unit amounts to another currency, specifying the number of decimal places and thousand separator, and adding characters before or after the value.

 Legacy reference: Formatting the Data in a Field (Formatting-the-Data-in-a-Field.md).

###  <a name="AddAction"></a> Adding an action to the Cue
 When the Cue is displayed in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] client, you can add an action next to the Cue that opens a related task. For example, if the Cue displays the open sales orders, you can add an action that opens the Sale Order card page for creating a new sales order.

 To set up an action, open the page that contains the Cue in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], and then add a **Control** action on the **CueGroup** control that contains the Cue field. Set the RunObject Property (legacy reference: RunObject-Property.md) of the action to the object, such as a page, that you want to target.

> [!NOTE]
>  This feature isn't supported in the [!INCLUDE[nav_web](includes/nav_web_md.md)] or [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)].

###  <a name="SetupIndicator"></a> Setting up colored indicators on Cues
 You can set up Cues to include a colored bar along the top border, which changes color based on the data in the Cue.

 Legacy reference: Setting Up Colored Indicators on Cues (Setting-Up-Colored-Indicators-on-Cues.md).

 -->

## Related information

[FlowFields](devenv-flowfields.md)  
[Page object](devenv-page-object.md)  
[Pages overview](devenv-pages-overview.md)  
[Table object](devenv-table-object.md)  
