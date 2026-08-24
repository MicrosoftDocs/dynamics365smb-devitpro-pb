---
title: SourceTableView Property for XMLports
description: Learn how the SourceTableView property sets the key, sort order, and filters for an XMLport table element in Dynamics 365 Business Central.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# SourceTableView property on XMLport table elements

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-sourcetableview-property.md -->

Specifies the key, sort order, and filters for the source table of an XMLport table element.

## Applies to

- XMLport table elements

## Syntax

```al
SourceTableView = sorting(Code);
```

## Remarks

Use `sorting` to select a key, `order` to specify ascending or descending order, and `where` to filter records.

## Related information

[SourceTableView property for pages](devenv-sourcetableview-pages-property.md)  
[XMLport properties](devenv-xmlport-properties.md)  
[Properties](devenv-properties.md)
