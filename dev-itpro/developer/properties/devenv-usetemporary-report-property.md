---
title: UseTemporary Property for Report Data Items
description: Learn how the UseTemporary property uses an in-memory temporary table for a report data item in Dynamics 365 Business Central.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# UseTemporary property on report data items

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-usetemporary-property.md -->

Specifies whether a report data item uses a temporary table.

## Applies to

- Report data items

## Property value

Set the property to `true` to use a temporary table. Otherwise, set it to `false`. The default is `false`.

## Syntax

```al
UseTemporary = true;
```

## Remarks

A temporary table stores data in memory instead of in the Business Central database. You can use it as a buffer for calculated or aggregated data that isn't read directly from a physical table.

## Related information

[Report object](../devenv-report-object.md)  
[UseTemporary property for XMLport table elements](devenv-usetemporary-xmlport-property.md)  
[Temporary tables](../devenv-temporary-tables.md)  
[Properties](devenv-properties.md)
