---
title: Extend interfaces in AL 
description: Learn how to extend interfaces in AL to create flexible and adaptable extensions, including syntax and operator usage.
author: SusanneWindfeldPedersen
ms.date: 09/27/2024
ms.topic: conceptual
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# Extend interfaces in AL

[!INCLUDE[2024-releasewave2](../includes/2024-releasewave2.md)]

An interface in AL is a syntactical contract that can be implemented by a nonabstract method. It defines the capabilities an object must have while allowing actual implementations to differ, as long as they comply with the defined interface. For more information, refer to [Interfaces in AL](devenv-interfaces-in-al.md).

With [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 2, extensible interfaces in AL are supported. Extending interfaces lets you create flexible and adaptable extensions. You can add new functionality without altering the core system, which can save time and resources and reduce the risk of introducing errors into the existing codebase.

When you declare an interface, you can extend one or more existing interfaces. The new interface inherits all the methods from the interfaces it extends. When you implement an interface that extends other interfaces, the implementing class or object must provide implementations for all the methods defined in the extended interfaces as well as any methods defined in the new interface itself. This ensures that the implementor adheres to the contract specified by all the interfaces involved.

## Syntax

In the example, `TheImplementor` can be used as both `IFoo`, `IBar`, and `IFooBar`. The syntax for extending an interface is as follows:

```AL
interface IFoo
{
    procedure Foo();    
}

interface IBar
{
    procedure Bar();
}

interface IFooBar extends IFoo, IBar
{
    procedure FooBar();
}

codeunit 10 TheImplementor implements IFooBar
{
    // Must implement IFoo, IBar, IFooBar 
}
```

## Extensible interfaces and operators

Extensible interfaces in AL also support the use of the testing and casting operators `is` and `as`. The `is` operator allows you to check if an object implements a specific interface, while the `as` operator enables you to cast an object to a specific interface type. This functionality enhances the flexibility and robustness of your code because it allows dynamic type checking and casting. Learn more in [Type testing and casting operators for interfaces](devenv-interfaces-in-al-operators.md).

## Related information

- [Interfaces in AL](devenv-interfaces-in-al.md)  
- [Type testing and casting operators for interfaces](devenv-interfaces-in-al-operators.md)  
