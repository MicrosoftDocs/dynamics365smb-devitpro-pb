---
title: "PerTenantExtensionCop Error PTE0001"
description: "Object ID must be in free range."
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
# PerTenantExtensionCop Error PTE0001
Object ID must be in free range.

## Description
Object ID must be in free range.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule validates that all the object IDs defined in your extension are within range 50,000-99,999 that is allocated for per-tenant extensions. For more information about the ID ranges for extensions, see [Object Ranges](../devenv-object-ranges.md). 

## How to fix this diagnostic?

You must change the ID of the object or table field validated in order to use an ID within the range 50,000-99,999.

## Code example triggering the rule

```AL
codeunit 10 MyCodeunit
{
    // Business logic
}
```

The codeunit `MyCodeunit` has the ID `10` which is not valid because it is outside the allowed range.

## Code examples not triggering the rule

```AL
codeunit 50100 MyCodeunit
{
    // Business logic
}
```

The codeunit `MyCodeunit` has the 50100 `10` which is valid because it is within the allowed range.

## See Also  
[PerTenantExtensionCop Analyzer](pertenantextensioncop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  