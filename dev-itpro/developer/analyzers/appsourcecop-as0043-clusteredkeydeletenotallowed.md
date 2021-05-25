---
title: "AppSourceCop Rule AS0043"
ms.author: solsen
ms.custom: na
ms.date: 05/05/2021
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
# AppSourceCop Rule AS0043
The clustered key must not be deleted

## Description
The clustered key must not be deleted.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

It is not allowed to rename or remove the clustered key in a table. For more information on table keys, see [Table Keys](../devenv-table-keys.md).

> [!NOTE]  
> This rule validates tables independently of their Accessibility or ObsoleteState, because tables are always used when synchronizing the schema defined in the extension to the database.

## How to fix this diagnostic?

In order to fix this diagnostic, you must rename the clustered key or add it back so that it matches its definition in your baseline extension.

## Code examples triggering the rule

Version 1.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
        field(2; MyTextField; Text[50]) { }
    }

    keys
    {
        key(PK; MyIntegerField) { }

        key(ClusteredKey; MyTextField) 
        { 
            Clustered = true;
        }
    }
}
```

### Example 1 - Removing the clustered key

Version 2.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
        field(2; MyTextField; Text[50]) { }
    }

    keys
    {
        key(PK; MyIntegerField) { }
    }
}
```

In the version 2.0 of the extension, the clustered key `ClusteredKey` has been removed. This change is not allowed by the synchronization engine.

### Example 2 - Renaming the clustered key

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
        field(2; MyTextField; Text[50]) { }
    }

    keys
    {
        key(PK; MyIntegerField) { }

        key(NewClusteredKey; MyTextField) 
        { 
            Clustered = true;
        }
    }
}
```

In the version 2.0 of the extension, the clustered key has been renamed from `ClusteredKey` to `NewClusteredKey`. This change is detected as a removal of `ClusteredKey` and is not allowed by the synchronization engine.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  