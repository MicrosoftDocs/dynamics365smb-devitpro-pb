---
title: "Fields must not increase in length"
ms.author: solsen
ms.custom: na
ms.date: 11/25/2020
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
# AppSourceCop Rule AS0086
Fields must not increase in length  

## Description
Increasing the length of a field is not allowed as it might break the runtime behavior of dependent extensions referencing it.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The validation of the length of table fields was previously done with [AS0004](appsourcecop-as0004-fieldtypechangenotallowed.md) and has now been split into two different rules:
- [AS0080](appsourcecop-as0080-fieldlengthdecreasenotallowed.md) - which validates against decreasing the length of fields
- [AS0086](appsourcecop-as0086-fieldlengthincreasenotallowed.md) - which validates against increasing the length of fields

## How to fix this diagnostic

Reverting the change will fix this diagnostic. If increasing the length of the field is required, the recommended approach is to mark the field as [Obsolete Pending](../properties/devenv-obsoletestate-property.md) and introduce a new field with the desired length.
Once all dependent extensions have uptaken the new field, you can mark the the original one as [Obsolete Removed](../properties/devenv-obsoletestate-property.md).

## Code example triggering the rule

Version 1.0 of the extension:
```AL
table 50100 MyTable
{
    fields
    {
        field(50100; MyField; Text[50]) { }
    }
}
```

Version 2.0 of the extension:
```AL
table 50100 MyTable
{
    fields
    {
        field(50100; MyField; Text[150]) { }
    }
}
```

In version 2.0, the type of the field `MyField` has changed from `Text[50]` to `Text[150]`. If a dependent extension uses this field, this can lead to runtime exceptions. For instance, if it assigns it to a variable of type `Text[50]`.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  