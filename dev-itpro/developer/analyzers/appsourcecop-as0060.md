---
title: "AppSourceCop Error AS0060"
description: "The method cannot be invoked in an AppSource application because it can lead to runtime errors or undefined behavior."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0060
Unsafe methods cannot be invoked in an AppSource application

## Description
The method cannot be invoked in an AppSource application because it can lead to runtime errors or undefined behavior.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when an unsafe method is invoked in an AppSource application. Unsafe methods are those that can lead to runtime errors or undefined behavior, making them unsuitable for use in applications published on AppSource.

## How to fix this diagnostic?

To resolve this error, you need to avoid invoking unsafe methods in your AppSource application. Here are the steps:

1. Locate the code where an unsafe method is being invoked.
2. Find a safe alternative to the unsafe method and replace it in your code.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  