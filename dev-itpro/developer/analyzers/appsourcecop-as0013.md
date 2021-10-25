---
title: "AppSourceCop Rule AS0013"
description: "The field identifier must be within the allowed range and outside the range allocated to per-tenant customizations."
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
# AppSourceCop Rule AS0013
The field identifier must be within the allowed range

## Description
The field identifier must be within the allowed range and outside the range allocated to per-tenant customizations.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

In order to avoid ID clashes for objects added by your extension and objects added by other extensions, you must respect the ID range specified in the [app.json](../devenv-json-files.md) file of your extension when declaring new AL objects. For more information about ID ranges in Business Central, see [Object Ranges](../devenv-object-ranges.md).

The following illustrates an example of an `app.json` file specifying an ID range:

```JSON
{
    "idRanges": 
    [
        {
            "from": 1000000,
            "to": 1000100
        }
    ]
}
```

> [!NOTE]
> For table fields defined in table objects and enums defined in enum objects, it is possible to use an ID within the range `[0-49,999]`.

The rule [AS0084](appsourcecop-as0084.md) validates that the ID range has been specified in the `app.json` of the extension.

## Code examples

For the following examples, let's consider this `app.json`:

```JSON
{
    "idRanges": 
    [
        {
            "from": 1000000,
            "to": 1000100
        }
    ]
}
```

### Code example triggering the rule - Invalid Codeunit ID

The following example triggers the rule because the ID of the codeunit `MyCodeunit` is not defined within the ID range defined in the `app.json` file.

```AL
codeunit 50100 MyCodeunit
{
    // Business logic
}
```

### Code example triggering the rule - Invalid Table Extension Field ID

The following example triggers the rule because the ID of the field `MyField` is not defined within the ID range defined in the `app.json` file.

```AL
tableextension 1000000 MyTableExt extends MyTable
{
    fields
    {
        field(50100; MyField; Integer) { }
    }
}
```

> [!NOTE]  
> Fields defined in table objects are validated by [AS0099](appsourcecop-as0099.md).

## How to fix this diagnostic?

> [!NOTE]  
> If you are targeting the AppSource marketplace and do not have an ID range assigned, follow the steps defined in [Get Started with Building Apps](../readiness/get-started.md).

If you are not targeting the AppSource marketplace, you can suppress this rule using [rulesets](../devenv-using-code-analysis-tool-with-rule-set.md).

### For new objects

For objects that are introduced with the current version of the extension, changing the ID of the object will fix the diagnostic.
Changing the ID of objects which are not part of the baseline is allowed.

### For existing objects

For objects which already exist in the version of the extension used as baseline, it is not possible to change their ID. Instead, the offending object should be deprecated using the [ObsoleteState](../properties/devenv-obsoletestate-property.md) property and a new object whose ID is within the range allocated for the extension should be introduced.

#### Example - Modifying the ID of an existing codeunit

As an example, let's consider an extension if the ID range assigned to the extension is `[1,000,000 -  1,000,100]` and the extension defines:

```AL
codeunit 50100 MyCodeunit
{
    procedure MyProcedure()
    begin
        // Business logic.
    end;
}
```

The extension should be modified into:

```AL
codeunit 50100 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use MyNewCodeunit instead.';

    procedure MyProcedure()
    var 
        c: Codeunit MyNewCodeunit;
    begin
        // Re-direct calls to not break the runtime behaviour of dependent extensions.
        c.MyProcedure();
    end;
}

codeunit 1000000 MyNewCodeunit
{
    procedure MyProcedure()
    begin
        // Business logic.
    end;
}
```

Once all dependent extensions have been updated to use the codeunit `MyNewCodeunit` instead of `MyCodeunit`, the codeunit `MyCodeunit` can be removed.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
