---
title: "Accessing Columns of a Query Dataset"
ms.date: 04/29/2024
ms.topic: concept-article
author: jswymer
---
# Accessing Columns of a Query Dataset

If the query is in the reading state, you can retrieve the value of columns in the current active row of the dataset by using the following syntax in AL.  

## Syntax  

```AL
ColumnValue := QueryVariable.ColumnName  
```  

-   *QueryVariable* is a variable of the Query data type that specifies the query object.  

-   *ColumnName* is the name of the column in the query object.  

## Return Value

 The data type of the field that is used by the column, unless the column applies a totaling method as specified by the [Method Property](properties/devenv-method-property.md). If the column applies a totaling method, then data type is an integer for the `Count` method and a decimal for all other totaling methods.  

 Returns the value of the column in the current active row.  

## Remarks  
 A column of a row can only be accessed after the query has been opened by using a call to the [Open Method](methods-auto/query/queryinstance-open-method.md) followed by a call to the [Read Method](methods-auto/query/queryinstance-read-method.md). The current active row is the row that has been included in the query variable after the last call to [Read Method](methods-auto/query/queryinstance-read-method.md).  

## Example  
This example demonstrates how to access a column of a query dataset. When the query is run, each row in the dataset is read and message box is displayed that contains the value of a column in the row.  

The following query object links table **18 Customer** and table **37 Sales Line**.
  
```AL
query 50123 Customer_Sales_Quantity
{
    QueryType = Normal;
    // Sets the results to only include the top forts the results in descending order
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
                DataItemLink = "Sell-to Customer No." = C."No.";
                SqlJoinType = InnerJoin;

                column(Qty; Quantity)
                {
                }
            }
        }
    }
}
```

The following codeunit opens the query, reads each row of dataset, and then displays a message that has the content of each row.

```AL  
codeunit 50100 QueryColumnAccess
{
    trigger OnRun()
    var
        MyQuery: Query Customer_Sales_Quantity;
    begin

        // Sets a filter to display only sales quantities greater than 20.  
        MyQuery.SetFilter(Qty, '>20');

        // Opens the query for reading.
        MyQuery.Open;

        // Reads each row in the dataset and displays a message with column values.  
        // Stops reading when there are no more rows remaining in the dataset (Read returns FALSE).  
        while MyQuery.Read do begin
            Message(MyLabel, MyQuery.Customer_Name, MyQuery.Qty);
        end;

        // Closes the query.  
        MyQuery.Close;
    end;

    var
        MyLabel: Label 'Customer name = %1, Quantity = %2.';
}
```

## Related information

[Query Object](devenv-query-object.md)  
[Filtering Queries](devenv-query-filters.md)  
[Aggregating Data](devenv-query-totals-grouping.md)  
