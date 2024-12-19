---
title: "AppSourceCop Info AS0125"
description: "Changes affecting the XLIFF translation ID of an object or object member that has been published are not allowed, because this will break the translations provided by dependent extensions for your extension."
ms.author: solsen
ms.date: 08/26/2024
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

Altering the XLIFF translation ID can break the translations provided by dependent extensions for your extension. XLIFF translation IDs are used to map text strings to their translations, and any changes to these IDs can result in missing or incorrect translations in dependent extensions.

## How to fix this diagnostic?

To address the AS0125 info message, avoid making changes to the XLIFF translation IDs of published objects or object members. If you need to update translations, consider adding new translation entries rather than modifying existing ones. Here are the steps to fix this diagnostic:

1. Identify the object or object member with the XLIFF translation ID that you intend to change.
2. Evaluate whether the change is necessary or if you can achieve your goal without modifying the existing translation ID.
3. If the change is necessary, add a new translation entry with a unique XLIFF translation ID instead of modifying the existing one.
4. Ensure that the original translation ID remains unchanged to avoid breaking translations in dependent extensions.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  