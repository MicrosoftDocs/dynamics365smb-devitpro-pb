---
title: DataItemLink Property for Queries
description: Learn how the DataItemLink property joins query data items by matching fields in their source tables in Dynamics 365 Business Central.
ms.date: 08/21/2026
ms.topic: reference
author: jswymer
ms.reviewer: solsen
ms.author: solsen
---

# DataItemLink property on query data items

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-dataitemlink-property.md -->

Specifies links between fields in a query data item and fields in one or more data items above it.

## Applies to

- Query data items

## Property value

`Field=AncestorDataItem.ReferenceField`  

- `Field` is the name of the field in the table of the lower data item.  
- `AncestorDataItem` is the name of an ancestor data item.  
- `ReferenceField` is the name of a field in the table of the ancestor data item.

> [!NOTE]
> You can link to more than one column. Separate multiple column links with a comma.

## Remarks

The `DataItemLink` property works with the [SqlJoinType property](devenv-sqljointype-property.md) to combine records from tables into a dataset. It defines an equal-to (`=`) comparison between fields in the data item tables. The query combines records that have matching field values. Set `DataItemLink` on the lower data item in the query object.

> [!NOTE]
> You can't set `DataItemLink` when `SqlJoinType` is set to `CrossJoin`. Learn more in [Linking and joining data items to define the query dataset](../devenv-query-links-joins.md).
>
> You can't use `FlowField` or `FlowFilter` fields in a query `DataItemLink`.

## Example

A `Salesperson` data item and a `Sales Header` data item contain the `Code` and `Salesperson Code` fields, respectively. To link the data items, set the `DataItemLink` property on the `Sales Header` data item.

```al
DataItemLink = "Salesperson Code" = Salesperson.Code;
```

## Related information

[Query object](../devenv-query-object.md)  
[SqlJoinType property](devenv-sqljointype-property.md)  
[DataItemLink property for reports](devenv-dataitemlink-reports-property.md)
