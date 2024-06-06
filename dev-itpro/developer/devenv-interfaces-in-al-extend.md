---
title: Extending interfaces in AL
description: Interfaces in AL are syntactical contracts that can be implemented by a nonabstract method and extended.
author: SusanneWindfeldPedersen
ms.date: 06/06/2024
ms.topic: conceptual
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# Extending interfaces in AL

<!-- [!INCLUDE[2020_releasewave1](../includes/2020_releasewave1.md)] -->

When you declare an interface, you can extend one or more existing interfaces. When you implement an interface that extends other interfaces, the implementor must also implement all methods from all extended interfaces.

In the example, the `TheImplementor` can be used as both `IFoo`, `IBar`, and `IFooBar`. The feature also works with the testing and casting operators. 

The syntax for extending an interface is as follows:

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