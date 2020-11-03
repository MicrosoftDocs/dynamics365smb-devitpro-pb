---
title: "Method Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
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
# Method Property
Gets or sets the method type as defined in the HTTP standard.

## Applies to
-   Query Column

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|Day|TODO:Add documentation|
|Month|TODO:Add documentation|
|Year|TODO:Add documentation|
|Sum|TODO:Add documentation|
|Count|TODO:Add documentation|
|Average|TODO:Add documentation|
|Min|TODO:Add documentation|
|Max|TODO:Add documentation|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Date Methods  

You can only use the date methods on fields of the Date and DateTime data type.  
  
When you set up a totals method on another column in the query, rows in the resulting dataset are grouped by the day, month, or year, depending on the **Method** property setting.  
 
For more information about date methods, see [Retrieving Date Data in Queries](../devenv-query-retrieve-date-data.md).

### Syntax

```AL
Method = Day;
```
  
## Totals Methods and Groups  

A totals method performs a calculation on fields in a column and returns a single value. When you set a totals method on a column, the retrieved records are automatically grouped by the other columns in the query. When grouped by a column, records that have similar values for the column are grouped together. The totals method is applied against the records in the group. A summary value is calculated for the group and returned in a single row for the group in the dataset. The **Method** property values correspond to the SQL aggregate functions SUM, AVG, MIN, MAX, and COUNT in SQL SELECT statements.  
  
Except for the **Count** method, you can only use a totals method on a field that has a numeric data type of **Decimal**, **Integer**, **BigInteger**, or **Duration**. The totals method returns a decimal value that is calculated from values of all fields in a column.  
  
**Count** is only associated with its parent **DataItem**, not a specific column. Therefore, when you set a column to **Count**, you leave the [DataSource Property](devenv-datasource-property.md) of the column blank. The **Count** method returns an integer value that corresponds to the number of rows that are returned from the table that is specified by the data item associated with the column.  

### Syntax

```AL
Method = Max;
```

 
## See Also

[MethodType Property](devenv-methodtype-property.md)   
[Properties](devenv-properties.md)  