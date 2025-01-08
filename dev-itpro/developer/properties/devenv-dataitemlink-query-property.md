---
title: DataItemLink Property (Query)
ms.date: 01/08/2025
ms.topic: reference
author: jswymer
ms.reviewer: solsen
---

# DataItemLink property (query)

> **Version**: _Available from runtime version 1.0._

Sets a reference between one or more fields of the data item table and data item or data items above it.  
  
## Applies to  
  
- Query data items  
  
## Property value  

`Field=Table.ReferenceField`  
  
- `Field` is the name of the field in the table of the lower data item.  
- `Table` is the name of the table of the upper data item.  
- `ReferenceField` is the name of the field in the table of the upper data item.  
  
> [!NOTE]  
> You can link to more than one column. Separate multiple column links with a comma.
  
## Remarks  

The DataItemLink property works together with the SqlJoinType property to combine records from tables into a dataset. The DataItemLink property sets up an "equal to" (=) comparison between two fields of the data item tables. When the query is run, the query compares each row of the two data items to find records that having matching values for the fields. Records that have a matching field values are combined into a row in the resulting dataset. In some cases, there are records that don't have matching values. Set the [SQLJoinType property](devenv-sqljointype-property.md) to include records that don't have matching values. When setting up a data item link between two data items, you always set up the DataItemLink property on the lower data item in the query object.
  
> [!NOTE]  
> If the [SQLJoinType property](devenv-sqljointype-property.md) is set to `Cross Join`, then you can't set the DataItemLink property. For more information, see [Linking and joining data items to define the query dataset](../devenv-query-links-joins.md).

## Example

A Salesperson table and a Sales Header table have the Code column and Salesperson\_Code field in common, respectively. To create a link between these two tables, you add the following value in the DataItemLink property of the **Sales Header** data item.  
  
```AL
DataItemLink = "Salesperson Code" = Salesperson.Code  
```  

## Related information

[Query object](../devenv-query-object.md)  
[SQLJoinType property](devenv-sqljointype-property.md)
[DataItemLink property (reports)](devenv-dataitemlink-reports-property.md)  
