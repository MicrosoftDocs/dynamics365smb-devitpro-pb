---
title: "AppSourceCop Info AS0099"
description: "The member ID should be within the allowed range and outside the range allocated to per-tenant customizations."
ms.author: solsen
ms.custom: na
ms.date: 12/07/2021
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
# AppSourceCop Info AS0099
The member ID should be within the allowed range

## Description
The member ID should be within the allowed range and outside the range allocated to per-tenant customizations.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

In order to avoid ID clashes for objects added by your extension and objects added by other extensions, you must respect the ID range specified in the [app.json](../devenv-json-files.md) file of your extension when declaring new AL objects. For more information on ID ranges in Business Central, see [Object Ranges](../devenv-object-ranges.md).

> [!NOTE]  
> This rule mimics the behavior of [AS0013](appsourcecop-as0013.md) for a limited set of objects members for which AS0013 wasn't enforced when they were introduced in AL. Having them reported as a separate rule allows more granularity, especially in regards to AL code not respecting the use of affixes prior to the implementation of this rule.

### Which object members are validated?

The following object members are validated by AS0098:

- Enum Values defined in Enum Extension objects
- Fields defined in Table Objects

Other AL objects and object members are validated by [AS0013](appsourcecop-as0013.md).

## When to fix this diagnostic?

### For new object members

For objects that are introduced with the current version of the extension, changing the ID of the object will fix the diagnostic.
Changing the ID of objects which are not part of the baseline is allowed.

### For existing objects

For objects which already exist in the version of the extension used as baseline, it is not possible to change their ID. Instead, the offending object should be deprecated using the [ObsoleteState](../properties/devenv-obsoletestate-property.md) property and a new object whose ID is within the range allocated for the extension should be introduced.

For detailed examples, see [AS0013](appsourcecop-as0013.md).

> [!IMPORTANT]  
> Changing the ID of an enum value has an impact on the data stored in the database. You must carefully assess the impact of your changes before changing the ID of an enum value. This implies writing upgrade code for your app and for the dependent extensions storing this enum value in their own tables.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
