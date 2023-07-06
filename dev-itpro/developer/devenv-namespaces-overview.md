---
title: Namespaces in AL
description: Namespaces in AL provide a way to organize your code into logical units and avoid naming conflicts.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: overview
ms.collection: 
ms.date: 06/20/2023
ms.custom: bap-template
---

# Namespaces in AL

[!INCLUDE [2023_releasewave2](../includes/2023_releasewave2.md)]

Namespaces are used to organize code into logical groups and hierarchies, which can prevent naming conflicts that can occur when libraries are combined. Namespaces ensure uniqueness in code names and allow reuse of names in different contexts, and provide structure for the code base, making it easier to navigate and understand.

A .al file defines a namespace at the beginning of the file, and all objects in the code file belong to that namespace. A given object can only belong to one namespace, but the same namespace can be used for multiple .al files, which means for multiple objects.

When objects are resolved, they're resolved using the closest scope first. Therefore, to resolve to a similar named object in a dependent extension, the reference must use a fully qualified name. Alternatively, it's possible to define `using` directives to refer external namespaces and avoid fully qualified names for references to objects in those.

<!--
As namespaces are useful for logical segmentation of extensions, the [AL Explorer](devenv-al-explorer.md) allows grouping objects by namespace, making it easier to find related objects. -->

Nested namespaces allow for better naming of objects than having to express the full structure in the 30 character object name. 

> [!IMPORTANT]  
> Renaming existing names is a breaking change, therefore namespaces can only help with logical structure for existing objects.

> [!TIP]  
> Use code actions to help add namespaces to existing source. For more information, see [Code actions](devenv-code-actions.md).

## See also

[Development in AL](devenv-dev-overview.md)  