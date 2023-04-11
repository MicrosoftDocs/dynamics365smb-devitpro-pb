---
title: Create Queries
description: A query describes a dataset of Dynamics NAV data, it retrieves records from one or more tables and combines them into rows and columns in a single dataset.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c9c64bd7-d950-4a5d-bfd3-f25f97adb5fb
caps.latest.revision: 21
---
# Creating Queries 

A *query* object enables you to specify a set of data from the [!INCLUDE[navnow](includes/navnow_md.md)] database. You can query the database to retrieve fields from a single table or multiple tables. You can specify how to join tables in the query. You can filter the result data. You can specify totaling methods on fields, such as sums and averages.  


A query describes a dataset of [!INCLUDE[navnow](includes/navnow_md.md)] data. Queries retrieve records from one or more tables and combine the records into rows and columns in a single dataset. You create queries in the development environment using Query Designer. To create a query, you define *data items* and *columns*. A data item specifies the table to retrieve records from. A column specifies a field of the table to include in the resulting dataset of a query. After you have added the data items and columns, you create links between the data items. A data item link determines which records to include in the dataset based on a common field between two data items. For more information, see [Understanding Data Item Links](Understanding-Data-Item-Links.md).  

### To create a query and add data items and columns  

1.  In the development environment, on the **Tools** menu, choose **Object Designer**.  

2.  In Object Designer, choose **Query**, and then choose **New**.  

3.  In Query Designer, on the first line, in the **Type** column, choose **DataItem** from the drop-down list.  

    > [!NOTE]  
    >  The first line in Query Designer must be a **DataItem** and not a **Column**.  

4.  In the **Data Source** column, enter the name of the table from which you want to add fields. To select the table from the **Table List** window, choose the up arrow.  

5.  In the **Name** column, verify the default name or enter a Common Language Specification \(CLS\)–compliant name for the data item. The first character must be a letter. Subsequent characters can be any combination of letters, integers, and underscores.  

     For more information, see the "Naming" section in [Common Language Specification](https://go.microsoft.com/fwlink/?LinkId=193144) in the MSDN Library.  

    > [!WARNING]  
    >  All DataItem and Column rows must have unique names.  

6.  In Query Designer, on the next line, in the **Type** column, choose **Column** from the drop-down list.  

7.  In the **Data Source** column, enter a field that you want to include in the query dataset. To select one or more fields from the **Field List** window, choose the up arrow.  

    > [!NOTE]  
    >  Fields are indented one level from the parent data item.  

8.  In the **Name** column, enter a CLS-compliant name for the field.  

9. In the user interface for the query results, such as in a chart, the name of the underlying table field is displayed for the query column. If you want to display a different name for the column, then change the [Caption Property](Caption-Property.md) or [CaptionML Property](CaptionML-Property.md).  

    > [!NOTE]  
    >  When you run the query from Object Designer, the **About This Query** window that opens in the [!INCLUDE[rtc](includes/rtc_md.md)] displays the name that is defined by the **Name** property of the column, not the **Caption** property or **CaptionML** property.  

10. Continue to enter DataItems and Columns in Query Designer until it contains all fields from all tables that you want to include in the query.  

    > [!NOTE]  
    >  You must have at least one Column in the query. You are not required to have one Column for each DataItem.  

### To link data items  

1.  In Query Designer, choose the lower data item.  

     A data item must be linked to the data item or data items above it. You create the link from the lower data item in Query Designer.  

2.  On the **View** menu, choose **Properties**.  

3.  In the **Properties** window, in the **Value** column of **DataItemLink** property, choose the **AssistEdit** button.  

     The **Data Item Link** window opens. You will use the **Data Item Link** window to create a reference link between a field in the table of the lower data item and a field in the table of the upper data item.  

4.  In the **Field** column of the first line, choose the up arrow.  

     The **Field List** window opens to display all the fields in the table of the lower data item.  

5.  In the **Field List** window, choose the field from the table of the lower data item, and then choose **OK** to close the **Field List** window.  

6.  In the **Reference DataItem** column of the same line of the **DataItem List** window, choose the up arrow.  

     The **Field List** window opens to display all the fields in the table of the upper data item.  

7.  In the **Field List** window, choose the field from the table of the upper data item that is common to the field of the lower data item, and then choose **OK** to close the **Field List** window.  

8.  Choose **OK** to return to the **Properties** window.  

9. In the **Value** column of the **DataItemLinkType** property, choose one of the values described in the following table.  

    |Value|Description|  
    |-----------|-----------------|  
    |**Use Default Values If No Match**|The resulting dataset will include all the records from the upper data item, even if a record does not have a matching value in the linked field of lower data item as specified by the **DataItemLink** property. When a record does not have a matching record in the lower data item, the columns from the lower data item include the default value for the data type of the table field that specifies the column. For example, if the field has an integer data type, then the default value is **0**.|  
    |**Exclude Row If No Match**|The resulting dataset will include only records from data item tables that have matching values for the fields that are linked by the **DataItemLink** property.|  
    |**SQL Advanced Options**|Provides alternatives to **Use Default Values If No Match** and **Exclude Row If No Match** for generating a dataset that corresponds to joins in SQL SELECT statements. When you set the property to **SQL Advanced Options**, the **SQLJoinType** property appears so that you can select the SQL join type.|  

10. If you set the **DataItemLinkType** property to **SQL Advanced Options**, then set the **SQLJoinType** property. For more information, see [SQL Advanced Options for Data Item Link Types](SQL-Advanced-Options-for-Data-Item-Link-Types.md).  

11. Close the **Properties** window.  

### To save the query  

1.  On the **File** menu, choose **Save**.  

2.  In the **Save As** window, in the **ID** field, enter an ID for the query object. The ID must be in a valid range for your solution. In the **Name** field, enter a name for the query, verify that the **Compiled** check box is selected, and then choose the **OK** button.  

## See Also  
 [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md)   
 [SQLJoinType Property](SQLJoinType-Property.md)   
 [Walkthrough: Creating a Query That Uses a Totaling Method and Sorting](Walkthrough--Creating-a-Query-That-Uses-a-Totaling-Method-and-Sorting.md)   
 [Understanding Data Item Links](Understanding-Data-Item-Links.md)
