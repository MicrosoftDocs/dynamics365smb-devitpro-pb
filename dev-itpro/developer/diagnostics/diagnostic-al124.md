---
title: "Compiler Error AL0124"
description: "The property '{0}' cannot be used in this context."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0124

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The property '{0}' cannot be used in this context. Verify the property is available for the current object type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

This error means a property is valid in AL, but not for the object, control, or type where you used it. It often happens when you copy a property from one object type to another, or use a property that isn't supported in the current context.

To fix it:

- Remove the property, or replace it with the equivalent property for the current object type.
- Check the reference documentation for the properties that are available for that object or control type.
- If you copied code from another object, make sure every property applies to the target object.

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  