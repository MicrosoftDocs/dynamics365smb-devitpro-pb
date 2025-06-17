---
title: "AppSourceCop Hidden AS0131"
description: "Tables with schema should not be added."
ms.author: solsen
ms.date: 06/17/2025
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Hidden AS0131
Tables with schema should not be added.

## Description
Tables with schema should not be added.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule is not enabled by default since additive changes are generally allowed.

## How to fix this diagnostic?

Revert the changes done by removing the tables and table extensions that have been added.

## Examples triggering this rule

### Example 1 - Adding a table with schema

Version 1 of the extension

```al
// No table named MyTable
```

Version 2 of the extension

```al
table 50100 MyTable
{
    // By default, the table is of type Normal

    fields
    {
        field(1; MyField; Integer) { }
    }
}
```

### Example 2 - Adding a table extension contributing to the table schema

Version 1 of the extension

```al
// No table extension for the table SomeTable
```

Version 2 of the extension

```al
tableextension 50100 MyExtension extends SomeTable
{
    fields
    {
        field(50100; MyExtField; Integer) { }
    }
}
```

## Examples not triggering this rule

### Example 1 - Adding a table without schema

Version 1 of the extension

```al
// No table named MyTable
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

### Example 2 - Adding a table extension not contributing to the table schema

Version 1 of the extension

```al
// No table extension for the table SomeTable
```

Version 2 of the extension

```al
tableextension 50100 MyExtension extends SomeTable
{
    fields
    {
        field(50100; MyFlowField; Integer)
        {
            FieldClass = FlowField;
        }
    }

    procedure MyProcedure()
    begin
    end;
}
```

## Related information 
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
