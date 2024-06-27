---
title: Extending interfaces in AL
description: Interfaces in AL are syntactical contracts that can be implemented by a nonabstract method and extended for flexibility and adaptability.
author: SusanneWindfeldPedersen
ms.date: 06/27/2024
ms.topic: conceptual
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# Extending interfaces in AL

[!INCLUDE[2024-releasewave2](../includes/2024-releasewave2.md)]

An interface in AL is a syntactical contract that can be implemented by a nonabstract method. The interface is used to define which capabilities must be available for an object, while allowing actual implementations to differ, as long as they comply with the defined interface. 

With Business Central 2024 release wave 2, extensible interfaces in AL are supported. Extending interfaces enables you to create a flexible and adaptable extension. You can add new functionality without altering the core system, which can save time and resources and you reduce the risk of introducing errors into the existing codebase.

When you declare an interface, you can extend one or more existing interfaces. When you implement an interface that extends other interfaces, the implementor must also implement all methods from all extended interfaces.

The extensibile interfaces also work with the testing and casting operators `is` and `as`, which are new additions to the AL language with Business Central 2024 release wave 2. For more information, see []().

## Syntax

In the example, `TheImplementor` can be used as both `IFoo`, `IBar`, and `IFooBar`. The syntax for extending an interface is as follows:

```AL
interface IFoo
{
    procedure Foo();    
}

interface IBar()
{
    procedure Bar();
}

interface IFooBar extends IFoo, IBar
{
    procedure FooBar();
}

codeunit 10 TheImplementor extends IFooBar
{
    // Must implement IFoo, IBar, IFooBar 
}
```

## See also

[Interfaces in AL](devenv-interfaces-in-al.md)