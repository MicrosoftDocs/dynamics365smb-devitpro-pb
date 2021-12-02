---
title: "AppSourceCop Rule AS0009"
description: "The list of fields for the primary key or for the clustered key must not be changed."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# AppSourceCop Rule AS0009
Key fields must not be changed

## Description
The list of fields for the primary key or for the clustered key must not be changed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

It is not allowed to change the list of fields for the primary key or for the [clustered key](../properties/devenv-clustered-property.md) because this will break upgrade of existing installations. For more information on table keys, see [Table Keys](../devenv-table-keys.md).

> [!NOTE]  
> This rule validates tables independently of their Accessibility or ObsoleteState, because tables are always used when synchronizing the schema defined in the extension to the database.

## How to fix this diagnostic?

In order to fix this diagnostic, you must revert the changes done in the current version of your extension so that the list of fields for the primary key or the clustered key matches the one defined for the key in your baseline extension.

## Code examples triggering the rule

For the following examples, version 1.0 of the extension defines the following table:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
        field(2; MyDateField; Date) { }
        field(3; MyTextField; Text[50]) { }
    }

    keys
    {
        key(PK; MyIntegerField, MyDateField) { }
    }
}
```

These examples are demonstrating *breaking changes done on the primary key*. Similar examples could be done on the clustered key:

```AL
key(clusteredKey; MyIntegerField)
{
    Clustered = true;
}
```

### Example 1 - Modifying a field in the list

Version 2.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
        field(2; MyDateField; Date) { }
        field(3; MyTextField; Text[50]) { }
    }

    keys
    {
        key(PK; MyIntegerField, MyTextField) { }
    }
}
```

In version 2.0, the field `MyDateField` has been replaced by the field `MyTextField` in the list of fields for the primary key. *This change is not allowed by the synchronization engine*.

### Example 2 - Removing a field in the list

Version 2.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
        field(2; MyDateField; Date) { }
        field(3; MyTextField; Text[50]) { }
    }

    keys
    {
        key(PK; MyIntegerField) { }
    }
}
```

In version 2.0, the field `MyDateField` has been removed from the list of fields for the primary key. *This change is not allowed by the synchronization engine*.

### Example 3 - Adding a field in the list

Version 2.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
        field(2; MyDateField; Date) { }
        field(3; MyTextField; Text[50]) { }
    }

    keys
    {
        key(PK; MyIntegerField, MyDateField, MyTextField) { }
    }
}
```

In the version 2.0, the field `MyTextField` has been added to the list of fields for the primary key. *This change is not allowed by the synchronization engine*.

## Code example not triggering the rule

Any changes done on a key which is not the primary key or the clustered key are allowed, see the following examples.

Version 1.0 of the extension:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
        field(2; MyDateField; Date) { }
        field(3; MyTextField; Text[50]) { }
    }

    keys
    {
        key(PK; MyIntegerField) { }
        key(SimpleKey; MyDateField) { }
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
        field(2; MyDateField; Date) { }
        field(3; MyTextField; Text[50]) { }
    }

    keys
    {
        key(PK; MyIntegerField) { }
        key(SimpleKey; MyTextField) { }
    }
}
```

In version 2.0, the field `MyDateField` has been replaced by the field `MyTextField` in the list of fields for the key `SimpleKey`. This change is allowed by the synchronization engine because `SimpleKey` is not the primary key and is not the clustered key.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
