---
title: DataItemLink Property for Reports
description: Learn how the DataItemLink property filters a child report data item by matching its fields with fields in an ancestor data item.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ms.author: solsen
---

# DataItemLink property on report data items

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-dataitemlink-property.md -->

Specifies matching fields in two data items that are linked by the [DataItemLinkReference property](devenv-dataitemlinkreference-property.md). Set `DataItemLink` on the child data item. The referenced data item can be its parent or another ancestor.

## Applies to

- Report data items

## Remarks

Use the following syntax:

`<Field>=field(<ReferenceField>)`

| Placeholder | Description |
|-------------|-------------|
| `<Field>` | A field from the child data item. |
| `<ReferenceField>` | A field from the parent or ancestor data item identified by the [DataItemLinkReference property](devenv-dataitemlinkreference-property.md). |

To link more than one pair of fields, separate the links with commas.

The `DataItemLink` property sets a filter on the child data item. The filter selects records that have the same field values in the referenced and child data items.

For example, a `Customer` parent data item and a `Sales Header` child data item both contain a customer number. Set `DataItemLinkReference` on the child data item to the `Customer` data item. Then set `DataItemLink` on the child data item as follows:

```al
DataItemLink = "Sell-to Customer No." = field("No.");
```

This filter selects sales headers for the current customer. You can create the same filter in the [OnPreDataItem trigger](../triggers-auto/reportdataitem/devenv-onpredataitem-reportdataitem-trigger.md) of the child data item:

```al
SetRange("Sell-to Customer No.", Customer."No.");
```

## Related information

[OnPreDataItem trigger](../triggers-auto/reportdataitem/devenv-onpredataitem-reportdataitem-trigger.md)  
[DataItemLinkReference property](devenv-dataitemlinkreference-property.md)  
[DataItemLink property for queries](devenv-dataitemlink-query-property.md)