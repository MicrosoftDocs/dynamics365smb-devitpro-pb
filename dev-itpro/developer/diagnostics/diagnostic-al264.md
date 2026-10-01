---
title: "Compiler Error AL0264"
description: "An application object of type '{0}' with ID '{1}' is already declared by the extension '{2}'."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0264

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

An application object of type '{0}' with ID '{1}' is already declared by the extension '{2}'.


## Description
Multiple application objects of the same type and with the same ID are defined.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

This error means another object of the same type already uses this ID, either in your extension or in a dependency. Object IDs must be unique per object type across all dependencies.

To fix it:

- Assign an unused ID that falls within the `idRanges` defined in your `app.json`.
- If you copied an object, renumber it so it doesn't reuse the original ID.
- Check your dependencies for an object that already uses the ID.

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  