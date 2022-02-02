---
title: "PerTenantExtensionCop Error PTE0004"
description: "Table definitions must have a matching permission set."
ms.author: solsen
ms.custom: na
ms.date: 12/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# PerTenantExtensionCop Error PTE0004
Table definitions must have a matching permission set.

## Description
Table definitions must have a matching permission set.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

In order to prevent runtime issues caused by missing permissions, all table definitions in your extension must be included in a permission set.

## How to fix this diagnostic?

Permissions can be defined either using XML, or using AL permission set objects.

In order to generate XML permission sets, you can use the dedicated command in Visual Studio Code:
1. Press Ctrl + Shift + P in order to open the command palette
2. Select 'AL: Generate permission set containing current extension objects'. This will generate the XML permission set for your extension.
3. Rebuild your extension with Ctrl + Shift + B to package the permission set with your extension.

In order to create AL permission sets, see [Permission Set Object](../devenv-permissionset-object.md).

## Code examples not trigger the rule

For the following example, let's consider an extension that has the following source code:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer) { }
    }
}
```

### Example 1 - Permission defined in XML

```XML

```

The XML permission set grant access to the table and satisfies then the validation.

### Example 2 - Permission defined in AL

```

```

The AL permission set grant access to the table and satisfies then the validation.

## See Also  
[PerTenantExtensionCop Analyzer](pertenantextensioncop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  