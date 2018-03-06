---
title: "CLOSE Function (Query)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d4cf28df-1382-437a-9579-eb160dc94417
caps.latest.revision: 14
manager: edupont
---
# CLOSE Function (Query)
Closes a query dataset and returns the query instance to the initialized state.  

 The following code shows the syntax of the **CLOSE** function.  *Query* is a variable of the Query data type that specifies the query object.  

## Syntax  

```  

Query.CLOSE  
```  

## Remarks  
 The **CLOSE** function does not clear any filters that are set by the SETFILTERS function. If you want to clear the filters, then you must call the CLEAR function.  

 In most cases, you do not have to call the **CLOSE** function explicitly. The **CLOSE** function is called implicitly when the following conditions are true:  

-   When the query variable goes out of scope.  

-   When the **OPEN** function is called on a dataset that is currently open.  

-   When the [SETFILTER Function \(Query\)](SETFILTER-Function--Query-.md) or [SETRANGE Function \(Query\)](SETRANGE-Function--Query-.md) are called on a dataset that is currently open.  

## Example  
 The following example demonstrates how to use the **CLOSE** function on a query. The example code sets filters on the query, opens the query, and then reads the dataset. For each row in the dataset, a message box is displayed that contains the values of the columns in the row.  

 This example requires that you do the following:  

-   Create a query called **Customer\_SalesQuantity** that is links table **18 Customer** with table  **37 Sales Lines** from the [!INCLUDE[demolong](includes/demolong_md.md)]. Include columns for the **Name** and **No.** fields from the Customer table and the **Quantity** field from Sales Lines table.  

     For step-by-step instructions for creating this query, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md).  

-   Create the following variable and text constant  

    |Variable name|DataType|Subtype|  
    |-------------------|--------------|-------------|  
    |MyQuery|Query|Customer\_SalesQuantity|  

    |Text constant name|ENU Value|  
    |------------------------|---------------|  
    |Text000|Customer name = %1, Quantity = %2|  

 The following C/AL code opens the query, reads each row of the dataset, and then closes the query. You can add the code to a codeunit, and then run the codeunit to see the results.  

```  
// Sets a filter to display only sales quantities greater than 20.  
MyQuery.SETFILTER(Quantity, '>20');   
// Runs the query.  
MyQuery.OPEN;  
// Reads each row in the dataset and displays a message with column values.   
// Stops reading when there are no more rows remaining in the dataset (READ is FALSE).  
WHILE MyQuery.READ DO  
BEGIN  
  MESSAGE(Text000, MyQuery.Name, MyQuery.Quantity);   
END;  
MyQuery.CLOSE;  
```  

## See Also  
 [How to: Create Queries](How-to--Create-Queries.md)   
 [Working with Queries in C/AL](Working-with-Queries-in-C-AL.md)   
 [Queries](Queries.md)
