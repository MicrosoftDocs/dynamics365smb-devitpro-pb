---
title: Arranging Fields in Multiple Rows and Columns
description: Arrange fields in rows and columns in a gird-like format using the Grid and Fixed controls.
ms.custom: na
ms.date: 05/08/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: cb249654-c9be-482b-9a25-c26d7f229fc2
caps.latest.revision: 44
author: SusanneWindfeldPedersen
---
# Manually Arranging Rows and Columns Using Grid and Fixed Controls
By default, page fields are arranged automatically in two columns. For more information, see [Field Arrangement on FastTabs](devenv-arranging-fields-on-fasttab.md). You can use a Grid control or a Fixed control to arrange fields in rows and columns on a page and design it to look like a grid-like format. This topic outlines the differences between the two controls to help you determine which control to use.  
  
## Comparing Grid and Fixed controls  
 The Grid control is a new control and is the preferred method because it gives you more layout options. The following table outlines the Grid and Fixed control characteristics and their differences.  
  
|Characteristics|Grid Control|Fixed Control|  
|---------------------|----------------|-----------------|  
|General usage and field layout|Places fields in a uniform grid. When setting up a grid control, you can decide to set up fields in a row-by-row or column-by-column basis.|Places fields in a table or matrix-like configuration that has a row and column headings. You can only set up fields on a column-by-column basis. You typically use the Fixed control to display statistical data in a FastTab or information in the details section of a Worksheet page. If you are using the [!INCLUDE[demolong](includes/demolong_md.md)], then you can see examples of these uses in page 151, Customer Statistics, and page 40, Item Journal.|  
|Field captions|Shows or hides captions above each field.<br /><br /> Place captions before or above the field.|Shows captions as a heading to the rows and columns. You cannot specify a heading for each field.|  
|Row and column spanning|Can span rows and columns.|Cannot span rows and columns.|  
|Field appearance|Shaded with a border.|No shading or border.|  
  
## Required structure for using a Grid or a Fixed control
For both the Grid and the Fixed controls, the following table shows the sequential structure that is required to get the layout results that you expect. The page layout of the page object determines what the page will look like. You must specify the structure in the `layout` section.  

|Type| SubType |
|----|---------|
|Container|`area(content)`|
|Control    |`group`      |
|Control    |`grid` or `fixed`|
|Control    |`group`     |
|Control  |`field`     |

The Grid and the Fixed control must be placed in the `group` control in a `area(content)` subtype. The Group control does not have to be the first `group` under the `area(content)`.  
  
> [!IMPORTANT]  
>  If the Grid or Fixed control is not placed in a Group control, it will inherit properties as if it were a typical Group control and none of the Grid or Fixed properties will apply to it.  
  
The Grid or Fixed control must have Group controls as direct children and Field controls as children of those Group controls.  


<!--  
For more information about grid control, see [Grid Control].
For more information about fixed control, see [Fixed Control]. 
-->

## See Also   
[Arranging Fields on a FastTab](devenv-arranging-fields-on-fasttab.md)  
[Pages Overview](devenv-pages-overview.md)  
[GridLayout Property](properties/devenv-gridlayout-property.md)  

