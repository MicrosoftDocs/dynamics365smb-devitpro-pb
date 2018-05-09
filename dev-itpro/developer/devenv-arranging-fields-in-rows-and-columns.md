---
title: "Arranging Fields in Multiple Rows and Columns"
description: Arrange fields in rows and columns in a gird-like format using the GridLayout and FixedLayout controls.
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
# Arranging Fields in Multiple Rows and Columns
By default, page fields are arranged automatically in two columns. For more information, see [Arranging Fields on FastTab](devenv-arranging-fields-on-fasttab.md). You can use a GridLayout control or a FixedLayout control to arrange fields in rows and columns on a page in a grid-like format. This topic outlines the differences between the two controls to help you determine which control to use.  
  
## Comparing GridLayout and FixedLayout controls  
 The GridLayout control is a new control and is the preferred method because it gives you more layout options and is generally easier to use. The following table outlines the GridLayout and FixedLayout control characteristics and their differences.  
  
|Characteristics|GridLayout|FixedLayout|  
|---------------------|----------------|-----------------|  
|General usage and field layout|Places fields in a uniform grid. When setting up a grid layout, you can decide to set up fields in a row-by-row or column-by-column basis.|Places fields in a table or matrix-like configuration that has a row and column headings. You can only set up fields on a column-by-column basis. You typically use the FixedLayout control to display statistical data in a FastTab or information in the details section of a Worksheet page. If you are using the [!INCLUDE[demolong](includes/demolong_md.md)], then you can see examples of these uses in page 151, Customer Statistics, and page 40, Item Journal.|  
|Field captions|Shows or hides captions above each field.<br /><br /> Place captions before or above the field.|Shows captions as a heading to the rows and columns. You cannot specify a heading for each field.|  
|Row and column spanning|Can span rows and columns.|Cannot span rows and columns.|  
|Field appearance|Shaded with a border.|No shading or border.|  


## See Also   
[Arranging Fields on a FastTab](devenv-arranging-fields-on-fasttab.md)  
[Pages Overview](devenv-pages-overview.md)  
[GridLayout Property](properties/devenv-gridlayout-property.md)  

