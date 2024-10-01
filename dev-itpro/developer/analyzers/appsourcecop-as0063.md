---
title: "AppSourceCop Error AS0063"
description: "Removing a var modifier on a parameter in an event is not allowed as it will break dependent extensions subscribing to it."
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
# AppSourceCop Error AS0063
Removing a var modifier in events is not allowed

## Description
Removing a var modifier on a parameter in an event is not allowed as it will break dependent extensions subscribing to it.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when the `var` modifier is removed from a parameter in an event. The `var` modifier indicates that the parameter is passed by reference, allowing the event subscriber to modify the parameter's value. Removing the `var` modifier changes the parameter to be passed by value, which can break dependent extensions that rely on the original behavior.

## How to fix this diagnostic?

To resolve this error, you need to ensure that the `var` modifier isn't removed from parameters in events. Here are the steps:

1. Locate the event in your code where the `var` modifier has been removed from a parameter.
2. Restore the `var` modifier to the parameter.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  