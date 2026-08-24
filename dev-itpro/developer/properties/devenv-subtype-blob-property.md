---
title: SubType Property for BLOB Fields
description: Learn how the SubType property describes the content stored in a BLOB table field in Dynamics 365 Business Central and review its values.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# SubType property on BLOB fields

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-subtype-property.md -->

Specifies the type of content stored in a `BLOB` table field.

## Applies to

- `BLOB` table fields

## Property value

| Value | Description |
|-------|-------------|
| `UserDefined` | Stores user-defined content. This value is the default. |
| `Bitmap` | Stores bitmap content. |
| `Memo` | Stores memo content. |
| `Json` | Stores JSON content. |

## Syntax

```al
SubType = Bitmap;
```

## Related information

[SubType property for codeunits](devenv-subtype-codeunit-property.md)  
[BLOB data type](../methods-auto/blob/blob-data-type.md)  
[Properties](devenv-properties.md)
