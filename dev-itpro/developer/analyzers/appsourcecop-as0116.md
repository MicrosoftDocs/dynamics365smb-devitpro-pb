---
title: "AppSourceCop Warning AS0116"
description: "The source application for this moved symbol cannot be found."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
ms.custom:
 - ai-gen-docs-bap
 - ai-seo-date: 01/02/2025
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0116
Source application for the moved symbol cannot be found.

## Description
The source application for this moved symbol cannot be found.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The source application for a moved symbol can't be found. This is important because when a symbol is moved from one application to another, it is crucial to maintain a reference to the source application to ensure that dependent extensions can locate and use the symbol correctly. If the source application can't be found, it might be considered an unwanted take over of a symbol that is not being released for moving.

## How to fix this diagnostic?

Ensure that the source application for the moved symbol is correctly referenced and available. Here are the steps to fix this diagnostic:

1. Identify the symbol that has been moved and is causing the AS0116 warning.
2. Verify that the source application containing the original symbol is correctly referenced in your extension.
3. Ensure that the source application is available and accessible.
4. Update the `MovedFrom` property in the destination application to correctly reference the source application.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  