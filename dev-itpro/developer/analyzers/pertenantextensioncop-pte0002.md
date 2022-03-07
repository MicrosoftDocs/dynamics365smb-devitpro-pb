---
title: "PerTenantExtensionCop Error PTE0002"
description: "Field ID must be in free range."
ms.author: solsen
ms.custom: na
ms.date: 12/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# PerTenantExtensionCop Error PTE0002
Field ID must be in free range.

## Description
Field ID must be in free range.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule validates that all table field IDs defined in your extension are within range 50,000-99,999 that is allocated for per-tenant extensions. For more information about the ID ranges for extensions, see [Object Ranges](../devenv-object-ranges.md). 

> [!NOTE]
> When a new AL table, you are also allowed to use the range 0-49,999 for the ID of your table fields.

## How to fix this diagnostic?

You must change the ID of the object or table field validated in order to use an ID within the range 50,000-99,999.

## Code examples triggering the rule

### Example 1 - A table field ID outside the range 50,000-99,999

```AL
table 50100 MyTable
{
    fields
    {
        field(1000000; MyField; Integer) { }
    }
}
```

The table field `MyField` has the ID `1000000` which is not valid because it is outside the allowed range.

### Example 2 - A table extension field ID in the ID range 0-49,999

```AL
tableextension 50100 MyTableExt extends MyTable
{
    fields
    {
        field(10; MyExtField; Integer) { }
    }
}
```

## Code examples not triggering the rule

### Example 1 - A table field ID within the range 50,000-99,999

```AL
table 50100 MyTable
{
    fields
    {
        field(50100; MyField; Integer) { }
    }
}
```

The table field `MyField` has the ID `50100` which is valid because it is within the allowed range.

### Example 2 - A table field ID within the range 0-49,999

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer) { }
    }
}
```

The table field `MyField` has the ID `1` which is valid because it is within the range 0-49,999.

## See Also  
[PerTenantExtensionCop Analyzer](pertenantextensioncop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  