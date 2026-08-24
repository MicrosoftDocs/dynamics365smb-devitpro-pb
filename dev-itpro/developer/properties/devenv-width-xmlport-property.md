---
title: Width Property for XMLport Elements
description: Learn how the Width property sets the number of characters in fixed-text XMLport elements and attributes in Dynamics 365 Business Central.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Width property on XMLport elements

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-width-property.md -->

Specifies the number of characters in an XMLport element or attribute.

## Applies to

- XMLport text elements
- XMLport field elements
- XMLport table elements
- XMLport field attributes
- XMLport text attributes

## Property value

Set the property to an integer. The default is `0`.

## Syntax

```al
Width = 10;
```

## Remarks

The property is used only when the XMLport [Format property](devenv-format-property.md) is set to `FixedText`.

## Related information

[XMLport properties](devenv-xmlport-properties.md)  
[Width property for table and page fields](devenv-width-property.md)  
[Properties](devenv-properties.md)
