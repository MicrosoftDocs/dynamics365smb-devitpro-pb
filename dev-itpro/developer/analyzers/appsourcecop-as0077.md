---
title: "AppSourceCop Error AS0077"
description: "Adding a var modifier in events is not allowed as it might break the runtime behavior of extensions subscribing to it."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0077
Adding a var modifier in events is not allowed

## Description
Adding a var modifier in events is not allowed as it might break the runtime behavior of extensions subscribing to it.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error ensures that the behavior of events remains consistent and predictable. Adding a `var` modifier to an event parameter can alter how the parameter is handled, potentially causing issues for extensions that subscribe to the event. These extensions might not be designed to handle parameters passed by reference, leading to compatibility issues and runtime errors.

## How to fix this diagnostic?

To resolve this error, follow these steps:

1. Locate the event in your code where the `var` modifier has been added to a parameter.
2. Modify the event definition to remove the `var` modifier from the parameter.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  