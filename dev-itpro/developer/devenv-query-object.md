---
title: "Query Object"
description: "Description of the query object."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
author: jswymer
---

# Query Object

[!INCLUDE[prodshort](includes/prodshort.md)] query objects enable you to retrieve records from one or more tables and then combine the data into rows and columns in a single dataset. Query objects can also perform calculations on data, such finding the sum or average of all values in a column of the dataset.

There are two types of query objects: normal and API. This article describes normal query objects, which can be used to display data in the user interface. API query objects are used to generate web service endpoints and cannot be displayed in the user interface. For information about creating a query of the type API, see [API Query Type](devenv-api-querytype.md).
<!-- 
A query describes a dataset of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. You can query to retrieve fields from a single table or multiple tables. You can specify how to join tables in the query and filter the result data, and you can specify totaling methods on fields, such as sums and averages. Queries retrieve records from one or more tables and combine the records into rows and columns in a single dataset. You create a query by adding a Query object file to your project.

A Query object is defined ists of two main elements, `dataitem` and `column` elements. The `dataitem` element specifies the table to retrieve records from. The `column` element specifies a field of the table to include in the resulting dataset of a query.
-->

## Creating a query object

A query object is comprised mainly of two different types of elements: dataitems and columns. A dataitem specifies the table to retrieve records from. A column specifies a field of the table to include in the resulting dataset of a query. The basic steps to create a query object are as follows:

1. Add the `query` keyword, followed by the `elements` control.
2. Build the dataset by adding `dataitem` controls and `column` controls within the `elements` control.

    The hierarchy of the `dataitem` and `column` controls is important because it will determine the sequence in which data items are linked, which in turn will control the results. Working from top-to-bottom, you start by adding the `dataitem` control for first table that you want in the dataset, then add `column` controls for each table field that you want to include in the dataset. For the next table, you add another `dataitem` control that is embedded within the first `dataitem` control, then add `column` controls as needed. You continue this pattern for additional tables and fields.
3. When you have specified the dataitem and column elements, create links and joins between the `dataitem` elements.

   Dataitem links and joins determine which records to include in the dataset based on the values of a common field between dataitems. You set a link between one or more fields of the dataitem tables with the [DataItemLink Property](properties/devenv-dataitemlink-query-property.md) and you define the type of the link using the [SQLJoinType Property](properties/devenv-sqljointype-property.md). Both properties must be set on the lower dataitem of the query object. For more information, see [Linking and Joining Data Items](devenv-query-links-joins.md).

The following shows the basic structure of a query object.

```
query ID Name
{

    elements
    {
        dataitem(DataItem1; Table1)
        {
            column(Column1; Field1)
            {
            }
            column(Column2; Field2)
            {
            }
            dataitem(DataItem2; Table2)
            {
                // Sets a link between FieldY of Table2 and FieldX of Table1.
                DataItemLink = FieldY = DataItem1.FieldX;
                //The dataset contains records from Table1 and Table2 where a match is found between FieldY and FieldX.
                SqlJoinType = InnerJoin;

                column(Column1; Field1)
                {
                }
                dataitem(DataItem3; Table3)
                {
                    DataItemLink = FieldZ = DataItem2.FieldY;
                    SqlJoinType = InnerJoin;
                    column(Column1; Field1)
                    {
                    }
                }
            }
        }
    }
}

```
<!-- 
The `column` control specifies a field of the table to include in the resulting dataset of a query. You start by adding a `dataitem` control for a table, then within  `dataitem` control, add the `column` controls.

When you have more than one `dataitem` element, you add the `dataitem` in an embedded hierarchy, where the second  `dataitem` element is embedded in the first element, the third `dataitem` element is embedded in the second element, and so on. 


When you have specified the dataitem and column elements, you create links between the dataitem elements. A dataitem link determines which records to include in the dataset based on a common field between two dataitems.
-->

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

## Snippet support
Typing the shortcut ```tquery``` will create the basic layout for a Query object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Query example
The following example shows a query that displays a list of customers with sales and profit figures. The query primarily retrieves fields from the **Customer** table, but also displays fields from the **Salesperson Purchaser** and **Country Region** tables.

The query also uses the DataItemLink property to create a link between the **Customer** table, **Salesperson Code** field and the **Salesperson Purchaser** table, **Code** fields and a link between the **Customer** table, **Country/Region Code** field and the **Country/Region** table, **Code** field. 

```
query 50102 "Top Customer Overview"
{
    QueryType = Normal;
    Caption = 'Top Customer Overview';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            {
            }
            column(No; "No.")
            {
            }
            column(Sales_LCY; "Sales (LCY)")
            {
            }
            column(Profit_LCY; "Profit (LCY)")
            {
            }
            column(Country_Region_Code; "Country/Region Code")
            {
            }
            column(City; City)
            {
            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {
            }
            column(Salesperson_Code; "Salesperson Code")
            {
            }
            dataitem(Salesperson_Purchaser; "Salesperson/Purchaser")
            {
                DataItemLink = Code = Customer."Salesperson Code";
                column(SalesPersonName; Name)
                {
                }
                dataitem(Country_Region; "Country/Region")
                {
                    DataItemLink = Code = Customer."Country/Region Code";
                    column(CountryRegionName; Name)
                    {
                    }
                }
            }
        }
    }
}
```

> [!IMPORTANT]  
>  You cannot run a query that gets data from both the application database and the business data database. This also applies to single-tenant deployments so that you do not have to rewrite queries if you decide to export the application. For a description of which tables are considered part of the application database, see [Separating Application Data from Business Data](../deployment/Separating-Application-Data-from-Business-Data.md).

## See Also

[Linking and Joining Data Items](devenv-query-links-joins.md)  
[Aggregating Data in Query Objects](devenv-query-totals-grouping.md)  
[Query Objects and Performance](../administration/optimize-sql-query-objects-and-performance.md)  
[Query Properties](properties/devenv-query-properties.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[API Query Type](devenv-api-querytype.md)  
