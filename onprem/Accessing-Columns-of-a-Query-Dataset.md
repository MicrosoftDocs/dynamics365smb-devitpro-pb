---
title: "Accessing Columns of a Query Dataset"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 261c896a-4b7b-4b46-b874-2c032e7096be
caps.latest.revision: 9
---
# Accessing Columns of a Query Dataset
If the query is in the reading state, you can retrieve the value of columns in the current active row of the dataset by using the following syntax in C/AL.  

## Syntax  

```  
ColumnValue := QueryVariable.ColumnName  
```  

-   *QueryVariable* is a variable of the Query data type that specifies the query object.  

-   *ColumnName* is the name of the column in the query as specified by the [Name Property](Name-Property.md) of the column.  

## Return Value  
 Type: The data type of the field that is used by the column, unless the column applies a totaling method as specified by the [Method Property](Method-Property.md). If the column applies a totaling method, then data type is an integer for the Count method and a decimal for all other totaling methods  

 Returns the value of the column in the current active row.  

## Remarks  
 A column of a row can only be accessed after the query has been opened by using a call to the **OPEN** function followed by a call to the **READ** function. The current active row is the row that has been included in the query variable after the last call to **READ** function.  

## Example  
 The following example demonstrates how to access a column of a query dataset. When the query is run, each row in the dataset is read and message box is displayed that contains the value of a column in the row.  

 This example requires that you do the following:  

-   Create a query called **Customer\_SalesQuantity** that links table **18 Customer** with table **37 Sales Lines** from the [!INCLUDE[demolong](includes/demolong_md.md)]. Include columns for the **Name** and **No.** fields from the Customer table and the **Quantity** field from Sales Lines table.  

     For step-by-step instructions for creating this query, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md).  

-   Create the following variable and text constant:  

    |Variable name|DataType|Subtype|  
    |-------------------|--------------|-------------|  
    |myQuery|Query|Customer\_SalesQuantity|  

    |Text constant name|ENU Value|  
    |------------------------|---------------|  
    |Text000|Customer name = %1, Quantity = %2|  

 The following C/AL code opens the query, reads each row of dataset, and then displays a message that has the content of each row. You can add the code to a codeunit, and then run the codeunit to see the results.  

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
// Closes the query.  
MyQuery.CLOSE;  
```
