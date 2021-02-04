---
title: "Obsolete Reason must be set."
ms.author: solsen
ms.custom: na
ms.date: 01/11/2021
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
# AppSourceCop Rule AS0075
Obsolete Reason must be set.  

## Description
Obsolete Reason must be set.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

When an object, element, variable or procedure is marked as obsolete, you should also specify an obsolete reason. The obsolete reason can be used to provide valuable information, such as the reason for the obsoletion or a workaround to achieve the same goal, to developers that are referencing it. The obsolete reason appears in the message of the diagnostics AL0432 and AL0433 reported by the AL compiler when referencing obsolete elements.

## How to fix this diagnostic?

When the property [Obsolete State](../properties/devenv-obsoletestate-property.md) is used to mark an object as `Obsolete Pending` or `Obsolete Removed`, you need to also specify the property [Obsolete Reason](../properties/devenv-obsoletereason-property.md).

When the attribute [Obsolete](../methods/devenv-obsolete-attribute.md) is used, you need to specify the obsolete reason attribute parameter.

## Code examples triggering the rule

### Example 1 - Table marked as Obsolete Pending

```AL
table 50100 MyTable
{
    ObsoleteState = Pending;

    fields
    {
        field(50100; MyField; Integer) { }
    }
}
```

### Example 2 - Procedure marked as Obsolete

```AL
codeunit 50100 MyCodeunit
{
    [Obsolete]
    procedure MyProcedure()
    begin
        // Business logic.
    end;
}
```

## Code examples not triggering the rule

### Example 1 - Table marked as Obsolete Pending

```AL
table 50100 MyTable
{
    ObsoleteState = Pending;
    ObsoleteReason = 'This table is being deprecated for reason X. Use table Y instead.';

    fields
    {
        field(50100; MyField; Integer) { }
    }
}
```

### Example 2 - Procedure marked as Obsolete

```AL
codeunit 50100 MyCodeunit
{
    [Obsolete('This procedure is being deprecated for reason X. Use procedure Y instead.')]
    procedure MyProcedure()
    begin
        // Business logic.
    end;
}
```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  