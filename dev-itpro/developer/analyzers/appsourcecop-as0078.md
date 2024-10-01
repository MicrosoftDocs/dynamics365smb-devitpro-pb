---
title: "AppSourceCop Error AS0078"
description: "Adding or removing a var modifier in public procedures is not allowed as it might break the runtime behavior of extensions calling it."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0078
Adding or removing a var modifier in external procedures is not allowed

## Description
Adding or removing a var modifier in public procedures is not allowed as it might break the runtime behavior of extensions calling it.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error ensures that the behavior of public procedures remains consistent and predictable. Adding or removing a `var` modifier can significantly change how parameters are handled within a procedure. Extensions that call these procedures may rely on the original parameter passing mechanism (by value or by reference). Altering this mechanism can cause compatibility issues, runtime errors, and unexpected behavior in these extensions. Maintaining the original parameter passing mechanism ensures that the procedure's behavior remains stable and that dependent extensions continue to function as expected.

## How to fix this diagnostic?

To resolve this error, follow these steps:

1. Locate the public procedure in your code where the `var` modifier has been added or removed from a parameter.
2. Modify the procedure definition to restore the original `var` modifier status of the parameter.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  