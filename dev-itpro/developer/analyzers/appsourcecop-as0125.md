---
title: "AppSourceCop Info AS0125"
description: "Changes affecting the XLIFF translation ID of an object or object member that has been published are not allowed, because this will break the translations provided by dependent extensions for your extension."
ms.author: solsen
ms.date: 12/19/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
ms.custom:
 - ai-gen-docs-bap
 - ai-seo-date: 12/19/2024
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Info AS0125
Changes the XLIFF translation ID are not allowed.

## Description
Changes affecting the XLIFF translation ID of an object or object member that has been published are not allowed, because this will break the translations provided by dependent extensions for your extension.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Altering the XLIFF translation ID can break the translations provided by dependent extensions for your extension. XLIFF translation IDs are used to map text strings to their translations, and any changes to these IDs can result in missing or incorrect translations in dependent extensions. This diagnostic is raised if you're trying to move objects to one app to a propagated dependency, for example, when moving a table. Or when renaming something.

## How to fix this diagnostic?

Revert the rename of the object, field, or action, or revert the move to another app.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  