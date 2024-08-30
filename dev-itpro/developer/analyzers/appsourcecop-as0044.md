---
title: "AppSourceCop Error AS0044"
description: "Destructive field properties that have been published must not be modified."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0044
Property changes that cause destructive changes are not allowed

## Description
Destructive field properties that have been published must not be modified.

## Remarks

This error occurs when an attempt is made to modify field properties that have already been published and are considered destructive. Destructive changes can lead to data loss, corruption, or other issues that can break the upgrade process for existing installations and dependent extensions.

## How to fix this diagnostic?

To resolve this error, you need to avoid modifying published field properties that are considered destructive. Here are the steps:

1. Locate the field property in your code that is being removed.
2. Restore the property to its original state.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  