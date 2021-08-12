---
title: "Creating Filter Pages for Filtering Tables"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Creating Filter Pages for Filtering Tables

In AL code, you can use the FILTERPAGEBUILDER data type to create a filter page that enables users to set filters on multiple tables. Filter pages contains one or more filter controls, where each filter control can be used to set filters on a specific table. In the [!INCLUDE[prodshort](includes/prodshort.md)] client, filter pages are generated at runtime and run in a modal dialog box. The following figure illustrates a filter page that filters on the Item table.  
  
 ![Shows a filter page for the item table.](media/NAV_FilterPage.png "NAV\_FilterPage")  
  
To create a filter page, you use AL code and the methods that are available for the [FILTERPAGEBUILDER data type](methods-auto/filterpagebuilder/filterpagebuilder-data-type). The following code example shows the C/AL code that creates the filter page in the figure.  
  
```  
FilterPageBuilder.AddRecord('Item Table', Item);  
FilterPagebuilder.Addfield('Item Table', Item."No.", '>100');  
FilterPageBuilder.PageCaption := 'Item Filter Page';  
FilterPagebuilder.RunModal;  
Item.SetView( filterPagebuilder.Getview('Item Table'));  
```  


<!--  
## FILTERPAGEBUILER Data Type Functions  
 The following table describes the C/AL functions of the FILTERPAGEBUILER data type.  
  
|Function|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|[ADDTABLE Function](ADDTABLE-Function.md)|Adds a filter control for a table to a filter page.|  
|[ADDRECORD Function](ADDRECORD-Function.md)|Adds a filter control for a table to a filter page as specified by a record data type variable.|  
|[ADDRECORDREF Function](ADDRECORDREF-Function.md)|Adds filter control for a table to a filter page as specified by a recordref variable.|  
|[ADDFIELD Function](ADDFIELD-Function.md)|Adds a table field to the filter control for a table on filter page.|  
|[ADDFIELDNO Function](ADDFIELDNO-Function.md)|Adds a table field to the filter control for a table as specified by the field number.|  
|[GETVIEW function \(FilterPageBuilder\)](GETVIEW-function--FilterPageBuilder-.md)|Gets the filter view \(which defines the sort order, key, and filters\) for the record in the specified filter control of a filter page.|  
|[SETVIEW Function](SETVIEW-Function.md)|Sets the current filter view, which defines the sort order, key, and filters, for a record in a filter control on a filter page.|  
|[RUNMODAL Function \(FilterPageBuilder\)](RUNMODAL-Function--FilterPageBuilder-.md)|Builds and runs the filter page.|  
|[COUNT Function \(FilterPageBuilder\)](COUNT-Function--FilterPageBuilder-.md)|Gets the number of filter controls that are specified in the FilterPageBuilder object instance.|  
|[NAME Function \(FilterPageBuilder\)](NAME-Function--FilterPageBuilder-.md)|Gets the name of a table filter control that is included on a filter page based on an index number that is assigned to the filter control.|
-->

## See