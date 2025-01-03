---
title: "AppSourceCop Error AS0121"
description: "The name of the moved symbol in the source and the destination application is different."
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
# AppSourceCop Error AS0121
When a symbol is moved the name must remain the same.

## Description
The name of the moved symbol in the source and the destination application is different.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The name of a moved symbol in the source application is different from the name in the destination application. This is important to fix because maintaining consistent naming for symbols when they are moved ensures that dependent extensions and applications can continue to function correctly. Changing the name of a symbol during a move can lead to broken references and functionality issues in dependent extensions.

## How to fix this diagnostic?

Ensure that the name of the symbol remains the same when it's moved from the source application to the destination application. Here are the steps to fix this diagnostic:

1. Identify the symbol that has been moved and is causing the AS0121 error.
2. Verify that the name of the symbol in the source application matches the name in the destination application.
3. If the names are different, update the symbol in the destination application to match the name in the source application.
4. Ensure that all references to the symbol in both the source and destination applications are updated accordingly.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  