---
title: "Creating and Customizing Cues"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---

# Creating Cues and Action Tiles on Role Centers

This article provides an overview of Cues and Action tiles, and the tasks involved in creating and customizing them for displaying on Role Centers, as illustrated in the following figure:  

![Cues on the Role Center.](media/Cue-overview-online-v2.png "Cues on the Role Center")  

> [!NOTE]  
> Modifying actions in Cue groups on page extensions is not supported.

##  <a name="CueDesign"></a>Designing Cues 

A Cue provides a visual representation of aggregated business data, such as the number of open sales invoices or the total sales for the month. Cues are interactive, meaning that you can select the Cue to drill down to data or open another page, run code, and more. Cues display data that is contained in a table field. This can be raw data or calculated data.

### <a name="CueWideLayout"></a>Normal and wide layout

There are two layout options that influence how Cues appear in the client: *normal* and *wide*. 

- The *normal* layout displays Cues as tiles. With this layout, Cue groups are automatically arranged to fill in the width of the workspace, which means there can be more than one group horizontally across the workspace.

- The *wide* layout is designed to display large values, such as monetary values. The wide layout gives you a way emphasize a group of Cues. Wide and normal Cue groups can be interleaved. However, wide groups that precede all normal groups will appear in their own section of the workspace, spanning the entire width - providing space for the large values. Wide groups that are placed after normal groups will behave just like the normal layout groups. With this in mind, it is good practice to place Cue groups that use the wide layout, above those that use the normal layout. The wide layout is specified by setting the [CuegroupLayout property](properties/devenv-cuegrouplayout-property.md) to `wide`. 

> [!NOTE]  
> The wide layout is only supported in the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)].
>
> The [Caption](properties/devenv-caption-property.md) and [CaptionML](properties/devenv-captionml-property.md) properties of the `cuegroup` control are ignored when the layout is wide.

### Supported data types  
You can only base Cues on integer and decimal data types. Other data types are not supported and will not display in a Cue.  
  
### FlowFields versus normal fields  
A Cue can be based on a FlowField or Normal field. If you base the Cue on a FlowField, then you add the logic that calculates the data for the Cue to the [CalcFormula property](properties/devenv-calcformula-property.md) of the FlowField. If you use a Normal field, then you will typically add the logic that calculates the Cue data to an AL trigger or method. Unlike a FlowField, where data is extracted from tables, a Normal field enables you to extract data from other objects such as queries.  
  
### <a name="CreateCue"></a>Creating a Cue
The implementation of a Cue involves the following elements:

- A table object with a field that holds the data that is contained in the Cue at runtime.  
  
- A page object that contains the table field and displays the Cue in the client.  
  
- Logic that calculates the data to display in the Cue at runtime.  
  
The logic can consist of a combination of AL code and objects, such as tables, queries, and codeunits. How and where you implement the logic will depend on whether the Cue is based on a FlowField or Normal field and what you want to achieve.

> [!NOTE]
> The examples in this section will set up a Cue that extracts the number of open sales invoices from the **Sales Header** table. 

###  <a name="CreateTable"></a> Create a table for Cue data  
The first thing that you must do is to create a table that contains fields that will hold the calculated data to display in the Cues at runtime.  
  
1. Create a table object or use an existing one.  

2. Add fields for the Cue data.  

    For each Cue that you want to display on the page, you must add a **Field** control in the table object. When you add the **Field** control, specify the following properties:  
  
    - Set the [Data Type property](./properties/devenv-properties.md) to **Decimal**, **Integer**, or **Text**, depending on the type of data the Cue will display. 

    - Set the [FieldClass property](properties/devenv-fieldclass-property.md) to **FlowField** or **Normal**.  
  
      If field is a FlowField, then set the `CalcFormula` property to calculate the Cue data. For more information, see [Calculation Formulas and the CalcFormula Property](devenv-calculation-formulas-and-the-calcformula-property.md).  
  
3. Add a primary key field for FlowFields.  

    A table must have at least one data field. Because a **FlowField** is based on a calculation, it not considered an actual data field. Therefore, if the Cue table only includes FlowFields, you must add "dummy" primary key field that does not yield any data.  
  
    To add primary key, for example, add a field with the name **Primary Key**, and then set its data type to **Code**.  

#### Example

