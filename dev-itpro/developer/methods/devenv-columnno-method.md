---
title: "COLUMNNO Method"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 5305add4-662d-4624-9a92-a9f9c3e7939c
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COLUMNNO Method
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

 Refers to the name of the query column. The name of a query column is specified by the [Name Property](../properties/devenv-Name-Property.md) of the column in Query Designer.  

## Property Value/Return Value  
 Type: Integer  

 The number that is assigned to the column.  

## Remarks  
 In Query Designer, each column of the query is assigned a number that is specified by the column's [ID Property](../properties/devenv-ID-Property.md). The **COLUMNNO** method enables you to create actions based on the ID of a column.  

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
 <!--Links [How to: Create Queries](How-to--Create-Queries.md)    
 [How to: Set Up Filter Rows in Query Designer](How-to--Set-Up-Filter-Rows-in-Query-Designer.md)-->  
 [Query Object](../devenv-query-object.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)
