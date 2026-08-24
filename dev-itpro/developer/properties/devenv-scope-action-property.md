---
title: Scope Property for Page Actions
description: Learn how the Scope property controls whether a page action applies to the page or a repeater in Dynamics 365 Business Central.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Scope property on page actions

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-scope-property.md -->

Specifies whether an action applies to the page or to a repeater control. The property has the values `Page` and `Repeater`. The default is `Page`.

Use `Repeater` on pages that include a repeater control. The action then appears in the shortcut menu for each row in the list.

## Applies to

- Page actions

## Property value

| Value | Description |
|-------|-------------|
| `Page` | The action applies to the page. |
| `Repeater` | The action applies to the repeater control. |

## Related information

[Properties](devenv-properties.md)  
[Scope property for tables](devenv-scope-table-property.md)  
[Define action scope for Business Central pages](../devenv-defining-action-scope-for-pages.md)
