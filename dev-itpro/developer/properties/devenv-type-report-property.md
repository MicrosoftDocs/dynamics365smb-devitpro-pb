---
title: Type Property for Report Layouts
description: Learn how the Type property specifies the format of a report layout in Dynamics 365 Business Central and review the supported values.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Type property on report layouts

> **Version**: _Available from runtime version 9.0._

<!-- this article is manually created, and the parent node is devenv-type-property.md -->

Specifies the format of a report layout.

## Applies to

- Report layouts

## Property value

| Value | Description |
|-------|-------------|
| `RDLC` | Defines an RDLC report layout. |
| `Word` | Defines a Word report layout. |
| `Excel` | Defines an Excel report layout. |
| `Custom` | Defines a custom report layout. Set the [MimeType property](devenv-mimetype-property.md) for this type. |

## Related information

[Report layout properties](devenv-report-property-overview.md)  
[Type property for entitlement objects](devenv-type-entitlement-property.md)  
[Properties](devenv-properties.md)
