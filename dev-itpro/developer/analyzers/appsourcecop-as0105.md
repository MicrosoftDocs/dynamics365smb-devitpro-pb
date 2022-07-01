---
title: "AppSourceCop Error AS0105"
description: "Objects that are pending obsoletion with an obsolete tag version lower than the minimum set in the AppSourceCop.json file are not allowed."
ms.author: solsen
ms.custom: na
ms.date: 03/21/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0105
Object pending obsoletion contains an expired ObsoleteTag.

## Description
Objects that are pending obsoletion with an obsolete tag version lower than the minimum set in the AppSourceCop.json file are not allowed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Microsoft timeline for deprecating code

When Microsoft obsoletes code, the obsolete tag is set to the version in which the element is obsoleted. After an object has been marked as obsoleted, another 12 months will pass before the object is actually removed - in some cases this can also be longer.

If the tag is set to, for example, `'18.0'`, the code will still be present in versions 19 and 20. We will at the earliest remove the code in version 21. Assuming the code is removed in version 21, this can happen right after version 20 was released, but could also happen later during the release.

This rule helps you validate early if your app is ready for a given release of Business Central without relying on Microsoft to actually remove the code.

Fore more information about deprecating code, see [Microsoft Timeline for Deprecating Code in Business Central](../devenv-deprecation-timeline.md).

## How to enable the validation?

By setting the `obsoleteTagMinAllowedMajorMinor` in the AppSourceCop.json, you can validate that your extension does not reference any objects that are pending obsoletion with an obsolete tag lower than the version you have specified.

If you want to validate that your extension is ready for version `21.0`, then you must set the `obsoleteTagMinAllowedMajorMinor` property to `18.0` since objects will remain available for at least 12 months (2 releases) before being removed.

For example:
```JSON
{
    "obsoleteTagMinAllowedMajorMinor": "18.0"
}
```

> [!IMPORTANT]
> Enabling this rule has a performance impact, especially on large projects. We do not recommend keeping it enabled always, but we highly recommend enabling it in order to remove references to obsolete pending objects that can potentially be removed with the upcoming release of Business Central. After all object references have been fixed, you can turn off the rule again.

## How to fix this diagnostic?

If you do not want to validate if your app is referencing obsolete objects with obsolete tags lower than a given version, remove the property `obsoleteTagMinAllowedMajorMinor` in the AppSourceCop.json file.

If you want to validate if your app is referencing obsolete objects with obsolete tags lower than a given version, remove the references to obsolete code following the instructions in the obsolete reason.

## Code examples

For the following examples, let's consider that you have an extension defining a codeunit that references an obsolete pending page from another extension.

Your extension:
```AL
codeunit 50100 MyCodeunit
{
    var
        p: MyPage;
}
```

Dependency extension:
```AL
page 50100 SomePage
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use page X instead.'
    ObsoleteTag = '18.0';
}
```

### Code example not triggering the rule

If the `obsoleteTagMinAllowedMajorMinor` version is set to any version equal to `18.0` or lower than `18.0`, then no error is reported.

Example:
```JSON
{
    "obsoleteTagMinAllowedMajorMinor": "17.0"
}
```

### Code example not triggering the rule

If the `obsoleteTagMinAllowedMajorMinor` version is set to any version higher than `18.0`, then an error is reported.

Example:
```JSON
{
    "obsoleteTagMinAllowedMajorMinor": "19.0"
}
```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
