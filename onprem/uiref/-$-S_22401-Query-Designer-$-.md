---
title: "Query Designer"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 55c32886-94cc-45ef-8034-f9db6c718b3a
caps.latest.revision: 12
manager: edupont
---
# Query Designer
Retrieves records from one or more tables and combines the records into rows and columns in a single dataset. You create queries in the development environment with Query Designer.  

 To open this window, on the **Tools** menu, choose **Object Designer**, choose **Query**, and then choose the **Design** button. Choose the **New** button instead of the **Design** button to design a new query.  

 In Query Designer, tables are specified by data items. You combine tables by linking the data items in Query Designer. In most cases, the tables are combined based on a relationship between certain fields in the tables. [!INCLUDE[navnow](../includes/navnow_md.md)] includes different types of data item links that you can use to limit the records that are included in the resulting dataset by how the fields in data item tables are related to each other.  

## Fields  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Expanded**|Expands and collapses all indented hierarchy. This includes child data items and columns.|  
|**Type**|Specifies the type of data to include in the dataset. You can choose one of the following types of data:<br /><br /> -   DataItem<br />-   Column<br />-   Filter|  
|**Data Source**|Specifies the table to retrieve the dataset from.|  
|**Name**|Specifies the name of the data item, column, or filter element.|  
|**Method Type**|Specifies the date or totals type method on the query column. For more information, see [MethodType Property](../MethodType-Property.md).|  
|**Method**|Specifies either a date method for retrieving the year, month, or day from a Date field or a totals method for performing calculations on field values. For more information, see [Method Property](../Method-Property.md).|  
|**Group By**|Specifies that records are grouped by this column. [!INCLUDE[bp_fieldnoneditable](../includes/bp_fieldnoneditable_md.md)] It is automatically calculated from the defined columns. All columns where **Method Type** is not **Totals** are used for grouping.|  

## See Also  
 [Queries](../Queries.md)   
 [Understanding Query Totals and Grouping](../Understanding-Query-Totals-and-Grouping.md)
