---
title: "AppSourceCop Error AS0028"
description: "Reducing the array size of a parameter in events and external procedures is not allowed."
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
# AppSourceCop Error AS0028
Reducing the array size of a parameter in events and external procedures is not allowed

## Description
Reducing the array size of a parameter in events and external procedures is not allowed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when the array size of a parameter in events or external procedures is reduced. In AL, the array size of parameters in events and external procedures must remain constant to ensure compatibility and stability.

## How to fix this diagnostic?

To resolve this error, you must ensure that the array size of parameters in events and external procedures isn't modified. Here are the steps:

1. Locate the event or external procedure in your code where the array size of a parameter is being modified.
2. Change the array size back to its original value.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  