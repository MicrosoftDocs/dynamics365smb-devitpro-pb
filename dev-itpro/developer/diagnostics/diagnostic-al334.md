---
title: "Compiler Error AL0334"
description: "The extension object '{0}' cannot be declared."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0334

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The extension object '{0}' cannot be declared. Another extension for target '{1}' or the target itself is already declared in this module.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

This error means you can't declare this extension object because another extension for the same target (or the target object itself) is already declared in this extension.

To fix it:

- Remove or merge duplicate `tableextension`, `pageextension`, or other extension objects that target the same object.
- If the target object is also declared in your extension, rename or remove one of the objects so the target and extension don't overlap.

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  