---
title: Arrange Fields Using GridLayout Control
description: Fields in a FastTab are arranged automatically. Use GridLayout control to manually set up rows, columns, span fields across, and show or hide captions.
ms.custom: na
ms.date: 05/22/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: cb249654-c9be-482b-9a25-c26d7f229fc2
caps.latest.revision: 44
author: SusanneWindfeldPedersen
---
# Arrange Fields in Rows and Columns Using the Grid Control
By default, fields in a FastTab are arranged automatically in two columns that are based on the number of fields. For more information, see [Field Arrangement on a Fasttab](devenv-arranging-fields-on-fasttab.md). You can use a Grid control or a Fixed control to arrange fields in rows and columns on a page and design it to look like a grid-like format or a matrix-like format. To understand the differences between the two controls to help you determine which control to use, see [Comparing Grid and Fixed controls](devenv-arranging-fields-using-grid-and-fixed-controls.md). 

Using the **Grid** control, you can arrange the fields manually in one or more rows and columns. The **Grid** control gives you the following options:  
  
-   Set up your grid row-by-row or column-by-column.  
  
-   Span a field across multiple rows and columns.  
  
-   Show or hide field captions.  
  
## Setting-up fields in rows and columns in a FastTab  
To add rows and columns of fields to a page, you set up a **Grid** control in a FastTab of the page. When you define the **Grid** control in the group, you specify whether fields are arranged in rows or columns. After you define the **Grid** control, you can add fields in rows and columns of fields by adding **Group** controls. Each **Group** control defines either a row or column, depending on how you structure the groups in the content area.  

#### Example
The following examples demonstrates how to structure in a grid-like format. 

```
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
                    group("General Info")
                    {
                        field("No."; "No.")
                        {
                            ApplicationArea = All;
                        }
                        field(Name; Name)
                        {
                            ApplicationArea = All;
                        }
                        field("E-Mail"; "E-Mail")
                        {
                            ShowCaption = false;
                            ApplicationArea = All;
                        }
                    }
                    group("Address Details")
                    {
                        grid(Grid2)
                        {
                            group(GridForm)
                            {
                                field(Address; Address)
                                {
                                    ApplicationArea = All;
                                }
                                field("Post Code"; "Post Code")
                                {
                                    ApplicationArea = All;
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

## Setting fields to span multiple rows and columns  
You can set a field to span multiple rows or columns. When you set a field to span multiple rows, the field occupies the cells in the rows below it, and existing fields in the occupied cells are moved to the right. 
  
When you set a field to span multiple columns, the field occupies the cells in the columns to the right, and existing fields in the occupied cells are moved to the right. 
  
You can also set a field to span multiple rows and columns. 

> [!IMPORTANT]  
>  The [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] web client does not support row and column spanning for fields. If the page displays in the [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] web client, the fields appear without spanning.  
  
#### To set a field to span rows and columns  
  
When you set the **Grid** control, the fields of that group can be set to span rows or columns.
  
-   To set a field to span one or more rows, set the value of the [RowSpan Property](properties/devenv-rowspan-property.md) to the number of rows.  
  
-   To set a field to span one or more columns, set the value of the [ColumnSpan Property](properties/devenv-columnspan-property.md) to the number of columns.  
  
##  <a name="position"></a> Hiding field captions  
  
You can choose to hide a caption of a group or a field in a page. To hide a caption of a field, add the ShowCaption property and set the value to **false**. For more information, see [ShowCaption Property](devenv-showcaption-property.md).

  
## See Also  
 [Field Arrangement on FastTabs](devenv-arranging-fields-on-fasttab.md)   
 [Arranging Fields Using Grid and Fixed Controls](devenv-arranging-fields-using-grid-and-fixed-controls.md)