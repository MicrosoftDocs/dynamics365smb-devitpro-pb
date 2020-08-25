---
title: "An affix is required"
ms.author: solsen
ms.custom: na
ms.date: 08/25/2020
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
# AppSourceCop Rule AS0011
An affix is required  

## Description
An affix is required.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

In order to avoid name clashes for objects added by your extension and objects added by other extensions, an affix must be prepended or appended to the name of all new application objects, extension objects, and fields. For more information, see [Benefits and Guidelines for using a Prefix or Suffix](../../compliance/apptest-prefix-suffix.md).

### Using the property mandatoryAffixes

The rule validates that at least one of the affixes specified in the `mandatoryAffixes` property of the `AppSourceCop.json` file is used either at prefix or at suffix on identifier names of new elements. 

|Setting|Mandatory|Value|
|-------|---------|-----|
|mandatoryAffixes|No|Affixes that must be prepended or appended to the name of all new application objects, extension objects, and fields.|

The `mandatoryAffixes` property expects to receive an array of string as follows:

```
{
    "mandatoryAffixes": [ "Foo", "Bar" ]
}
```

### Using the properties mandatoryPrefix and mandatorySuffix.

In order to preserve backward compatibility, the properties `mandatoryPrefix` and `mandatorySuffix` are still supported by the AppSourceCop.

Both properties expect to receive a string as follows:
```
{
    "mandatoryPrefix": "Prefix",
    "mandatorySuffix": "Suffix"
}
```

However, their meaning has been modified to be closer to the new `mandatoryAffixes` property. The mandatory prefix and mandatory suffix properties are now both defining an affix that can be used either as prefix or as suffix.

As a consequence, we encourage you to use the new property `mandatoryAffixes` that offers more flexibility by allowing you to define more than two affixes, but also a more meaningful name .

## How to fix this diagnostic?

### For new objects

For objects that are introduced with the current version of the extension, appending one of the mandatory affixes to the object's name will fix the diagnostic.
Renaming objects which are not part of the baseline is allowed.

### For existing objects

For objects which already exist in the version of the extension used as baseline, it is not possible to rename them. It is therefore not possible to append one of the mandatory affixes. Instead, the offending object should be deprecated using the [ObsoleteState](../properties/devenv-obsoletestate-property.md) property and a new object whose name has one of the mandatory affixes should be introduced.

#### Example - Adding an affix to an existing codeunit

For instance, if the baseline of the extension contains a codeunit without affix:
```
codeunit 50100 MyCodeunit
{
    procedure MyProcedure()
    begin
        // Business logic.
    end;
}
```

The extension should be modified into:
```
codeunit 50100 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use Foo_MyCodeunit instead.';

    procedure MyProcedure()
    var 
        c: Codeunit Foo_MyCodeunit;
    begin
        // Re-direct calls to not break the runtime behaviour of dependent extensions.
        c.MyProcedure();
    end;
}

codeunit 50120 Foo_MyCodeunit
{
    procedure MyProcedure()
    begin
        // Business logic.
    end;
}
```

Once all dependent extensions have been updated to use the codeunit `Foo_MyCodeunit` instead of `MyCodeunit`, the codeunit `MyCodeunit` can be removed.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  