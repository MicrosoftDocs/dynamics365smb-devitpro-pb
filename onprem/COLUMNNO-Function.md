---
title: "COLUMNNO Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5305add4-662d-4624-9a92-a9f9c3e7939c
caps.latest.revision: 6
manager: edupont
---
# COLUMNNO Function
Returns the ID that is assigned to a query column in the query definition.  
  
## Syntax  
  
```  
  
Number := Query.COLUMNNO(Column)  
```  
  
#### Parameters  
 *Query*  
 Type: Query  
  
 A variable that specifies the query object that contains the column.  
  
 *Column*  
 Type: Text  
  
 Refers to the name of the query column. The name of a query column is specified by the [Name Property](Name-Property.md) of the column in Query Designer.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number that is assigned to the column.  
  
## Remarks  
 In Query Designer, each column of the query is assigned a number that is specified by the column's [ID Property](ID-Property.md). The **COLUMNNO** function enables you to create actions based on the ID of a column.  
  
## Example  
 The following example shows how to get the ID of a column of a query. The query is called **My Customer Query** and has a column with the name **Customer\_No**. This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Number|Integer|Not applicable|  
|MyQuery|Query|My Customer Query|  
  
 This statement assigns the ID of the **Customer\_No** column in the **My Customer Query** query to the `Number` variable.  
  
```  
Number := MyQuery.COLUMNNO("Customer_No");  
```  
  
## See Also  
 [How to: Create Queries](How-to--Create-Queries.md)   
 [How to: Set Up Filter Rows in Query Designer](How-to--Set-Up-Filter-Rows-in-Query-Designer.md)   
 [Queries](Queries.md)   
 [Record Data Type](Record-Data-Type.md)