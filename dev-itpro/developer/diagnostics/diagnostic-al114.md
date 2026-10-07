---
title: "Compiler Error AL0114"
description: "Syntax error, integer literal expected."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0114

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Syntax error, integer literal expected. Provide a numeric value (e.g., 0, 1, 42).


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

This error means the compiler expected a whole number, but found a different kind of value. It usually happens when a numeric property or argument gets a quoted or non-numeric value.

To fix it, provide an unquoted integer literal where a number is required. For example, use `1000` instead of `'1000'`, and make sure the value isn't a text string, decimal, or expression when an integer is expected.

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  