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

A .al file declares a namespace at the beginning of the file, and all objects in the code file belong to that namespace. A given object can only belong to one namespace, but the same namespace can be used for multiple .al files, which means for multiple objects.

When objects are resolved, they're resolved using the closest scope first. Therefore, to resolve to a similar named object in a dependent extension, the reference must use a fully qualified name. Alternatively, it's possible to define `using` directives to refer external namespaces and avoid fully qualified names for references to objects in those. <!-- check -->

> [!IMPORTANT]  
> Renaming existing names is a breaking change, therefore namespaces can only help with logical structure for existing objects.

## Namespace syntax

To declare a namespace in AL, you must use the `namespace` keyword followed by the name of the namespace. The namespace name must be unique within the extension. The namespace name can be any valid AL identifier, and it can contain dots to indicate a hierarchy of namespaces. The following example shows a namespace declaration. All of the objects declared in the code file belong to the namespace `MyNamespace`.

```al
namespace MyNamespace;

// codeunits, tables, pages.... 

```

Now, to refer to the objects in the `MyNamespace`, you must either use the fully qualified name, or the `using` directive. For more information, see [Using directive](devenv-namespaces-overview.md#using-directive).

To declare more objects in the same namespace, you can use the same namespace declaration in other .al files. All code files that use the same namespace declaration belong to the same namespace.

> [!NOTE]  
> It's a best practice to separate objects into different files, and to use the same name for the file as the object. For more information, see [Best Practices for AL code](../compliance/apptest-bestpracticesforalcode.md).

## Using directive

To refer to objects in other namespaces, you can either use the fully qualified name, or the `using` directive. The `using` directive is used to refer to objects in other namespaces without having to use the fully qualified name. The `using` directive is placed at the top of the .al file, *before* any namespace declaration. The following example shows a `using` directive.

```al
using MyNamespace

namespace MyOtherNamespace;

```

## Nested namespaces

A nested namespace is a namespace that's declared within another namespace. Nested namespaces allow for better and more structured naming of objects compared to having to express the full structure in the 30 character object name. The following example shows a nested namespace declaration of `MyNestedNamespace` within the `MyNamespace` namespace.

```al
namespace MyNamespace.MyNestedNamespace;

```

In the example, the fully qualified name of the namespace is `MyNamespace.MyNestedNamespace`. To refer to objects in the `MyNestedNamespace` namespace, you must then use the fully qualified name, or the `using` directive, which is

```al
using MyNamespace.MyNestedNamespace
```

> [!TIP]  
> Use code actions to help add namespaces to existing source. For more information, see [Code actions](devenv-code-actions.md).

## See also

[Development in AL](devenv-dev-overview.md)  