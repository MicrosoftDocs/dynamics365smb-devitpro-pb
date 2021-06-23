---
title: "AppSourceCop Rule AS0095"
description: "Table field access cannot be reduced. You can only change the current access to a higher level."
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
# AppSourceCop Rule AS0095
Table field access cannot degrade.

## Description
Table field access cannot be reduced. You can only change the current access to a higher level.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
This rule verifies that the access property of a field in Table or TableExtensionhas has not been reduced between revisions. This rule validate only if the table access property is set to Public in the baseline extension. More information on different access levels for both fields and tables you can find [here](../devenv-using-access-modifier.md).

## Code examples triggering the rule

### Example 1: Reducing the Access Level to lower than Public

Version 1.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Public; // If omitted the default value is Public
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Public;
        }
    }
}

```

Version 2.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Public; // If omitted the default value is Public
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Protected; // or Local, Internal
        }
    }
}
```

### Example 2: Reducing the Access Level to lower than Protected

Version 1.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Public; // If omitted the default value is Public
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Protected;
        }
    }
}

```

Version 2.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Public; // If omitted the default value is Public
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Local; // Internal
        }
    }
}
```

The same rule applies for field defined in TableExtension.

### Example 3: Reducing the Access Level to lower than Public of a field defined in TableExtension

Version 1.0 of the extension:
```AL
tableextension 50126 MyTableExtension extends MyTable
{
    fields
    {
        field(2; OtherField; Integer)
        {
            Access = Public;
        }
    }
}
```

Version 2.0 of the extension:
```AL
tableextension 50126 MyTableExtension extends MyTable
{
    fields
    {
        field(2; OtherField; Integer)
        {
            Access = Protected; // or Local, Internal
        }
    }
}
```

## Code Examples that don't trigger the rule

### Example 1: Exposing the table for the first time

Version 1.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Internal;
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Public;
        }
    }
}
```
Version 2.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Public;
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Protected; // or any other access modifier
        }
    }
}
```
Changing the Access level from Internal to Public of MyTable means that we are exposing the Table for first time, hence we cannot degrade the access level of the field since it has been indirectly already Internal.

### Example 2: Changing the Access level from Local to Internal or vice versa

Version 1.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Public;
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Local;
        }
    }
}
```
Version 2.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Public;
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Internal;
        }
    }
}
```

Changing Access level from Local to Internal or vice versa will not trigger the rule since they are both module Access Modifiers.

### Example 3: Changing the Access Level to Public or Protected from lower Access Level

Version 1.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Public;
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Local; // or Internal
        }
    }
}
```
Version 2.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Public;
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Public; // or Protected
        }
    }
}
```

### Example 4: Changing the Access Level to Public from Protected

Version 1.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Public;
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Protected;
        }
    }
}
```
Version 2.0 of the extension:
```AL
table 50122 MyTable
{
    Access = Public;
    fields
    {
        field(1; FirstField; Code[1])
        {
            Access = Public;
        }
    }
}
```

### Example 5: Changing the Access Level to Public or Protected from lower Access Level in TableExtension

Version 1.0 of the extension:
```AL
tableextension 50126 MyTableExtension extends MyTable
{
    fields
    {
        field(2; OtherField; Integer)
        {
            Access = Local; // or Internal
        }
    }
}
```

Version 2.0 of the extension:
```AL
tableextension 50126 MyTableExtension extends MyTable
{
    fields
    {
        field(2; OtherField; Integer)
        {
            Access = Public; // or Protected
        }
    }
}
```

### Example 6: Changing the Access Level to Public from Protected in TableExtension

Version 1.0 of the extension:
```AL
tableextension 50126 MyTableExtension extends MyTable
{
    fields
    {
        field(2; OtherField; Integer)
        {
            Access = Protected;
        }
    }
}
```

Version 2.0 of the extension:
```AL
tableextension 50126 MyTableExtension extends MyTable
{
    fields
    {
        field(2; OtherField; Integer)
        {
            Access = Public;
        }
    }
}
```


## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  