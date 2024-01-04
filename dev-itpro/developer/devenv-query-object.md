---
title: Query object
description: Description of the AL query object.
ms.custom: bap-template
ms.date: 09/24/2023
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.author: jswymer
author: jswymer
---

# Query object

[!INCLUDE[prod_short](includes/prod_short.md)] query objects enable you to retrieve records from one or more tables and then combine the data into rows and columns in a single dataset. Query objects can also perform calculations on data, such finding the sum or average of all values in a column of the dataset.

There are two types of query objects: normal and API. This article describes normal query objects, which can be used to display data in the user interface. API query objects are used to generate web service endpoints and cannot be displayed in the user interface. For information about creating a query of the type API, see [API Query Type](devenv-api-querytype.md).

## Creating a query object

A query object is comprised mainly of two different types of elements: dataitems and columns. A dataitem specifies the table to retrieve records from. A column specifies a field of the table to include in the resulting dataset of a query. The basic steps to create a query object are as follows:

1. Add the `query` keyword, followed by the `elements` control.
2. Build the dataset by adding `dataitem` controls and `column` controls within the `elements` control.

    The hierarchy of the `dataitem` and `column` controls is important because it will determine the sequence in which data items are linked, which in turn will control the results. Working from top-to-bottom, you start by adding the `dataitem` control for first table that you want in the dataset, then add `column` controls for each table field that you want to include in the dataset. For the next table, you add another `dataitem` control that is embedded within the first `dataitem` control, then add `column` controls as needed. You continue this pattern for additional tables and fields.
3. When you have specified the dataitem and column elements, create links and joins between the `dataitem` elements.

   Dataitem links and joins determine which records to include in the dataset based on the values of a common field between dataitems. You set a link between one or more fields of the dataitem tables with the [DataItemLink Property](properties/devenv-dataitemlink-query-property.md) and you define the type of the link using the [SQLJoinType Property](properties/devenv-sqljointype-property.md). Both properties must be set on the lower dataitem of the query object. For more information, see [Linking and Joining Data Items](devenv-query-links-joins.md).

The following shows the basic structure of a query object.

```AL
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
Typing the shortcut `tquery` will create the basic layout for a Query object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Query example
The following example shows a query that displays a list of customers with sales and profit figures. The query primarily retrieves fields from the **Customer** table, but also displays fields from the **Salesperson Purchaser** and **Country Region** tables.

The query also uses the DataItemLink property to create a link between the **Customer** table, **Salesperson Code** field and the **Salesperson Purchaser** table, **Code** fields and a link between the **Customer** table, **Country/Region Code** field and the **Country/Region** table, **Code** field. 

```AL
query 50102 "Top Customer Overview"
{
    QueryType = Normal;
    Caption = 'Top Customer Overview';

    // Teaching tip title and text. Available from version 23
    AboutTitle = 'Analyze your customers (slice and dice your data)';
    AboutText = 'Use this data cube to analyze your customers. You can group and/or the data on any dimension you like.';

    // Controls the help link for this query. Available from version 23
    ContextSensitiveHelpPage = 'customer_query_help.html';

    // Category to show the query under in Tell Me (search) and in role explorer under Report and Analysis. Available from version 23
    UsageCategory = ReportsAndAnalysis;


    DataAccessIntent = ReadOnly; // use this to read data from the secondary database replica to speed up performance

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

By setting the [UsageCategory property](properties/devenv-usagecategory-property.md), you can can make queries discoverable for users in Tell Me search and in the role explorer under Report and Analysis. You can provide teaching tips by setting the properties [AboutTitle](properties/devenv-abouttitle-property.md) and [AboutText](properties/devenv-abouttext-property.md), and provide dedicated help links on the query object to help users understand how to use the query by setting the [ContextSensitiveHelpPage property](properties/devenv-contextsensitivehelppage-property.md).


> [!IMPORTANT]  
>  You cannot run a query that gets data from both the application database and the business data database. This also applies to single-tenant deployments so that you do not have to rewrite queries if you decide to export the application. For a description of which tables are considered part of the application database, see [Separating Application Data from Business Data](../deployment/Separating-Application-Data-from-Business-Data.md).


## View and analyze query data
Available from version 23, you can view and analyze query data directly from the [!INCLUDE[prod_short](includes/prod_short.md)] client by running the query, and then switching to in the analysis mode. The data is analyzed in real time and respects the data security that has been set up for the users.

There are a couple ways to run a query. One way to run a query is to use the `query=<id>` in the web client URL. For example, this URL opens the query that has the the ID 102:

```http
https://businesscentral.dynamics.com/?company=CRONUS%20USA%2C%20Inc.&query=102
```

Another way to run the query is to add an action on a page and use the [RunObject property](properties/devenv-runobject-property.md). The following example shows how to add an action that opens a query on the **Item** l List page:

```AL
pageextension 50110 ItemListWithQuery extends "Item List"
{

    actions
    {
        addbefore("Inventory - List")
        {
            action("Analyze customers")
            {
                ApplicationArea = All;
                Caption = 'Analyze customers';
                RunObject = query "Top Customer Overview";
                Tooltip = 'Open the customer query in analysis mode.';
                Image = Item;
            }
        }
    }
}
```

Once the query opens in the client, turn on the **Analyze** switch to change to analysis mode.

Learn more at [Analyze list page and query data using data analysis mode](/dynamics365/business-central/analysis-mode).



## See Also

[Linking and Joining Data Items](devenv-query-links-joins.md)  
[Aggregating Data in Query Objects](devenv-query-totals-grouping.md)  
[Query Objects and Performance](../administration/optimize-sql-query-objects-and-performance.md)  
[Query Properties](properties/devenv-query-properties.md)  
[Query DataAccessIntent](properties/devenv-dataaccessintent-property.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[API Query Type](devenv-api-querytype.md)  
