---
title: "AppSourceCop Error AS0038"
description: "Modifying table key properties can lead to destructive changes that will break the upgrade of existing installations and dependent extensions."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
ms.custom:
 - ai-gen-docs-bap
 - ai-seo-date: 10/01/2024
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0038
Unsupported table key property change

## Description
Modifying table key properties can lead to destructive changes that will break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when a table key property is modified in a way that isn't supported. Modifying table key properties can lead to destructive changes, which can break the upgrade process for existing installations and dependent extensions.

## How to fix this diagnostic?

To resolve this error, you need to avoid making unsupported changes to table key properties. Here are the steps:

1. Locate the table key property in your code that is causing the error.
2. Change the property back to its original value or to a supported value.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  