---
title: UseTemporary Property for XMLport Table Elements
description: Learn how the UseTemporary property imports XMLport records into an in-memory temporary table in Dynamics 365 Business Central.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# UseTemporary property on XMLport table elements

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-usetemporary-property.md -->

Specifies whether an XMLport table element uses a temporary table.

## Applies to

- XMLport table elements

## Property value

Set the property to `true` to use a temporary table. Otherwise, set it to `false`. The default is `false`.

## Syntax

```al
UseTemporary = true;
```

## Remarks

You can import records into a temporary table when the incoming data must be transformed before it's inserted into a physical table. The temporary table keeps the records in memory and doesn't write them to the Business Central database.

## Related information

[XMLport object](../devenv-xmlport-object.md)  
[UseTemporary property for report data items](devenv-usetemporary-report-property.md)  
[Temporary tables](../devenv-temporary-tables.md)  
[Properties](devenv-properties.md)
