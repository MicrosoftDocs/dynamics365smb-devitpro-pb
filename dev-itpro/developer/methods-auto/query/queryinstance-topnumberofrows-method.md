---
title: "Query.TopNumberOfRows Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Query.TopNumberOfRows Method
> **Version**: _Available or changed with runtime version 1.0._

Specifies the maximum number of rows to include in the resulting data set of a query.


## Syntax
```
[CurrentRows := ]  Query.TopNumberOfRows([NewRows: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Query*
&emsp;Type: [Query](query-data-type.md)
An instance of the [Query](query-data-type.md) data type.

*NewRows*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of rows to include in the resulting data set. If you do not set the NewRows parameter, then the resulting data set will include all rows. If you set the value to 0, then there is no limit and all rows of the data set are returned.
          


## Return Value
*CurrentRows*
&emsp;Type: [Integer](../integer/integer-data-type.md)
Gets the current maximum number of rows included in the resulting data set


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
You use the **TopNumberOfRows** method to limit the resulting dataset to the first set of rows that are generated for the query. For example, you can include only the first 10 or first 100 rows in the resulting dataset. The **TopNumberOfRows** method is useful for key performance indicators such as the top number of customers or sales.  
  
You can also specify the number of rows to include in the dataset by setting the [TopNumberOfRows Property](../../properties/devenv-topnumberofrows-property.md). The **TopNumberOfRows** method will overwrite the **TopNumberOfRows** property setting.  
  
## Example  
This code example demonstrates how to use the **TopNumberOfRows** method on a query to return the top 10 customer sales orders based on the quantity of items.

The following query object links table **18 Customer** and table **37 Sales Line** and uses the **TopNumberOfRows** property to get top 5 customer sales orders based on the quantity of items.
  
```al
query 50123 "Customer_Sales_Quantity"
{
    QueryType = Normal;
    // Sets the resultS to include the top 5 the results in descending order
    TopNumberOfRows = 5;
    OrderBy = descending(Qty);

    elements
    {
        dataitem(C; Customer)
        {
            column(Customer_Number; "No.")
            {
            }

            column(Customer_Name; Name)
            {
            }

            dataitem(SL; "Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = c."No.";
                SqlJoinType = InnerJoin;

                column(Qty; Quantity)
                {
                }
            }
        }
    }
}
```

The following codeunit runs the query, saves it as a CSV file, and displays a message that states the number of rows that are returned in the resulting dataset.

```al
codeunit 50100 MyQueryTop10
{
    trigger OnRun()
    begin

        // Overwrites the TopNumberOfRows property and returns the first 10 rows in the dataset.  
        //MyQuery.TopNumberOfRows(10);
        // Opens the query.  
        MyQuery.Open;
        // Reads each row of the dataset and counts the number of rows.  
        while MyQuery.Read do begin
            Counter += 1;
        end;
        // Saves the dataset as a CSV file.  
        MyQuery.SaveAsCsv('c:\temp\CustomerSales.csv');
        // Displays a message that shows the number of rows.  
        Message(Text000, counter);

    end;

    var
        MyQuery: Query "Customer_Sales_Quantity";
        Counter: Integer;
        Text000: Label 'count %1.';
}
```

## See Also
[Query Data Type](query-data-type.md)  
[Query Object](../../devenv-query-object.md)  
[Linking and Joining Data Items](../../devenv-query-links-joins.md)  
[Aggregating Data in Query Objects](../../devenv-query-totals-grouping.md)  
[Filtering Data in Query Objects](../../devenv-query-filters.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)