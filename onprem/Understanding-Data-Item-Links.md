---
title: Data Item Links
description: Using queries, retrieve records from one or more tables and combine the records into rows in a single dataset.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Query Data Item Links and Joins

[!INCLUDE[prodshort](includes/prodshort.md)] queries enable you to retrieve records from one or more tables and combine the specific records into rows in a single dataset. In AL, each table is specified as a data item. The data included in the dataset is a result of how the data items are linked and joined together.

- Data items are *linked* together by associating a field in the table of a one data item with a common field in field in the table of another data item.
- Finally, records of tables are combined into a dataset by *joining* the data items. There are several different join types that control which records that included in the resulting dataset depending on whether or not the values of the linked fields match.  
  
## Sample Tables and Query  
To demonstrate data item links consider the following sample tables and query.  
  
### Salesperson/Purchaser Table  
The Salesperson/Purchaser table contains a list of salespersons. Each salesperson is identified by a unique code.  
  
|Code|Name|  
|----------|----------|  
|AA|Annette|  
|BB|Bart|  
|DD|Debra|  
|JJ|John|  
  
### Sales Header Table

The Sales Header table contains a list of sales orders. Each sales order has a unique number, includes the name of the customer to sell to, and is assigned to a salesperson by the **Salesperson\_Code** column.  
  
|No|Sell\_to\_Customer\_Name|Salesperson\_Code|  
|--------|------------------------------|-----------------------|  
|1000|Autohaus|AA|  
|2000|Blanemark|DD|  
|3000|Candoxy|JJ|  
|4000|New Concepts||  
  
### Sample Query

The following query object links the Sale Header table with the Salesperson/Purchaser table on the **Salesperson\_Code** and **Code** fields, as specified by the DataItemLink property. In the example, the SQLJoinType property is set to **InnerJoin**.

```
query 50100 "Sample Query"
{
    QueryType = Normal;
    Caption = 'Sales Overview';

    elements
    {
        dataitem(Salesperson_Purchaser; "Salesperson/Purchaser")
        {
            column(Name; Name)
            {

            }
            dataitem(Sales_Header; "Sales Header")
            {
                DataItemLink = "Salesperson Code" = Salesperson_Purchaser.Code;
                SqlJoinType = InnerJoin;

                column(No_; "No.")
                {

                }
                column(Sell_to_Customer_No_; "Sell-to Customer No.")
                {

                }
            }
        }
    }
}
```  
  
 ![Query Designer inner join.](media/QueryJoin_InnerJoin.png "QueryJoin\_InnerJoin")  
  
## How Data Item Links Work  

When you add data items in AL, they are arranged in a hierarchy, where the **DataSource** column of each data item is indented to one level from the data item above to indicate a link between with the data items above it. The order of the data items determines the sequence in which data items are linked. In SQL SELECT statements, this hierarchy corresponds to designating tables as left and right, where the upper data item would be on the left and the lower data item would be on the right.  
  
 To create a link between two data items in Query Designer, you set the DataItemLink property and the DataItemLinkType property on the lower data item in Query Designer.  
  
-   The DataItemLink property links one or more columns of the lower data item table to the upper data item table.  
  
-   The DataItemLinkType property determines which records to include in the results based on the columns that are linked by the DataItemLink property.  
  
> [!NOTE]  
>  By default, the DataItemLinkType property is set to **Use Default Values If No Match**.  
  
 For example, the following illustration shows the Query Designer and **Properties** window for linking the Sales Header table to the Salesperson/Purchaser table. You set the DataItemLink property and the DataItemLinkType property on the Sales Header data item because it is the lower data item in Query Designer.  
  
 ![Query Designer showing link between 2 data items.](media/NAV_Query_Designer_Sample_DataItemLink.png "NAV\_Query\_Designer\_Sample\_DataItemLink")  
  
### Linking More Than Two Data Items  
 A query links data items in the order that they appear in Query Designer, starting from the top and then working downward. When you have more than two data items, subsequent data items are linked to the resulting dataset of the linked data items above it. For example, when you link the first two data items, the query generates a dataset. When you add another data item, the data item is linked to the dataset of the first linked pair of data items, where it applies the conditions that are specified by its DataItemLink property and DataItemLinkType property. The following illustration shows an example with three data items.  
  
 ![Query Designer showing 3 data item links.](media/NAV_Query_Designer_Sample_3_DataItemLink.png "NAV\_Query\_Designer\_Sample\_3\_DataItemLink")  
  
 This pattern continues for each additional data item.  
  
