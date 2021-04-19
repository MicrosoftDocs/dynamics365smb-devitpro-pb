---
title: "Creating Filter Pages for Filtering Tables"
description: "Using the FilterPageBuilder data type to create a filter page in AL for Business Central."
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---

# Creating Filter Pages for Filtering Tables

In AL code, you can use the FilterPageBuilder data type to create a filter page that enables users to set filters on multiple tables. Filter pages contain one or more filter controls, where each filter control can be used to set filters on a specific table. In the [!INCLUDE[prod_short](includes/prod_short.md)] client, filter pages are generated at runtime and run in a modal dialog box. The following figure illustrates a filter page that filters on the **Item** table.  
  
 ![Shows a filter page for the item table](media/Filter-Page.png "FilterPage")  
  
To create a filter page, you use AL code and the methods that are available for the [FilterPageBuilder Data Type](methods-auto/filterpagebuilder/filterpagebuilder-data-type.md). The following code example shows the code that creates the filter page in the figure.  
  
```AL
var
    varItem: Record Item;
    varFilterPageBuilder: FilterPageBuilder;
begin
    varFilterPageBuilder.AddTable('Customer Table', Database::Customer);
    varFilterPageBuilder.AddRecord('Item Table', varItem);
    varFilterPageBuilder.Addfield('Item Table', varItem."No.", '>100');
    varFilterPageBuilder.PageCaption := 'Customer and Item Filter Page';
    varFilterPageBuilder.RunModal();
end;
```
  
## See Also

[FilterPageBuilder Data Type](methods-auto/filterpagebuilder/filterpagebuilder-data-type.md)  
