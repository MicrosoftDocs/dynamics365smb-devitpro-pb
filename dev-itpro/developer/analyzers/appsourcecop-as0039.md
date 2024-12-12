---
title: "AppSourceCop Error AS0039"
description: "Destructive table properties that have been published must not be removed."
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
# AppSourceCop Error AS0039
Removing properties that cause destructive changes is not allowed

## Description
Destructive table properties that have been published must not be removed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when an attempt is made to remove table properties that have already been published and are considered destructive. Destructive changes can lead to data loss, corruption, or other issues that can break the upgrade process for existing installations and dependent extensions.

## How to fix this diagnostic?

To resolve this error, you need to avoid removing published table properties that are considered destructive. Here are the steps:

1. Locate the table property in your code that is being removed.
2. Restore the property to its original state.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  