---
title: "Query.GetFilters Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Query.GetFilters Method
Returns the filters that are applied to all columns in the query. The following code shows the syntax of the GETFILTERS method. Query is a variable of the Query data type that specifies the query object.


## Syntax
```
Filter :=   Query.GetFilters()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*Query*  
&emsp;Type: [Query](query-data-type.md)  
An instance of the [Query](query-data-type.md) data type.  

## Return Value
*Filter*  
&emsp;Type: [String](../string/string-data-type.md)  
All filters of the query  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The **GETFILTERS** method returns the filters that are currently set for all data columns and filter rows by the [SETFILTER Method \(Query\)](../../methods-auto/query/queryinstance-setfilter-method.md) method, [SETRANGE Method \(Query\)](../../methods-auto/query/queryinstance-setrange-method.md)method, and the [ColumnFilter Property](../../properties/devenv-columnfilter-property.md). The **GETFILTER** method does not return filters that are set on a column's source field by the [DataItemTableFilter Property](../../properties/devenv-dataitemtable-filter-property.md) or global filters that are set by the **FILTERGROUP** method.  

<!-- Links For more information, see [Understanding Query Filters](Understanding-Query-Filters.md) and [How to: Set Up Filter Rows in Query Designer](How-to-Set-Up-Filter-Rows-in-Query-Designer.md). -->  
  
 You can call the **GETFILTERS** method multiple times and at any point in the code. If you call the **GETFILTERS** method before the first **SETFILTER** or **SETRANGE** method call, then the **GETFILTERS** method returns only filters that are set by the **ColumnFilter** property of the columns.  
  
 Filters that are set by the **SETFILTER** method and **SETRANGE** method are applied to a query when the query is opened by using a call to the **OPEN**, the **SAVEASXML**, or **SAVEASCSV** methods. You must consider the location of the **GETFILTERS** method with respect to these methods to obtain the results that you want. For example, in the following two code examples, the **GETFILTERS** method will return the filter set by the **SETFILTER** method call. However, in the first example, the filter has been applied to the query dataset; in the second example, the filter has not been applied.  
  
```  
Query.SETFILTER(Column, String);  
Query.OPEN;   
Query.GETFILTERS;  
Query.READ;  
```  
  
```  
Query.OPEN;   
Query.SETFILTER(Column, String);  
Query.GETFILTERS;  
Query.READ;  
```  
  
## Example  
 The following AL code example demonstrates how to use the **GETFILTERS** method on a query. The example code sets filters on a query column, and then displays a message when the query is run that indicates the filter on the column.  
  
 This example requires that you create a query called **Customer\_SalesQuantity** that has the following characteristics:  
  
-   Links table **18 Customer** with table **37 Sales Lines** from the [!INCLUDE[demolong](../../includes/demolong_md.md)].  

-   Includes columns for the **Name** and **No.** fields from the **Customer** table and the **Quantity** field from **Sales Lines** table.  

        <!--NAV For step-by-step instructions for creating this query, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md).-->  

-   The **ColumnFilter** property of the **Quantity** column is set with a filter that includes values greater than 10.  
  
 The following AL code runs the query and displays a message that contains the filter that is set on a query column. You can add the code to the OnRun trigger of a codeunit, and then run the codeunit to see the results.  
  
```  
var
    MyQuery: Query "Customer SalesQuantity";
    MyFilter: Text;
    Text000: Label 'The filters are as follows: %1';
begin
    // Sets a filter to display only sales quantities greater than 10. This overwrites the value of ColumnFilter property.  
    MyQuery.SETFILTER(Quantity, '>10');  
    // Sets a filter to display the columns with the value Selangorian Ltd. only.  
    MyQuery.SETFILTER(NAME, 'Selangorian Ltd.');  
    // Runs the query and applies the filter.  
    MyQuery.OPEN;  
    // Returns the filters that are on the Quantity column and displays the filters in a message.  
    MyFilters := MyQuery.GETFILTERS;  
    MESSAGE(Text000, MyFilters);  
end;
```  
  
 Running the code returns the following message:  
  
 **The filters are as follows: Quantity > 10, Name = Selangorian Ltd.**  
  

## See Also
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)