---
title: "AppSourceCop Hidden AS0132"
description: "Fields with schema should not be added."
ms.author: solsen
ms.date: 06/17/2025
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Hidden AS0132
Fields with schema should not be added.

## Description
Fields with schema should not be added.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule is not enabled by default since additive changes are generally allowed.

## How to fix this diagnostic?

Revert the changes done by removing the fields that have been added.

## Examples triggering this rule

### Example 1 - Adding a field to a table with schema

Version 1 of the extension

```al
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer) { }
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
        field(2; MyNewField; Integer) { }
    }
}
```

### Example 2 - Adding a field to a table extension with schema

Version 1 of the extension

```al
tableextension 50100 MyExtension extends SomeTable
{
    procedure MyProcedure()
    begin
    end
}
```

Version 2 of the extension

```al
tableextension 50100 MyExtension extends SomeTable
{
    fields
    {
        field(50100; MyExtField; Integer) { }
    }

    procedure MyProcedure()
    begin
    end
}
```

## Examples not triggering this rule

### Example 1 - Adding a field to a table without schema

Version 1 of the extension

```al
table 50100 MyTable
{
    TableType = Temporary;

    fields
    {
        field(1; MyField; Integer) { }
        field(2; MyNewField; Integer) { }
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
    }
}
```

### Example 2 - Adding a field without schema

Version 1 of the extension

```al
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer) { }
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

        field(50100; MyNewField; Integer)
        {
            FieldClass = FlowField;
        }
    }
}
```

## Related information  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
