---
title: "AppSourceCop Error AS0027"
description: "Modifying the array size of a parameter in events and external procedures is not allowed."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0027
Modifying the array size of a parameter in events and external procedures is not allowed

## Description
Modifying the array size of a parameter in events and external procedures is not allowed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when the array size of a parameter in events or external procedures is modified. In AL, the array size of parameters in events and external procedures must remain constant to ensure compatibility and stability.

To resolve this error, you must ensure that the array size of parameters in events and external procedures isn't modified. Here are the steps:

1. Locate the event or external procedure in your code where the array size of a parameter is being modified.
2. Change the array size back to its original value.


## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  