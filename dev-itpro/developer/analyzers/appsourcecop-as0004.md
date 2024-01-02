---
title: "AppSourceCop Error AS0004"
description: "Fields must not change type."
ms.author: solsen
ms.custom: na
ms.date: 01/02/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0004
Fields must not change type, since dependent extensions may break

## Description
Fields must not change type.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> This rule validates all fields independently of their Accessibility or ObsoleteState, because they are used when synchronizing the schema defined in the extension to the database.

## Remarks

The validation of the length of table fields was previously done with [AS0004](appsourcecop-as0004.md) and has now been split into two different rules:

- [AS0080](appsourcecop-as0080.md) - which validates against decreasing the length of fields
- [AS0086](appsourcecop-as0086.md) - which validates against increasing the length of fields

## How to fix this diagnostic?

To fix this diagnostic, you must obsolete the field by mark the field as [Obsolete Pending](../properties/devenv-obsoletestate-property.md) and then introduce a new field.

## Example

Version 1.0 of the app:

```al
table 50 MyTable
{
    fields
    {
        field(1; Identifier; Integer) { }
    }
}
```

Version 2.0 of the app:
```al
table 50 MyTable
{
    fields
    {
        field(1; Identifier; Text[30]) { }
    }
}
```

The data type of the field `Identifier` was changed from `Integer` to `Text[30]`, which isn't allowed and will trigger this rule.

## See Also

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
