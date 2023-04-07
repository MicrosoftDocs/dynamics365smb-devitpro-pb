---
title: "Defining the Report Dataset"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1c928d15-a4d6-4b64-a2a1-99ac57b95cdd
caps.latest.revision: 3
---
# Defining the Report Dataset
You use Report Dataset Designer in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to define the data model, or dataset, of a report. The dataset determines the data that is extracted or calculated from the [!INCLUDE[navnow](includes/navnow_md.md)] database tables that can be used in a report.  
  
 You build the report dataset from data items and columns. A data item is a table. A column can be:  
  
-   A field in a table.  
  
-   A variable.  
  
-   An expression.  
  
-   A text constant.  
  
 Typically, data items and columns correspond to fields in a table. When the report is run, each data item is iterated for all records in the underlying table. Filters are applied and the dataset is created.  
  
 When a report is based on more than one table, you must set relations between the data items so that you can retrieve and organize the data. In Report Dataset Designer, you indent data items to establish a hierarchy of data items and control how the information is gathered.  
  
## Example  
 To create a report that displays a list of customers and lists the sales orders that were placed by each customer, you must define the following data items:  
  
-   A data item that corresponds to the **Customer** table.  
  
-   A data item that corresponds to the **Sales Order** table.  
  
 You indent the second data item, which is the **Sales Order** table. As the report works through the records in the **Customer** table, it finds each customer's sales orders by examining the records in the **Sales Order** table.  
  
 For more information about how to create a dataset, see [How to: Create a Report Dataset](How-to--Create-a-Report-Dataset.md).  
  
## See Also  
 [Designing Report Layouts from the Microsoft Dynamics NAV Development Environment](Designing-Report-Layouts-from-the-Microsoft-Dynamics-NAV-Development-Environment.md)
