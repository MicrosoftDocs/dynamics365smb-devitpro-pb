---
title: "AppSourceCop Warning AS0098"
description: "An affix is needed."
ms.author: solsen
ms.custom: na
ms.date: 09/21/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0098
An affix is needed.

## Description
An affix is needed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

In order to avoid name clashes for objects added by your extension and objects added by other extensions, an affix must be prepended or appended to the name of all new application objects, extension objects, and fields. For more information, see [Benefits and Guidelines for using a Prefix or Suffix](../../compliance/apptest-prefix-suffix.md).

> [!NOTE]  
> This rule mimics the behavior of [AS0011](appsourcecop-as0011.md) for a limited set of objects members for which AS0011 wasn't enforced when they were introduced in AL. Having them reported as a separate rule allows more granularity, especially in regard to AL code not respecting the use of affixes prior to the implementation of this rule.

### Which object members are validated?

The following object members are validated by AS0098:

- Enum Values defined in Enum Extension objects
- Data Items defined in Report Extension objects
- Columns defined in Report Extension objects
- Labels defined in Report Extension objects

Other AL objects and object members are validated by [AS0011](appsourcecop-as0011.md).

## When to fix this diagnostic?

### For new object members

For objects that are introduced with the current version of the extension, appending one of the mandatory affixes to the object's name will fix the diagnostic.
Renaming objects which are not part of the baseline is allowed.

### For existing objects

For objects which already exist in the version of the extension used as baseline, it is not possible to rename them. It is therefore not possible to append one of the mandatory affixes. Instead, the offending object should be deprecated using the [ObsoleteState](../properties/devenv-obsoletestate-property.md) property and a new object whose name has one of the mandatory affixes should be introduced.

For detailed examples, see [AS0011](appsourcecop-as0011.md).

> [!IMPORTANT]  
> Introducing a new enum value can be a breaking change if this enum value is stored in the database. You must carefully assess the impact of your changes before introducing a new enum value. This implies writing upgrade code for your app and for the dependent extensions storing this enum value in their own tables.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  