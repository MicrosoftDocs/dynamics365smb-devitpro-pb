---
title: "Compiler Error AL0224"
description: "Expression expected."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0224

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Expression expected. Provide a valid expression (variable, constant, calculation, or method call).


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

This error means the compiler expected an expression, such as a value, variable, or calculation, but the expression is missing or incomplete. It's often caused by a missing operand, empty parentheses, or a dangling operator.

To fix it, complete the expression. The following example causes the error because the condition is incomplete:

```al
if Amount = then
    exit;
```

Provide the missing value:

```al
if Amount = 0 then
    exit;
```

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  