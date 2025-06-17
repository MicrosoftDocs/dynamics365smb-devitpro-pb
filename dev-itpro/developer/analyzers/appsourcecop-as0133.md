---
title: "AppSourceCop Hidden AS0133"
description: "Keys should not be added."
ms.author: solsen
ms.date: 06/17/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Hidden AS0133
Keys should not be added.

## Description
Keys should not be added.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks

This rule is not enabled by default since additive changes are generally allowed.

## How to fix this diagnostic?

Revert the changes done by removing the keys that have been added.

## Examples triggering this rule

### Example 1 - Adding a key to a table with schema

Version 1 of the extension

```al
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer) { }
        field(2; MyOtherField; Integer) { }
    }
    keys
    {
        key(PK; MyField) { }
    }
}
```

Version 2 of the extension

```al
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer) { }
        field(2; MyOtherField; Integer) { }
    }
    keys
    {
        key(PK; MyField) { }
        key(NewKey; MyOtherField) { }
    }
}
```

### Example 2 - Adding a key to a table extension with schema

Version 1 of the extension

```al
tableextension 50100 MyExtension extends SomeTable
{
    fields
    {
        field(50100; MyExtField; Integer) { }
        field(50101; MyOtherExtField; Integer) { }
    }
}
```

Version 2 of the extension

```al
tableextension 50100 MyExtension extends SomeTable
{
    fields
    {
        field(50100; MyExtField; Integer) { }
        field(50101; MyOtherExtField; Integer) { }
    }
    keys
    {
        key(NewKey; MyOtherExtField) { }
    }
}
```

## Example not triggering this rule

### Example - Adding a key to a table without schema

Version 1 of the extension

```al
table 50100 MyTable
{
    TableType = Temporary;

    fields
    {
        field(1; MyField; Integer) { }
        field(2; MyOtherField; Integer) { }
    }
    keys
    {
        key(PK; MyField) { }
    }
}
```

Version 2 of the extension

```al
table 50100 MyTable
{
    TableType = Temporary;

    fields
    {
        field(1; MyField; Integer) { }
        field(2; MyOtherField; Integer) { }
    }
    keys
    {
        key(PK; MyField) { }
        key(NewKey; MyOtherField) { }
    }
}
```

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  