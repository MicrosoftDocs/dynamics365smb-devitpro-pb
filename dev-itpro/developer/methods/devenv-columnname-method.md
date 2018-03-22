---
title: "COLUMNNAME Method"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8fb7efe1-b56e-4901-b21b-80d5fc501eef
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COLUMNNAME Method
Returns the name of a query column as a text string.  

## Syntax  

```  

Name := Query.COLUMNNAME(Column)  
```  

#### Parameters  
 *Query*  
 Type: Query  

 A variable that specifies the query object that contains the column.  

 *Column*  
 Type: Text  

 Refers to the name of the query column. The name of a query column is specified by the [Name Property](../properties/devenv-Name-Property.md) of the column in Query Designer.  

## Property Value/Return Value  
 Type: Text  

 The name of the specified column.  

## Remarks  
 The **COLUMNNAME** method retrieves the name of the column as specified by its **Name** property and enables you to create actions based on the column name. If you want to retrieve the query column's caption, which displays in the user interface of the query, then call the [COLUMNCAPTION Method](devenv-COLUMNCAPTION-Method.md) instead.  

## Example  
 The following example shows how to get the name for a column of a query. The query is called **My Customer Query** and has a column with the name **Customer\_No**. This example requires that you create the following variables.  

|Variable name|DataType|Subtype|Length|  
|-------------------|--------------|-------------|------------|  
|NameOfColumn|Text|Not applicable|64|  
|MyQuery|Query|My Customer Query|Not applicable|  

```  
NameOfColumn := MyQuery.COLUMNNAME("Customer_No");  
```  

 The name of the column is stored in a text string.  

 The advantage of using this statement instead of assigning the column name in a statement, such as `NameOfColumn := 'Customer_No';`, is that the **COLUMNNAME** method dynamically adapts to any change to the column name that is made in the development environment. The `NameOfColumn := 'Customer_No';`statement performs a static assignment.  

## See Also  
 <!--Links [How to: Create Queries](How-to--Create-Queries.md)    
 [How to: Set Up Filter Rows in Query Designer](How-to--Set-Up-Filter-Rows-in-Query-Designer.md)-->   
 [Query Object](../devenv-query-object.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)   
 [Multilanguage Development](../devenv-multilanguage-development.md)
