---
title: "AppSourceCop Warning AS0075"
description: "Attribute reason must be set."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0075
Attribute reason must be set.

## Description
Attribute reason must be set.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

When an object, element, variable, or procedure is marked with [Obsolete](../attributes/devenv-obsolete-attribute.md) or [RequiredPending](../attributes/devenv-requiredpending-attribute.md), you should also specify a reason. The reason provides valuable information -- such as why the change is happening or a workaround -- to developers who reference the element. For `Obsolete`, the reason appears in AL0432 and AL0433. For `RequiredPending`, it appears in AL0924.

## How to fix this diagnostic?

When the property [Obsolete State](../properties/devenv-obsoletestate-property.md) is used to mark an object as `Obsolete Pending` or `Obsolete Removed`, you need to also specify the property [Obsolete Reason](../properties/devenv-obsoletereason-property.md).

When the attribute [Obsolete](/dynamics365/business-central/dev-itpro/developer/attributes/devenv-obsolete-attribute) is used, you need to specify the obsolete reason attribute parameter.

When the attribute [RequiredPending](../attributes/devenv-requiredpending-attribute.md) is used, you need to specify the `Reason` parameter.

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

## Related information  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)