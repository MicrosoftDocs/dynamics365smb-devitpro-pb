---
title: "Arranging Fields in Rows and Columns"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8bd17701-ec33-4448-9074-9817343d353b
caps.latest.revision: 10
---
# Arranging Fields in Rows and Columns
By default, page fields are arranged automatically in two columns. For more information, see [Field Arrangement on FastTabs](Field-Arrangement-on-FastTabs.md). You can use a GridLayout control or a FixedLayout control to arrange fields in rows and columns on page. This topic outlines the differences between the two controls to help you determine which control to use.  
  
## Comparing GridLayout and FixedLayout Controls  
 The GridLayout control is a new control and is the preferred method because it gives you more layout options and is generally easier to use. The following table outlines the GridLayout and FixedLayout control characteristics and their differences.  
  
|Characteristics|GridLayout|FixedLayout|  
|---------------------|----------------|-----------------|  
|General usage and field layout|Places fields in a uniform grid. When setting up a grid layout, you can decide to set up fields in a row-by-row or column-by-column basis.|Places fields in a table or matrix-like configuration that has a row and column headings. You can only set up fields on a column-by-column basis. You typically use the FixedLayout control to display statistical data in a FastTab or information in the details section of a Worksheet page. If you are using the [!INCLUDE[demolong](includes/demolong_md.md)], then you can see examples of these uses in page 151, Customer Statistics, and page 40, Item Journal.|  
|Field captions|Shows or hides captions above each field.<br /><br /> Place captions before or above the field.|Shows captions as a heading to the rows and columns. You cannot specify a heading for each field.|  
|Row and column spanning|Can span rows and columns.|Cannot span rows and columns.|  
|Field appearance|Shaded with a border.|No shading or border.|  
  
## See Also  
 [How to: Arrange Fields in Rows and Columns Using the GridLayout Control](How-to--Arrange-Fields-in-Rows-and-Columns-Using-the-GridLayout-Control.md)   
 [How to: Arrange Page Fields in Rows and Columns Using a FixedLayout Control](How-to--Arrange-Page-Fields-in-Rows-and-Columns-Using-a-FixedLayout-Control.md)
