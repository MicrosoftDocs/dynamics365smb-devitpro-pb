---
title: "OrderBy Property"
description: "Description of the OrderBy property for Business Central."

ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OrderBy Property

Sorts rows in the resulting dataset of a query in ascending or descending order by a column or columns.  
  
## Applies to  

- [Query](../devenv-query-object.md) objects
- [Views](../devenv-views.md)
  
## Property Value

 *Column*=**Ascending**&#124;**Descending**  
  
- *Column* is the name of the query column as specified by its [Name Property](devenv-name-property.md).  
  
- **Ascending** sorts the column from lowest value to the highest value (A to Z, 0 to 9).  
  
- **Descending** sorts the column from highest value to the lowest value (Z to A, 9 to 0).  
  
> [!NOTE]  
> Separate multiple columns with a comma.  
  
## Remarks

In the OrderBy property, you add a column by name and set its direction to ascending or descending:

```AL
view(MyFirstView)
{
    Caption = 'This is my first view!';
    OrderBy = Ascending (Address);
}
```
To sort on multiple columns, separate each column with a comma, like `OrderBy = ascending (Name), descending (Quantity)`.
  
> [!NOTE]  
> You cannot sort on the same column more than once.  

> [!NOTE]
> For views you can only use one direction; either **Ascending** or **Descending**.
  
The **OrderBy** property corresponds to the Order By clause in SQL select statements.  
  
## Example  
 This following table shows the results of a query that retrieves the quantity of items in every open sales order for each customer.  
  
|Customer|Quantity|  
|--------|--------|  
|The Cannon Group|50|  
|New Concepts|15|  
|New Concepts|30|  
|Selangerian Ltd.|20|  
|Selangerian Ltd.|60|  
  
 To sort the **Customer** column in ascending order and the **Quantity** column to descending order, you set the OrderBy property to `Name=Ascending,Quantity=Descending`. The following table shows the results of the query after sorting.  
  
|Customer|Quantity|  
|--------|--------|  
|New Concepts|30|  
|New Concepts|15|  
|Selangerian Ltd.|60|  
|Selangerian Ltd.|20|  
|The Cannon Group|50|  
  
The following is the Order By clause in SQL that corresponds to the OrderBy property in this example.  
  
```AL
OrderBy = ascending (Name,Quantity);  
```

## See Also  

[Query Properties](devenv-query-properties.md)  
[View Properties](devenv-view-properties.md)  
