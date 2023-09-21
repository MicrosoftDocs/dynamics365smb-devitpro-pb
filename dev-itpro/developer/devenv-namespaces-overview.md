---
title: Namespaces in AL
description: Namespaces in AL provide a way to organize your code into logical units and avoid naming conflicts.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: overview
ms.collection: 
ms.date: 08/28/2023
ms.custom: bap-template
---

# Namespaces in AL

[!INCLUDE [2023_releasewave2](../includes/2023_releasewave2.md)]

Namespaces are used to organize code into logical groups and hierarchies, which can prevent naming conflicts that can occur when libraries are combined. Namespaces ensure uniqueness in code names and allow reuse of names in different contexts, and provide structure for the code base, making it easier to navigate and understand. Namespaces are used in many programming languages and with [!INCLUDE [prod_short](includes/prod_short.md)] they're available with AL.

An AL file declares a namespace at the beginning of the file, and all objects in the code file belong to that namespace. A given object can only belong to one namespace, but the same namespace can be used for multiple AL files, which means for multiple objects. 

> [!IMPORTANT]  
> Renaming existing object or member names is a breaking change, therefore namespaces can only help with logical structure for existing objects.  
> 
> Any app, which is dependent on your app will be broken if you rename namespaces, and likewise your app will break if any of the dependencies rename their namespaces.

## Namespace syntax

To declare a namespace in AL, you must use the `namespace` keyword followed by the name of the namespace. Some best practices for namespace keywords are:

- A namespace should be globally unique. 
- The first part of a namespace is tied to the developing organization or an individual, followed by a product name, and logical grouping within the product, such as for example, `namespace BigCompany.SmartProduct.SomeProductArea`. This supports the two purposes of namespaces - object name unique and logical grouping of related functionality.
- Use a stable and non-version specific name for the namespace. Changing the name of a namespace is a breaking change.
- The namespace name can be any valid AL identifier, and it can contain dots to indicate a hierarchy of namespaces. 
 
The following example shows the syntax of a namespace declaration. All of the objects declared in the code file belong to the namespace `MyNamespace`. The syntax shown below is for illustrational purposes, as it's still a best practice to separate objects into different files, and to use the same name for the file as the object. For more information, see [Best Practices for AL code](../compliance/apptest-bestpracticesforalcode.md).

```al
namespace MyNamespace;

// codeunits, tables, pages.... 

```

Now, to refer to the objects in the `MyNamespace`, you must either use the fully qualified name, or the `using` directive. For more information, see [Using directive](devenv-namespaces-overview.md#using-directive).

To declare more objects in the same namespace, you can use the same namespace declaration in other .al files. All code files that use the same namespace declaration belong to the same namespace. 

## The `using` directive

To refer to objects in other namespaces, you can either use the fully qualified name, or the `using` directive. The `using` directive is used to refer to objects in other namespaces without having to use the fully qualified name. The `using` directive is placed at the top of the .al file, *after* the namespace declaration and *before* any object declarations. The following example shows the order of the `namespace` declaration and the `using` directive. The order of the `using` directives doesn't matter.

```al

namespace MyNamespace;
using SomeOtherNamespace;

codeunit 10 MyCode
{
    ...
}

```

## Scope

When objects are resolved, they're resolved using the closest scope first. Therefore, to resolve to a similar named object in a dependent extension, the reference must use a fully qualified name. Alternatively, it's possible to define `using` directives to refer external namespaces and avoid fully qualified names for references to objects in those. 

## Nested namespaces

A nested namespace is a namespace that's declared within another namespace. Nested namespaces allow for better and more structured naming of objects compared to having to express the full structure in the 30 character object name. The following syntax shows a nested namespace declaration of `MyNestedNamespace` within the `MyNamespace` namespace, separated by a dot.

```al
namespace MyNamespace.MyNestedNamespace;

```

In the example, the fully qualified name of the namespace is `MyNamespace.MyNestedNamespace`. To refer to objects in the `MyNestedNamespace` namespace, you must then use the fully qualified name, or the `using` directive. So, to be able to access objects that are declared in the MyNestedNamespace, include the following statement in your code

```al
using MyNamespace.MyNestedNamespace
```

> [!TIP]  
> Use code actions to help add namespaces to existing source. For more information, see [Code actions](devenv-code-actions.md).

## See also

[Development in AL](devenv-dev-overview.md)  
[Code actions](devenv-code-actions.md)  
[AL Explorer](devenv-al-explorer.md)
