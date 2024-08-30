---
title: "AppSourceCop Error AS0066"
description: "A new method to an interface that has been published must not be added, because dependent extensions may break"
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
# AppSourceCop Error AS0066
A new method to an interface that has been published must not be added.

## Description
A new method to an interface that has been published must not be added, because dependent extensions may break

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when an attempt is made to add a new method to an interface that has already been published. Adding a new method to a published interface can break dependent extensions that rely on it, leading to runtime errors and loss of functionality.

## How to fix this diagnostic?

To resolve this error, you need to ensure that new methods aren't added to a published interface. Here are the steps:

1. Locate the method on the interface in your code that is being added.
2. Restore the interface to its original state.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  