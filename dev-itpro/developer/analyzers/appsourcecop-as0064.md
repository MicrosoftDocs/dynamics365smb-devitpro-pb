---
title: "AppSourceCop Error AS0064"
description: "An interface implementation that has been published must not be deleted, because dependent extensions may break."
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
# AppSourceCop Error AS0064
Interface implementations that have been published must not be deleted.

## Description
An interface implementation that has been published must not be deleted, because dependent extensions may break.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when an attempt is made to delete an interface implementation that has already been published. Deleting a published interface implementation can break dependent extensions that rely on it, leading to runtime errors and loss of functionality.

## How to fix this diagnostic?

To resolve this error, you need to ensure that published interface implementations aren't deleted. Here are the steps:

1. Locate the interface implementation in your code that is being deleted.
2. Restore the interface implementation to its original state.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  