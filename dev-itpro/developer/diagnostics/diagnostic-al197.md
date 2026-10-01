---
title: "Compiler Error AL0197"
description: "An application object of type '{0}' with name '{1}' is already declared by the extension '{2}'."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0197

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

An application object of type '{0}' with name '{1}' is already declared by the extension '{2}'.


## Description
Multiple application objects with the same name are defined.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

This error means another object of the same type and name is already declared, either in your extension or in one of the extensions you depend on. Object names must be unique per object type across all dependencies.

To fix it:

- Give your object a unique name.
- Remove the duplicate declaration if you declared the same object twice.
- Check the extensions listed in the `dependencies` section of your `app.json` for a name collision, and rename your object to avoid it.

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  