---
title: Extension objects overview
description: Get an overview of the extension objects you can create in AL for Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: overview
ms.collection: get-started
ms.date: 02/20/2024
---

# Extension objects overview

This article provides an overview of the different extension objects that you can write to extend base application functionality in [!INCLUDE [prod_short](includes/prod_short.md)]. Extension objects can extend tables, pages, reports, and enums. With an extension object you can, for example, add new fields, actions, and layout to an existing page, or add data items, columns, request pages, and layouts to an existing report. And you can add new values to an existing enumeration. 

For a base object to be extensible, it must be marked with the property `Extensible = true;`. The default value for all objects is that they are extensible. 

The following table lists the different extension objects that you can create in AL.

| Object type | Description |
|-------------|-------------|
|[Table extension](devenv-table-ext-object.md) | Add fields to an existing table. |
|[Page extension](devenv-page-ext-object.md) | Add fields, actions, and layout to an existing page. |
|[Report extension](devenv-report-ext-object.md) | Add data items, columns, request pages, and layouts to an existing report. |
|[Enum extension](extensible-enums.md) | Add new values to an existing enumeration. |
|[Permission set extension](permissionset-ext-object.md) | Add new permissions to an existing permission set. |


## Extension objects in the same app

> [!NOTE]
> This feature is available with runtime 13.0 and later.

Starting from runtime 13.0, large applications can achieve a separation of concerns by allowing extension objects to exist within the same app as their target. This enables the creation of multiple extensions for a single target within the same app. When table extensions reside in the same app as their target, their fields and keys are transferred to the base table, eliminating the need for SQL-joins at runtime.

With runtime 13.0, extension objects from a specific app are applied to the target based on the extension object ID. This introduces the following new compiler validations:

* Base objects are prohibited from referencing members from extension objects.
* An extension object can only reference members from other extension objects within the same app if the other extension object has a lower object ID.

## See also

