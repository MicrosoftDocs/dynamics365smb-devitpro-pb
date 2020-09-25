---
title: "Unsupported table field property change"
ms.author: solsen
ms.custom: na
ms.date: 06/19/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0036
Unsupported table field property change  

## Description
Modifying table field properties can lead to destructive changes that will break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

It is not allowed to change property values in a way that would prevent the schema synchronization of the extension on existing installations, or that would break dependent extensions.

## Code examples triggering the rule

### Example 1 - Changing Enabled from true to false

Version 1.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            Enabled = true; // This is also the default value.
        }
    }
}
```

Version 2.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            Enabled = false;
        }
    }
}
```

In version 2.0, the field is not enabled anymore. Disabled fields are not created in the database during schema synchronization. Disabling a field is then similar to removing the field and is then a destructive change.

### Example 2 - Changing FieldClass from Normal to FlowField

Version 1.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            FieldClass = Normal; // This is also the default value.
        }
    }
}
```

Version 2.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            FieldClass = FlowField; 
        }
    }
}
```

In version 2.0, the field became a [FlowField](../devenv-flowfields.md). As FlowFields are not physical fields that are stored in the database, they are not created during schema synchronization. Changing a Normal field to FlowField is a then destructive change.

### Example 3 - Changing the Access property to make a field less accessible

Version 1.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            Access = Public; // This is also the default value.
        }
    }
}
```

Version 2.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            Access = Local; 
        }
    }
}
```

In version 2.0, the field `MyField` is now only accessible within `MyTable` and cannot be used from other extension. If a dependent extension references this field, this will lead to a compilation error similar to `'MyField' is inaccessible due to its protection level (AL0161)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```
codeunit 50120 AnotherCodeunit
{
    trigger OnRun()
    var
        r: Record MyTable;
    begin
        r.MyField := 1;
    end;
}
```

## Code examples not triggering the rule

### Example 1 - Setting Enabled from false to true

Version 1.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            Enabled = false;
        }
    }
}
```

Version 2.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            Enabled = true; // This is also the default value.
        }
    }
}
```

In version 2.0, the field is now enabled. Disabled fields are not created in the database during schema synchronization. For the schema synchronization, enabling a field is then similar to creating a new field and is then not a destructive change.

### Example 2 - Changing FieldClass from FlowField to Normal

Version 1.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            FieldClass = FlowField;
        }
    }
}
```

Version 2.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            FieldClass = Normal; // This is also the default value.
        }
    }
}
```

In version 2.0, the [FlowField](../devenv-flowfields.md) became a Normal field. As FlowFields are not physical fields that are stored in the database, they are not created during schema synchronization. For the schema synchronization, changing a flow field to a normal field is similar to creating a new field and is then not a destructive change.

### Example 3 - Changing the Access property to make a field more accessible

Version 1.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            Access = Protected;
        }
    }
}
```

Version 2.0 of the extension:
```
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            Access = Public; 
        }
    }
}
```

In version 1.0, `MyField` was accessible to table extensions extending `MyTable`. In version 2.0, it is now accessible to other extensions both in and outside of table extensions extending `MyTable`. This is not a breaking change.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
