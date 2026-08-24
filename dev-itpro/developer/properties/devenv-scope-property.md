---
title: Scope Property Reference in AL
description: Learn where to use the Scope property for page actions, tables, enums, and interfaces in Dynamics 365 Business Central development.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Scope property by object type

<!-- this article is manually created -->

The `Scope` property applies to the following object types:

- [Scope property for page actions](devenv-scope-action-property.md)
- [Scope property for tables](devenv-scope-table-property.md)
- Enum objects
- Interface objects

The property is available for page actions and tables from runtime version 1.0. It's available for enum and interface objects from runtime version 14.0.

## Scope on enum and interface objects

For enum and interface objects, `Scope` controls whether the object can be used in extensions that target the cloud.

| Value | Description |
|-------|-------------|
| `Cloud` | The object can be used in extensions that target the cloud or on-premises. This value is the default. |
| `OnPrem` | The object can be used only in extensions that target on-premises deployments. |

## Syntax

```al
Scope = OnPrem;
```

## Related information

[Compilation scope overview](../devenv-compilation-scope-overview.md)  
[Properties](devenv-properties.md)