## Setting the DataItemLink Property  
 The DataItemLink property sets up a reference between one or more columns of the data item tables for combining records. In a query, two data item tables typically will have columns that have values that are common to both tables. For example, the Salesperson table and Sales Header table have the Code column and Salesperson\_Code column in common. To create a link between these two tables, you could add the following value in the DataItemLink property of the **Sales Header** data item.  
  
|Field|Reference DataItem|Reference Field|  
|-----------|------------------------|---------------------|  
|Salesperson code|Salesperson\_Purchaser|Code|  
  
 The DataItemLink property sets up "equal to" \(=\) comparison condition between two columns of the data items. When the query is run, the query compares each row of the two data items to find records that having matching values for the columns. Records that have matching column values are combined into a row in the resulting dataset. In some cases, there will be records that do not have matching values. You use the DataItemLinkType property to include records that do not have matching column values.  
  
## Setting Up the DataItemLinkType Property  
 You use the data item link type to limit the records that are included in the resulting dataset based on the conditions of the DataItemLink property. You have the following options from which to choose:  
  
-   Exclude Row If No Match  
  
-   Use Default Values If No Match  
  
-   SQL Advanced Options  
  
     The SQL Advanced Options provide alternatives to **Always Include** and **Include Matches Only** that correspond to joins in SQL SELECT statements. For more information, see [SQL Advanced Options for Data Item Link Types](SQL-Advanced-Options-for-Data-Item-Link-Types.md).  
  
### Exclude Row If No Match  
 The resulting dataset of the **Exclude Row If No Match** link type contains only records from both data item tables that have matching values for the columns that are linked by the DataItemLink property. The query finds the records from each data item that have matching column values, and then, for each pair of records, a row is added to the dataset that includes the columns from the two data items.  
  
 For example, the following table shows the resulting dataset of the sample query when the DataItemLinkType property is set to **Exclude Row If No Match**.  
  
|Name|No|Sell\_to\_Customer\_Name|  
|----------|--------|------------------------------|  
|Annette|1000|Autohaus|  
|Debra|2000|Blanemark|  
|John|3000|Candoxy|  
  
 The records for **Bart** in the Salesperson table and **New Concepts** in the Sales Header table do not have matching records in the opposing table, so they are excluded from the resulting dataset.  
  
### Use Default Values If No Match  
 The resulting dataset of the **Use Default Values If No Match** link type contains all the records from the upper data item or data items; even if a record does not have a matching value in the linked column of lower data item as specified by the DataItemLink property. For each record in the upper data item, the query adds a row in the dataset that combines columns from the upper and lower data item. When a record does not have a matching record in the lower data item, the columns from the lower data item include the default value for the data type of the table field that specifies the column. For example, if the field has an integer data type, then the default value is 0.  
  
 For example, the following table shows the resulting dataset of the sample query when the DataItemLinkType property is set to **Use Default Values If No Match**.  
  
|Name|No|Sell\_to\_Customer\_Name|  
|----------|--------|------------------------------|  
|Annette|1000|Autohaus|  
|Bart|null|null|  
|Debra|2000|Blanemark|  
|John|3000|Candoxy|  
  
 The record for **Bart** in the Salesperson table does not have a matching record in the Sales Header table, so a row is included but the columns from the Sale Header table are given a null value. The record in the Sale Header table for **New Concepts** is not included in the resulting dataset because it does not have a matching column in the Salesperson table.  
  
## See Also  
 [How to: Create Queries](How-to--Create-Queries.md)   
 [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md)   
 [Walkthrough: Creating a Query That Uses a Totaling Method and Sorting](Walkthrough--Creating-a-Query-That-Uses-a-Totaling-Method-and-Sorting.md)   
 [Walkthrough: Creating a Query to Link Three Tables](Walkthrough--Creating-a-Query-to-Link-Three-Tables.md)