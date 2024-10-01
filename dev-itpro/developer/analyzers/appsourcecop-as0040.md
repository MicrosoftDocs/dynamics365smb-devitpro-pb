---
title: "AppSourceCop Warning AS0040"
description: "Destructive page properties that have been published must not be removed."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0040
Removing properties that cause destructive changes is not allowed

## Description
Destructive page properties that have been published must not be removed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when an attempt is made to remove page properties that have already been published and are considered destructive. Destructive changes can lead to data loss, corruption, or other issues that can break the upgrade process for existing installations and dependent extensions.

## How to fix this diagnostic?

To resolve this error, you need to avoid removing published page properties that are considered destructive. Here are the steps:

1. Locate the page property in your code that is being removed.
2. Restore the property to its original state.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  