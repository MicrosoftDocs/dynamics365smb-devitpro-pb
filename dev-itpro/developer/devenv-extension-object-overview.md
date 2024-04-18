---
title: Extension objects overview
description: Get an overview of the extension objects you can create in AL for Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: overview
ms.collection: get-started
ms.date: 03/11/2024
---

# Extension objects overview

This article provides an overview of the different extension objects that you can write to extend base application functionality in [!INCLUDE [prod_short](includes/prod_short.md)]. Extension objects can extend tables, pages, reports, and enums. With an extension object you can, for example, add new fields, actions, and layout to an existing page, or add data items, columns, request pages, and layouts to an existing report. With an enum extension, you can add new values to an existing enumeration. 

For a base object to be extensible, it must be marked with the property `Extensible = true;`. The default value for all objects is that they're extensible. Therefore, you don't have to specify this property explicitly in your code. 

The following table lists the different extension objects that you can create in AL.

| Object type | Description |
|-------------|-------------|
|[Table extension](devenv-table-ext-object.md) | Add fields to an existing table. |
|[Page extension](devenv-page-ext-object.md) | Add fields, actions, and layout to an existing page. |
|[Report extension](devenv-report-ext-object.md) | Add data items, columns, request pages, and layouts to an existing report. |
|[Enum extension](devenv-extensible-enums.md) | Add new values to an existing enumeration. |
|[Permission set extension](devenv-permissionset-ext-object.md) | Add new permissions to an existing permission set. |

## Extension objects in the same app

[!INCLUDE [extension-obj-same-app](includes/extension-obj-same-app.md)]

## See also

[Extensibility overview](devenv-extensibility-overview.md)
[Table extension](devenv-table-ext-object.md)  
[Page extension](devenv-page-ext-object.md)  
[Report extension](devenv-report-ext-object.md)  
[Enum extension](devenv-extensible-enums.md)  
[Permission set extension](devenv-permissionset-ext-object.md)