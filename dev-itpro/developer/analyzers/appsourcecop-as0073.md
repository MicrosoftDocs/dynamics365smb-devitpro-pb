---
title: "AppSourceCop Rule AS0073"
description: "Obsolete Tag must be set."
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
# AppSourceCop Rule AS0073
Obsolete Tag must be set.

## Description
Obsolete Tag must be set.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

When an object, element, variable or procedure is marked as obsolete, you should also specify an obsolete tag. The obsolete tag can be used to provide information, such as the timeline of the deprecation, to developers that are referencing it. The obsolete tag appears in the message of the diagnostics AL0432 and AL0433 reported by the AL compiler when referencing obsolete elements.

The format of the Obsolete tag is not validated by the AL compiler. However, you can specify an expected format to be validated by the AppSourceCop. For more information, see [AS0076](appsourcecop-as0076.md).

## Setting up AppSourceCop to validate the Obsolete Tag

The diagnostics for rule AS0073 are hidden by default, so you first have to use a [ruleset](../devenv-rule-set-syntax-for-code-analysis-tools.md) in order to surface them.

For example, the following ruleset turns the diagnostic for rule AS0073 into an error.

```json
{
    "name": "My custom ruleset",
    "rules": [
        {
            "id": "AS0073",
            "action": "Error",
            "justification": "Validating that obsolete tags are specified is important"
        }
    ]
}
```

```json
{
    "al.ruleSetPath": "custom.ruleset.json"
}
```

> [!NOTE]  
> In order to fully validate obsolete properties and attributes, it is recommended to enable the rules [AS0072](appsourcecop-as0072.md), [AS0073](appsourcecop-as0073.md), [AS0074](appsourcecop-as0074.md), [AS0075](appsourcecop-as0075.md), and [AS0076](appsourcecop-as0076.md).

## How to fix this diagnostic?

When the property [Obsolete State](../properties/devenv-obsoletestate-property.md) is used to mark an object as `Obsolete Pending` or `Obsolete Removed`, you need to also specify the property [Obsolete Tag](../properties/devenv-obsoletetag-property.md).

When the attribute [Obsolete](../methods/devenv-obsolete-attribute.md) is used, you need to specify the obsolete tag attribute parameter.


## Code examples triggering the rule

### Example 1 - Table marked as Obsolete Pending

```AL
table 50100 MyTable
{
    ObsoleteState = Pending;
    ObsoleteReason = 'This table has been deprecated for reason X. Use table Y instead.';

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

## Code examples not triggering the rule

### Example 1 - Table marked as Obsolete Pending

```AL
table 50100 MyTable
{
    ObsoleteState = Pending;
    ObsoleteReason = 'This table is being deprecated for reason X. Use table Y instead.';
    ObsoleteTag = 'This table is being deprecated with the newest build of the product.';

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
    [Obsolete('This procedure is being deprecated for reason X. Use procedure Y instead.', 'This table is being deprecated with the newest build of the product.')]
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
