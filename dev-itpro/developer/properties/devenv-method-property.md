---
title: "Method Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Method Property
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the method type as defined in the HTTP standard.

## Applies to
-   Query Column

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Day**|Gets the day from the date expression for the field in the query column. The day is returned as an integer, in the range of 1 to 31, which represents the day of the month. If the day in the date expression is 0, then 1 is returned.|
|**Month**|Gets the month from the date expression for the field in the query column. The month is returned as an integer, in the range of 1 to 12, where 1 represents January and 12 represents December. If the month in the date expression is 0, then 1 is returned.|
|**Year**|Gets the year from the date expression for the field in the query column. The year is returned as an integer. If the year in the date expression is 0, then 1900 is returned.|
|**Sum**|Adds the values of all fields for the specified column within a group.|
|**Count**|Returns the number of rows that are included in the dataset within a group. **Note:**  The `Count` method is associated with the **DataItem** and not with a specific column, so the **DataSource** property must be blank.|
|**Average**|Calculates the average value of the fields in the column within a group.<br /><br /> When averaging fields that have an integer data type (such as Integer or BigInteger), integer division is used. This means that result is not rounded, and the remainder is discarded. For example, 5÷2=2 instead of 2.5 (or 2 1/2).|
|**Min**|Retrieves the lowest value of fields in the column within a group.|
|**Max**|Retrieves the highest value of fields in the column within a group.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Date Methods  

You can only use the date methods on fields of the [Date](../methods-auto/date/date-data-type.md) and [DateTime](../methods-auto/datetime/datetime-data-type.md) data type.  
  
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