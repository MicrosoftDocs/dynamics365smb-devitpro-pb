---
title: "AppSourceCop Rule AS0010"
description: "The primary key must not be deleted because this will break upgrade of existing installations."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# AppSourceCop Rule AS0010
Keys must not be deleted

## Description
The primary key must not be deleted because this will break upgrade of existing installations.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

It is not allowed to rename the primary key because this will break upgrade of existing installations. Note that a primary key is always automatically generated for your table even if you do not specify any keys in your AL code. Removing the primary key will then be seen as a rename by the AppSourceCop analyzer. For more information on table keys, see [Table Keys](../devenv-table-keys.md).

> [!NOTE]  
> This rule validates tables independently of their Accessibility or ObsoleteState, because tables are always used when synchronizing the schema defined in the extension to the database.

## How to fix this diagnostic?

In order to fix this diagnostic, you must rename the primary key or add it back so that it matches its definition in your baseline extension.

## Code examples triggering the rule

### Example 1 - Renaming the primary key

Version 1.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
    }

    keys
    {
        key(PK; MyIntegerField) { }
    }
}
```

Version 2.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
    }

    keys
    {
        key(MyPK; MyIntegerField) { }
    }
}
```

In version 2.0, the key `PK` has been renamed to `MyPK`. *This change is not allowed by the synchronization engine*.

> [!NOTE]
> The validation of the primary key's name by the synchronization engine is case-sensitive. Changing the casing of the primary key's name is then considered a breaking change.

### Example 2 - Explicitly adding a primary key

Version 1.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
    }
}
```

In version 1.0 of the extension, no primary key is explictly defined in AL code. By default, the first field by ID will be used as primary key. The primary key is then similar to:

```AL
key(MyIntegerField; MyIntegerField) { }
```

Version 2.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
    }

    keys
    {
        key(PK; MyIntegerField) { }
    }
}
```

In version 2.0 of the extension, a key named `PK` has been introduced and will act as the primary key for the table. This is *not allowed* because the primary key in version 1.0 was named `MyIntegerField`.

> [!NOTE]
> If the key introduced was named `MyIntegerField`, the change would be allowed because it would match the default name given to the primary key in the baseline version.

### Example 3 - Removing the primary key

Version 1.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
    }

    keys
    {
        key(PK; MyIntegerField) { }
    }
}
```

Version 2.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
    }
}
```

In version 2.0 of the extension, no primary key is explictly defined in AL code. By default, the first field by ID will be used as primary key. The primary key is then similar to:

```AL
key(MyIntegerField; MyIntegerField) { }
```

This change is *not allowed* because the primary key was named `PK` in the baseline extension while it is now named `MyIntegerField`.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
