---
title: "The ObsoleteTag property and the Tag in the Obsolete attribute must be set to the next release version."
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
# AppSourceCop Rule AS0072
The ObsoleteTag property and the Tag in the Obsolete attribute must be set to the next release version.  

## Description
The ObsoleteTag property and the Tag in the Obsolete attribute must be set to the next release version (Major.Minor). This rule is only relevant if the Major.Minor format is set.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

This rule verifies that the version specified as obsolete tag for objects whose obsolete state (not obsolete, obsolete pending, or obsolete removed) is updated with the current version is matching the version specified in the `obsoleteTagVersion` property of the AppSourceCop.json.

Obsolete objects which have the same obsolete state as in the baseline are not validated by this rule, but are validated by [AS0074](appsourcecop-as0074-obsoletetagdifferentfrombaselinenotallowed.md).

> [!NOTE]  
> This rule is only enabled when using the default `obsoleteTagPattern` in the AppSourceCop.json.

The version specified as `obsoleteTagVersion` can be the same as the current Major.Minor version specified in the `version` of your `app.json`, but it does not have to.

## Setting up AppSourceCop to validate the Obsolete tag

### Enabling the rule using a ruleset

The diagnostics for rule AS0072 are hidden by default, so you have to use a [ruleset](../devenv-rule-set-syntax-for-code-analysis-tools.md) in order to surface them.

For example, the following ruleset turns the diagnostic for rule AS0072 into an error.

```json
{
    "name": "My custom ruleset",
    "rules": [
        {
            "id": "AS0072",
            "action": "Error",
            "justification": "Validating that obsolete tags have the right version is important"
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
> In order to fully validate obsolete properties and attributes, it is recommended to enable the rules [AS0072](appsourcecop-as0072-obsoletetagpreviousversionnotallowed.md), [AS0073](appsourcecop-as0073-obsoletetagmissingnotallowed.md), [AS0074](appsourcecop-as0074-obsoletetagdifferentfrombaselinenotallowed.md), [AS0075](appsourcecop-as0075-obsoletereasonmissingnotallowed.md), and [AS0076](appsourcecop-as0076-obsoletetagformatnotallowed.md).

### Setting up the AppSourceCop.json

In order to enable the validation, you must specify the `obsoleteTagVersion` in the AppSourceCop.json, without specifying the `obsoleteTagPattern` property so that the default pattern is used.

```json
{
    "obsoleteTagVersion": "2.0"
}
```

## How to fix this diagnostic?

In order to fix this diagnostic, make sure that all objects which are changing obsolete state in comparison to the baseline have an obsolete tag whose value is the one specified in the `obsoleteTagVersion` of the AppSourceCop.json.

## Example of code triggering this rule

In the following example, the AppSourceCop is run against a baseline which has version 1.0 and expects the obsolete tag version for objects changing obsolete states to be 2.0.

```json
{
    "version": "1.0",
    "obsoleteTagVersion": "2.0"
}
```

### Newly obsoleted object specifying a version different than the obsolete tag version

Version of the extension used as baseline:
```AL
table 50100 MyTable
{
    fields
    {
        field(50100; MyField; Integer) { }
    }

    procedure MyProcedure()
    begin
    end;
}
```

Current version of the extension:
```AL
table 50100 MyTable
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use table X instead.';
    ObsoleteTag = '2.1';

    fields
    {
        field(50100; MyField; Integer) { }
    }

    [Obsolete('Use function Y instead', '3.0')]
    procedure MyProcedure()
    begin
    end;
}
```

In the current version of the extension, the table and the procedure are marked as obsolete pending. However, the obsolete tag values specified in the AL code are higher than the one specified in the AppSourceCop.json. The rule AS0072 will be triggered.

### Preserving the obsolete tag for an object that changes obsolete state

Version of the extension used as baseline:
```AL
table 50100 MyTable
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use table X instead.';
    ObsoleteTag = '1.0';

    fields
    {
        field(50100; MyField; Integer) { }
    }
}
```

Current version of the extension:
```AL
table 50100 MyTable
{
    ObsoleteState = Removed;
    ObsoleteReason = 'Use table X instead.';
    ObsoleteTag = '1.0';

    fields
    {
        field(50100; MyField; Integer) { }
    }
}
```

In the current version of the extension, the table's obsolete state is changed from obsolete pending to obsolete removed, which means that only upgrade code is now able to reference it. However, the obsolete tag value specified in the AL code has not been updated and is now lower than the one specified in the AppSourceCop.json. The rule AS0072 will be triggered.

## Example of code not triggering this rule

In the following example, the AppSourceCop is run against a baseline which has version 1.0 and expects the obsolete tag version for objects changing obsolete states to be 2.0.

```json
{
    "version": "1.0",
    "obsoleteTagVersion": "2.0"
}
```

### Specifying a version equal to the target obsolete tag version

Version of the extension used as baseline:
```AL
codeunit 50100 MyCodeunit
{
    procedure MyProcedure()
    begin
    end;
}
```

Current version of the extension:
```AL
codeunit 50100 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use codeunit X instead.';
    ObsoleteTag = '2.0';

    [Obsolete('Use function Y instead', '2.0')]
    procedure MyProcedure()
    begin
    end;
}
```

The codeunit MyCodeunit is marked as obsolete with the current version of the extension. As the specified obsolete tags are matching the `obsoleteTagVersion`, no diagnostics are reported.

### Updating the obsolete tag for an obsolete object that does changes obsolete state

Version of the extension used as baseline:
```AL
table 50100 MyTable
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use table X instead.';
    ObsoleteTag = '1.0';

    fields
    {
        field(50100; MyField; Integer) { }
    }
}
```

Current version of the extension:
```AL
table 50100 MyTable
{
    ObsoleteState = Removed;
    ObsoleteReason = 'Use table X instead.';
    ObsoleteTag = '2.0';

    fields
    {
        field(50100; MyField; Integer) { }
    }
}
```

In the current version of the extension, the table's obsolete state is changed from obsolete pending to obsolete removed, which means that only upgrade code is now able to reference it. The obsolete tag value specified in the AL code has also been updated to the current `obsoleteTagVersion` in the AppSourceCop.json. The rule AS0072 will not be triggered.

### Preserving the obsolete tag for an object that does not change obsolete state

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use codeunit X instead.';
    ObsoleteTag = '1.0';

    [Obsolete('Use function Y instead', '1.0')]
    procedure MyProcedure()
    begin
    end;
}
```

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use codeunit X instead.';
    ObsoleteTag = '1.0';

    [Obsolete('Use function Y instead', '1.0')]
    procedure MyProcedure()
    begin
    end;
}
```

The codeunit MyCodeunit is marked as obsolete pending in the baseline and remains obsolete in the current version. The obsolete tag is then not validated by rule AS0072, but is validated by AS0074. Note that this example does not trigger any diagnostics from the AppSourceCop for obsolete tags.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
