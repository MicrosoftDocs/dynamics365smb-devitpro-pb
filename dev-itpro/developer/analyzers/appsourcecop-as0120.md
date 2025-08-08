---
title: "AppSourceCop Error AS0120"
description: "The destination symbol's MovedFrom property value does not match the source AppId."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0120
The value of the MovedFrom property in the destination object does not match the source AppId.

## Description
The destination symbol's MovedFrom property value does not match the source AppId.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The value of the `MovedFrom` property in the destination object doesn't match the source AppId. This is important because the `MovedFrom` property is used to track the origin of a symbol when it's moved from one application to another. Ensuring that the `MovedFrom` property correctly matches the source AppId is crucial for maintaining accurate references and dependencies between applications.

## How to fix this diagnostic?

Verify and correct the `MovedFrom` property value in the destination object to match the source AppId. Here are the steps to fix this diagnostic:

1. Identify the destination object that's causing the AS0120 warning.
2. Check the `MovedFrom` property value in the destination object.
3. Verify the source AppId from which the symbol was moved.
4. Update the `MovedFrom` property value in the destination object to match the source AppId.
5. Ensure that all references and dependencies are correctly updated.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  