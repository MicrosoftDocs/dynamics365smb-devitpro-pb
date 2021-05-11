---
title: "AppSourceCop Rule AS0074"
ms.author: solsen
ms.custom: na
ms.date: 05/05/2021
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
# AppSourceCop Rule AS0074
The Obsolete Tag must be the same across branches.

## Description
The Obsolete Tag must be the same across branches. This rule is only relevant only if the Major.Minor format is set.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

This rule verifies that the version specified as obsolete tag for objects that do not change obsolete state (not obsolete, obsolete pending, or obsolete removed) with the current version has not changed.

Obsolete objects which do not have the same state as in the baseline are not validated by this rule, but are validated by [AS0072](appsourcecop-as0072-obsoletetagpreviousversionnotallowed.md).

> [!NOTE]  
> This rule is only enabled when using the default `obsoleteTagPattern` in the AppSourceCop.json.

The version specified as `obsoleteTagVersion` can be the same as the current Major.Minor version specified in the `version` of your `app.json`, but it does not have to.

## Setting up AppSourceCop to validate the Obsolete tag

### Enabling the rule using a ruleset

The diagnostics for rule AS0074 are hidden by default, so you first have to use a [ruleset](../devenv-rule-set-syntax-for-code-analysis-tools.md) in order to surface them.

For example, the following ruleset turns the diagnostic for rule AS0074 into an error.

```json
{
    "name": "My custom ruleset",
    "rules": [
        {
            "id": "AS0074",
            "action": "Error",
            "justification": "Validating that obsolete tags are consistent with the baseline is important"
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

In order to enable the validation, you must specify the `obsoleteTagVersion` in the AppSourceCop.json, but not specify the `obsoleteTagPattern` property to use the default pattern.

```json
{
    "obsoleteTagVersion": "2.0"
}
```

## How to fix this diagnostic?

In order to fix this diagnostic, make sure that all objects which did not change obsolete state in comparison to the baseline have an obsolete tag whose value is the one specified in the `obsoleteTagVersion` of the AppSourceCop.json.

## Example of code triggering this rule

In the following example, the AppSourceCop is run against a baseline which has version 1.0 and expects the obsolete tag version for objects changing obsolete states to be 2.0.

```json
{
    "version": "1.0",
    "obsoleteTagVersion": "2.0"
}
```

### Modifying the obsolete tag for an object that does not change obsolete state

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
    ObsoleteState = Pending;
    ObsoleteReason = 'Use table X instead.';
    ObsoleteTag = '2.0';

    fields
    {
        field(50100; MyField; Integer) { }
    }
}
```

In the current version of the extension, the obsolete tag has changed from 1.0 to 2.0, which is not allowed.

## Example of code not triggering this rule

In the following example, the AppSourceCop is run against a baseline which has version 1.0 and expects the obsolete tag version for objects changing obsolete states to be 2.0.

```json
{
    "version": "1.0",
    "obsoleteTagVersion": "2.0"
}
```

### Preserving the obsolete tag for an object that does not change obsolete state

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use codeunit X instead.';
    ObsoleteTag = '1.0';
}

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use codeunit X instead.';
    ObsoleteTag = '1.0';
}
```

The codeunit was marked as obsolete pending in the baseline and its obsolete tag value does not change with the new version.

### Adding a tag for an obsolete object that didn't have one - lower than specified

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use codeunit X instead.';
}

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use codeunit X instead.';
    ObsoleteTag = '1.0';
}
```

The codeunit was marked as obsolete pending in the baseline without an obsolete tag. The new version of the extension specifies an obsolete version which is lower than the `obsoleteTagVersion`. This change is allowed by rule AS0074 in order to enable specifying tags without fixing the baselines.

### Adding a tag for an obsolete object that didn't have one - higher than specified

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use codeunit X instead.';
}

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use codeunit X instead.';
    ObsoleteTag = '3.0';
}
```

The codeunit was marked as obsolete pending in the baseline without an obsolete tag. The new version of the extension specifies an obsolete version which is higher than the `obsoleteTagVersion`. This change is allowed by rule AS0074 in order to enable specifying tags without fixing the baselines. However, a diagnostic will be reported by [AS0072](appsourcecop-as0072-obsoletetagpreviousversionnotallowed.md).

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
