---
title: "AppSourceCop Hidden AS0073"
description: "Attribute tag must be set."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Hidden AS0073
Attribute tag must be set.

## Description
Attribute tag must be set.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule validates that a tag is specified when using the [Obsolete](../attributes/devenv-obsolete-attribute.md) or [RequiredPending](../attributes/devenv-requiredpending-attribute.md) attribute, or when setting the [Obsolete State](../properties/devenv-obsoletestate-property.md) property. The tag provides tracking information such as the timeline of the deprecation or transition.

For `Obsolete`, the tag appears in the diagnostics AL0432 and AL0433 reported by the AL compiler. For `RequiredPending`, it appears in the AL0924 warning.

The format of the tag is not validated by the AL compiler. However, you can specify an expected format to be validated by the AppSourceCop. Learn more in [AS0076](appsourcecop-as0076.md).

## Setting up AppSourceCop to validate the Obsolete Tag

The diagnostics for rule AS0073 are hidden by default, so you first have to use a [ruleset](../devenv-rule-set-syntax-for-code-analysis-tools.md) to surface them.

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
> To fully validate obsolete properties and attributes, it is recommended to enable the rules [AS0072](appsourcecop-as0072.md), [AS0073](appsourcecop-as0073.md), [AS0074](appsourcecop-as0074.md), [AS0075](appsourcecop-as0075.md), and [AS0076](appsourcecop-as0076.md).

## How to fix this diagnostic?

When the property [Obsolete State](../properties/devenv-obsoletestate-property.md) is used to mark an object as `Obsolete Pending` or `Obsolete Removed`, you need to also specify the property [Obsolete Tag](../properties/devenv-obsoletetag-property.md).

When the attribute [Obsolete](/dynamics365/business-central/dev-itpro/developer/attributes/devenv-obsolete-attribute) is used, you need to specify the obsolete tag attribute parameter.

When the attribute [RequiredPending](../attributes/devenv-requiredpending-attribute.md) is used, you need to specify the `Tag` parameter.


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

### Example 3 - Default interface method marked as RequiredPending without tag

```AL
interface IMyInterface
{
    [RequiredPending('This method will become required.')]
    procedure MyMethod(): Text
    begin
        exit('default');
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

### Example 3 - Default interface method marked as RequiredPending with tag

```AL
interface IMyInterface
{
    [RequiredPending('This method will become required. Add your implementation now.', '26.0')]
    procedure MyMethod(): Text
    begin
        exit('default');
    end;
}
```

## Related information  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
