---
title: "GETFILTERS Function (Query)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4900997c-a171-4bbf-8939-5fecf6ac3f2a
caps.latest.revision: 15
manager: edupont
---
# GETFILTERS Function (Query)
Returns the filters that are applied to all columns in the query.  
  
 The following code shows the syntax of the **GETFILTERS** function. `Query` is a variable of the Query data type that specifies the query object.  
  
## Syntax  
  
```  
  
Filter := Query.GETFILTERS  
```  
  
## Return Value  
 Type: Text  
  
 A text string that lists the filters that are set on all columns of the query. If there are no applicable filters, then an empty string is returned.  
  
## Remarks  
 The **GETFILTERS** function returns the filters that are currently set for all data columns and filter rows by the [SETFILTER Function \(Query\)](SETFILTER-Function--Query-.md) function, [SETRANGE Function \(Query\)](SETRANGE-Function--Query-.md) function, and the [ColumnFilter Property](ColumnFilter-Property.md) in Query Designer. The **GETFILTER** function does not return filters that are set on a column's source field by the [DataItemTableFilter Property](DataItemTableFilter-Property.md) in Query Designer or global filters that are set by the **FILTERGROUP** function.  
  
> [!NOTE]  
>  A filter row is row in Query Designer that is used to filter on a field that is not included in the resulting dataset. For more information, see [Understanding Query Filters](Understanding-Query-Filters.md) and [How to: Set Up Filter Rows in Query Designer](How-to--Set-Up-Filter-Rows-in-Query-Designer.md).  
  
 You can call the **GETFILTERS** function multiple times and at any point in the code. If you call the **GETFILTERS** function before the first **SETFILTER** or **SETRANGE** function call, then the **GETFILTERS** function returns only filters that are set by the **ColumnFilter** property of the columns.  
  
 Filters that are set by the **SETFILTER** function and **SETRANGE** function are applied to a query when the query is opened by using a call to the **OPEN**, the **SAVEASXML**, or **SAVEASCSV** functions. You must consider the location of the **GETFILTERS** function with respect to these functions to obtain the results that you want. For example, in the following two code examples, the **GETFILTERS** function will return the filter set by the **SETFILTER** function call. However, in the first example, the filter has been applied to the query dataset; in the second example, the filter has not been applied.  
  
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
 The following C/AL code example demonstrates how to use the **GETFILTERS** function on a query. The example code sets filters on a query column, and then displays a message when the query is run that indicates the filter on the column.  
  
 This example requires that you do the following:  
  
1.  Create a query called **Customer\_SalesQuantity** that has the following characteristics:  
  
    -   Links table **18 Customer** with table **37 Sales Lines** from the [!INCLUDE[demolong](includes/demolong_md.md)].  
  
    -   Includes columns for the **Name** and **No.** fields from the **Customer** table and the **Quantity** field from **Sales Lines** table.  
  
         For step-by-step instructions for creating this query, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md).  
  
    -   The **ColumnFilter** property of the **Quantity** column is set with a filter that includes values greater than 10.  
  
2.  Create the following C/AL variables and text constant in the object that will run the query.  
  
    |Variable name|DataType|Subtype|  
    |-------------------|--------------|-------------|  
    |MyQuery|Query|Customer\_SalesQuantity|  
    |MyFilters|Text|Not applicable|  
  
    |Text constant name|ENU Value|  
    |------------------------|---------------|  
    |Text000|The filters are as follows: %1|  
  
 The following C/AL code runs the query and displays a message that contains the filter that is set on a query column. You can add the code to the OnRun trigger of a codeunit, and then run the codeunit to see the results.  
  
```  
// Sets a filter to display only sales quantities greater than 10. This overwrites the value of ColumnFilter property.  
MyQuery.SETFILTER(Quantity, '>10');  
// Sets a filter to display the columns with the value Selangorian Ltd. only.  
MyQuery.SETFILTER(NAME, 'Selangorian Ltd.');  
// Runs the query and applies the filter.  
MyQuery.OPEN;  
// Returns the filters that are on the Quantity column and displays the filters in a message.  
MyFilters := MyQuery.GETFILTERS;  
MESSAGE(Text000, MyFilters);  
```  
  
 Running the code returns the following message:  
  
 **The filters are as follows: Quantity > 10, Name = Selangorian Ltd.**  
  
## See Also  
 [How to: Set Up Filter Rows in Query Designer](How-to--Set-Up-Filter-Rows-in-Query-Designer.md)   
 [Understanding Query Filters](Understanding-Query-Filters.md)