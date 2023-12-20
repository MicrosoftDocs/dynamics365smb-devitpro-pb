---
title: "AppSourceCop Error AS0118"
description: "Modifying the length of a field part of the primary key is not allowed."
ms.author: solsen
ms.custom: na
ms.date: 12/20/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0118
The length of a field part of the primary key cannot change.

## Description
Modifying the length of a field part of the primary key is not allowed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The changes validated by this rule aren't allowed because they are destructive changes for the synchronization engine. These changes might also break the runtime of dependent extensions.

The validation of the length of table fields part of primary keys was previously done with [AS0080](appsourcecop-as0080.md) and is now handled by this rule.

## How to fix this diagnostic?

Reverting the change will fix this diagnostic.

## Code examples triggering the rule

### Example - Decreasing the length of a field

Version 1.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(50100; MyField; Text[50]) { }
    }

   keys
   {
        key(MyKey; MyField) { }
   }
}
```

Version 2.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(50100; MyField; Text[25]) { }
    }

   keys
   {
        key(MyKey; MyField) { }
   }
}
```

In version 2.0, the type of the field `MyField` has changed from `Text[50]` to `Text[25]`. Because this is a breaking change, if version 1.0 was installed on a tenant, it won't be possible to synchronize and upgrade the version 2.0 of the extension. Moreover, if a dependent extension uses this field, this change of length can lead to runtime exceptions.

> [!NOTE]  
> When no primary key is explicitly defined in the table definition, the first field is used as the primary key.

## See also 

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
