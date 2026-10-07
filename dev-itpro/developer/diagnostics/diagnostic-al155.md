---
title: "Compiler Error AL0155"
description: "A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0155

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'.


## Description
Multiple members with the same name are defined by the same or several extensions.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

A member (a field, control, action, or method) with this name is already defined on the object, sometimes by another extension that also extends it.

To fix it:

1. If you didn't intend to define the member twice, remove the duplicate.
2. If you need a new member, give it a unique name.
3. When several extensions extend the same object, prefix your member names with a short identifier for your extension to avoid collisions with other publishers.

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  