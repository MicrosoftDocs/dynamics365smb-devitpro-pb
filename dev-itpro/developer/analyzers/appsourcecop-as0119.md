---
title: "AppSourceCop Error AS0119"
description: "The source symbol's MovedTo property value does not match the destination AppId."
ms.author: solsen
ms.date: 02/18/2025
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
# AppSourceCop Error AS0119
The value of the MovedTo property in the source symbol does not match the destination AppId.

## Description
The source symbol's MovedTo property value does not match the destination AppId.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The value of the `MovedTo` property in the source symbol doesn't match the destination AppId. This is important because the `MovedTo` property is used to track the destination of a symbol when it is moved from one application to another. Ensuring that the `MovedTo` property correctly matches the destination AppId is crucial for maintaining accurate references and dependencies between applications.

## How to fix this diagnostic?

Verify and correct the `MovedTo` property value in the source symbol to match the destination AppId. Here are the steps to fix this diagnostic:

1. Identify the source symbol that's causing the AS0119 warning.
2. Check the `MovedTo` property value in the source symbol.
3. Verify the destination AppId to which the symbol was moved.
4. Update the `MovedTo` property value in the source symbol to match the destination AppId.
5. Ensure that all references and dependencies are correctly updated.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  