```AL
table 50100 SalesInvoiceCueTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;PrimaryKey; Code[250])
        {
            
            DataClassification = ToBeClassified;
        }
        field(2; SalesInvoicesOpen ; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" where("Document Type"=Filter(Invoice), Status=FILTER(Open)));

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

###  <a name="CreatePage"></a> Add Cues to a Page object

After you have a table for holding the Cue data, you create a page that you associate the table, and then add Cue fields on the page. Typically, you will create Card Part type page that will be part of the Role Center page. Cues are arranged into one or more groups on the page. Each group will have its own caption.  

1. Create a page object that has the [SourceTable property](properties/devenv-sourcetable-property.md) set to the Cue data table.
2. Add a `cuegroup` control.
3. Under the `cuegroup` control, for each Cue that you want to display, add a `field` control.
4. If you want to set the `cuegroup` to use the wide layout, set the `CuegroupLayout` property to `wide`.

    Repeat steps 2-4 to add additional Cue groups.
5. Initialize the Cue fields.  

    You must initialize the Cue fields on the page. To do this, for example, you can add the following AL code to the [OnOpenPage Trigger](triggers-auto/page/devenv-onopenpage-page-trigger.md).     

    ```AL
          RESET;
        if not get then begin
            INIT;
            INSERT;
        end;
    ```    

#### Example 
```AL
page 50105 SalesInvoiceCuePage
{
    PageType = CardPart;
    SourceTable = SalesInvoiceCueTable;

    layout
    {
        area(content)
        {
            cuegroup(SalesCueContainer)
            {
                Caption='Sales Invoices';
                // CuegroupLayout=Wide;
                field(SalesCue; SalesInvoicesOpen)
                {
                    Caption='Open';
                    DrillDownPageId="Sales Invoice List";
                }
            }
        }
    }
        
    trigger OnOpenPage();
    begin
        RESET;
        if not get then begin
            INIT;
            INSERT;
        end;
    end;
}
```

## <a name="ActionTiles"></a>Designing Action tiles

Action tiles promote an action or operation to the user on the Role Center. Action tiles act as links that perform a task or operation, like opening another page, starting a video, targeting an another resource or URL, or running code. They will arrange on the workspace just like that use the normal layout.

Similar to Cues, Actions tile can be grouped together, under a common caption, by using the `cuegroup` control. The difference is that instead adding field controls under the `cuegroup` control, you create Action tiles by adding actions to the `cuegroup` control. 

### Create an Action tile
1. Develop or locate the functionality that you want to Action tile to perform.

  For example, create the page object that you want the Action tile to open, add AL code that you want the Action tile to run, find the URL to the video.

2. Open the page on which you want to display the Action tiles. For example, this could be the page that you created in the previous task.

3. In the location where you want the Action group, add a `cuegroup` control.

4. Configure the control to the desired operation.

    For example, if it should open a page, set the control's [RunObject property](properties/devenv-runobject-property.md) to the appropriate page. Or, set it to call a function or method.

#### Example
The following code adds an Action tile that opens **Sales Invoice** page.

```AL
cuegroup(SalesActionontainer)
{
    Caption='New Sales Invoice';
                
    actions
    {

        action(ActionName)
        {
            RunObject=page "Sales Invoice";
            Image=TileNew;

            trigger OnAction()
            begin
                        
            end;
        }
    }
}
```

### Styling an Action tile
You can use the [Image property](properties/devenv-image-property.md) on an `action` control to change the look of the Action tile. For Action tiles, the `Image` property supports several standard values that start with the text `Tile`, such as `TileNew` and `TileYellow`. These values change the Action's background color and icon as follows:

-   A value that has the format `Tile[color]` will set the Action tile to use the circle icon and a background that is specified by `[color]`. For example, `TileBlue` will display a circle icon in a blue background.

-   A value that has the format `Tile[picture]` will set the Action tile to use an icon that is specified by `[picture]` and a neutral background color. For example, `TileCamera` will display a camera icon on the neutral background.  

> [!NOTE]
> If you use a value that is not valid or recognized, the Action tile will default to display the circle icon on the neutral background. 



<!--
## Customizing a Cue  
 This section contains information about how you can change the appearance of the Cues.  
  
###  <a name="SpecifyImage"></a> Specifying an Image on the Cue  
 You can specify an image to display on the Cue or you can choose not to display an image at all.  You can select from several available images.  
  
 For more information, see [How to: Set Up an Image on a Cue](How-to--Set-Up-an-Image-on-a-Cue.md).  
  
###  <a name="DrillDown"></a> Setting up a Drill Down Page on the Cue  
You can set up a Cue to link to a page that displays details about the transactions that make up the data in the Cue. This page is referred to as a *drill down page*. For example, if the Cue displays the number of open sales orders, then you can set up the Cue to link to list page that includes the sales orders. The page opens when a user selects the Cue.  
  
 To set up a drill down page, you can do one of the following:  
  
-   Set the [DrillDown Property](DrillDown-Property.md) of the Cue field on the page to the ID of the page that you want to open from the Cue.  
  
-   You can add code to the [OnDrillDown Trigger](OnDrillDown-Trigger.md) of the Cue field on the page that contains the Cue.  
  
     The OnDrillDown trigger takes precedent over the DrillDown property.  
  
> [!NOTE]  
>  When the Cue is on a Role Center page type, an item that links to the drill down page will automatically appear in the navigation pane of the Role Center under **Home** if the navigation pane contains an entity of the same type. For example, if you have a Cue named **Sales Return Orders – Open**, this item will be added to the **Sales Return Orders** in the navigation pane.  
  
###  <a name="FormatData"></a> Formatting the Data in the Cue  
 If the data type on the Cue is a decimal, then you can change how the data is displayed, including converting amounts and unit amounts to another currency, specifying the number of decimal places and thousand separator, and adding characters before or after the value.  
  
 For more information, see the [Formatting the Data in a Field](Formatting-the-Data-in-a-Field.md).  
  
###  <a name="AddAction"></a> Adding an Action to the Cue  
 When the Cue is displayed in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] client, you can add an action next to the Cue that opens a related task. For example, if the Cue displays the open sales orders, then you can add an action the opens the Sale Order card page for creating a new sales order.  
  
 To set up an action, open the page that contains the Cue in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], and then add a **Control** action on the **CueGroup** control that contains the Cue field. Set the [RunObject Property](RunObject-Property.md) of the action to the object, such as a page, that you want to target.  
  
> [!NOTE]  
>  This is not supported in the [!INCLUDE[nav_web](includes/nav_web_md.md)] or [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)].  
  
###  <a name="SetupIndicator"></a> Setting up Colored Indicators on Cues  
 You can set up Cues to include a colored bar along the top border, which changes color based on the data in the Cue.  
  
 For more information, see [Setting Up Colored Indicators on Cues](Setting-Up-Colored-Indicators-on-Cues.md).  

 -->
  
## See Also  
[FlowFields](devenv-flowfields.md)  
[Page Object](devenv-page-object.md)  
[Pages Overview](devenv-pages-overview.md)  
[Table Object](devenv-table-object.md)