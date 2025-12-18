---
title: "AppSourceCop Warning AS0127"
description: "Objects should be placed in a namespace with at least two levels of nesting."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0127
Objects should be placed in a namespace with at least two levels.

## Description
Objects should be placed in a namespace with at least two levels of nesting. This minimizes conflicts with other applications and allows the object name to not use an affix.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The AS0127 warning indicates that objects should be placed in a namespace with at least two levels of nesting. This practice helps minimize conflicts with other applications and allows the object name to avoid using an affix. By organizing objects into namespaces with multiple levels, you can ensure better structure and avoid naming collisions, which is especially important when publishing extensions to AppSource.

## How to fix this diagnostic?

To address the AS0127 warning, organize your objects into namespaces with at least two levels of nesting. This involves creating a hierarchical structure for your namespaces, which can help in managing and categorizing your objects more effectively. Here are the steps to fix this diagnostic:

If the object *doesn't* have a namespace, you should do the following:

1. Identify the objects that aren't placed in a namespace with at least two levels of nesting.
2. Create a hierarchical namespace structure that includes at least two levels.
3. Move the identified objects into the appropriate namespaces within the new structure.
4. Update any references to the moved objects to reflect their new namespaces.

If the object *already* has a namespace, you should do the following:

1. Identify the objects that aren't placed in a namespace with at least two levels of nesting.
1. Obsolete the objects that aren't placed in a namespace with at least two levels of nesting.
1. In the next version of the extension, update the namespace to use at least two levels of nesting and remove the obsolete properties.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  