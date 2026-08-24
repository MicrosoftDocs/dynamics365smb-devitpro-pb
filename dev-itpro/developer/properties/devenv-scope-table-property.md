---
title: Scope Property for Table Objects
description: Learn how the Scope property controls whether a table is available to cloud or on-premises extensions in Dynamics 365 Business Central.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Scope property on tables

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-scope-property.md -->

Specifies whether a table is available to extensions that target the cloud.

## Applies to

- Tables

## Property value

| Value | Available from | Description |
|-------|----------------|-------------|
| `Cloud` | Runtime version 4.0 | The table is available to extensions that target the cloud or on-premises. |
| `OnPrem` | Runtime version 4.0 | The table is available only to extensions that target on-premises deployments. |

The legacy values `Extension`, `Internal`, and `Personalization` are deprecated from runtime version 4.0. Use `Cloud` instead of `Extension` or `Personalization`, and use `OnPrem` instead of `Internal`.

## Syntax

```al
Scope = OnPrem;
```

> [!IMPORTANT]
> The compiler permits `Scope = OnPrem` only for platform-symbol tables in Microsoft's reserved object range. Extensions can't declare new tables with this value.

## Remarks

An extension that targets the cloud can't directly reference a table that has `Scope = OnPrem`. The restriction also applies to reflection-based access through `RecordRef`.

## Related information

[Scope property reference](devenv-scope-property.md)  
[Compilation scope overview](../devenv-compilation-scope-overview.md)  
[JSON files](../devenv-json-files.md)  
[Properties](devenv-properties.md)
