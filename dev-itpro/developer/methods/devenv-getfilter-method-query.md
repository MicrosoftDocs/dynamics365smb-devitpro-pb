---
title: "GETFILTER Method (Query)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 3baf4cbe-97ee-449f-b9ba-9c8947a4998c
caps.latest.revision: 18
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETFILTER Method (Query)
Returns the filters that are set on the field of a specified column in the query.  
  
 The following code shows the syntax of the **GETFILTER** method. `Query` is a variable of the Query data type that specifies the query object.  
  
## Syntax  
  
```  
  
Filter := Query.GETFILTER(Column)  
```  
  
#### Parameters  
 *Column*  
 Type: Text  
  
 The name of the column in the query. A column name is defined by the [Name Property](../properties/devenv-Name-Property.md) in Query Designer.  
  
## Return Value  
 Type: Text  
  
 A text string that lists all the filters that are set on the column of the query. If there are no filters, then an empty string is returned.  
  
## Remarks  
 The **GETFILTER** method returns the filters that are currently set for a data column or filter row by the [SETFILTER Method \(Query\)](devenv-SETFILTER-Method-Query.md) method, [SETRANGE Method \(Query\)](devenv-SETRANGE-Method-Query.md) method, and the column's [ColumnFilter Property](../properties/devenv-ColumnFilter-Property.md) in Query Designer. The **GETFILTER** method does not return filters that are set on a column's source field by the [DataItemTableFilter Property](../properties/devenv-DataItemTable-Filter-Property.md) in Query Designer or global filters that are set by the **FILTERGROUP** method.  
  
> [!NOTE]  
>  A filter row is row in Query Designer that is used to filter on a field that is not included in the resulting dataset. <!--Links For more information, see [Understanding Query Filters](Understanding-Query-Filters.md) and [How to: Set Up Filter Rows in Query Designer](How-to--Set-Up-Filter-Rows-in-Query-Designer.md).-->  
  
 You can call the **GETFILTER** method multiple times and at any point in the code. If you call the **GETFILTER** method before the **SETFILTER** or **SETRANGE** method, then the **GETFILTER** method returns only filters on the column that are set by the column's ColumnFilter property.  
  
 Filters that are set by the **SETFILTER** method and **SETRANGE** method are applied to a query when the query is opened with a call to the **OPEN**, **SAVEASXML**, or **SAVEASCSV** methods. You must consider the location of the **GETFILTERS** method with respect to these methods to obtain the desired results. For example, in the following two code examples, the **GETFILTER** method will return the filter that is set by the **SETFILTER** method. However, in the first example, the filter has been applied to the query dataset; in the second example, the filter has not been applied.  
  
```  
Query.SETFILTER(Column, String);  
Query.OPEN;   
Query.GETFILTER(Column);  
Query.READ;  
```  
  
```  
Query.OPEN;   
Query.SETFILTER(Column, String);  
Query.GETFILTER(Column);  
Query.READ;  
```  
  
## Example  
 The following AL code example demonstrates how to use the **GETFILTER** method on a query. The example code sets a filter on a query column, and then displays a message when the query is run that indicates the filter on the column.  
  
 This example requires that you do the following:  
  
1.  Create a query called **Customer\_SalesQuantity** that has the following characteristics:  
  
    -   Links table **18 Customer** with table **37 Sales Lines** from the CRONUS International Ltd. demonstration database.  
  
    -   Includes columns for the **Name** and **No.** fields from the **Customer** table and the **Quantity** field from **Sales Lines** table.  
  
         <!--NAV For step-by-step instructions for creating this query, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md).-->  
  
    -   The ColumnFilter property of the **Quantity** column is set to include values greater than 5.  
  
2.  Create the following AL variables and text constant in the object that will run the query, such as a codeunit.  
  
    |Variable name|DataType|Subtype|  
    |-------------------|--------------|-------------|  
    |MyQuery|Query|Customer\_SalesQuantity|  
    |MyFilter|Text|Not applicable|  
  
    |Text constant name|ENU Value|  
    |------------------------|---------------|  
    |Text000|The filter is: %1|  
  
 The following AL code runs the query and displays a message that contains the filter that is set on a query column. You can add the code to a codeunit, and then run the codeunit to see the results.  
  
```  
// Sets a filter to display only sales quantities greater than 10. This overwrites the ColumnFilter property.  
MyQuery.SETFILTER(Quantity, '>10');  
// Runs the query and applies the filter.  
MyQuery.OPEN;  
// Returns the filter on the Quantity column and displays the filter in a message.  
MyFilter := MyQuery.GETFILTER(Quantity);  
MESSAGE(Text000, MyFilter);  
```  
  
 Running the code returns the following message:  
  
 **The filter is: Quantity > 10**