---
title: Type testing and casting operators for interfaces
description: Interfaces in AL are syntactical contracts that can be implemented by a nonabstract method.
author: SusanneWindfeldPedersen
ms.date: 06/28/2024
ms.topic: conceptual
ms.author: solsen
ms.collection:
ms.reviewer: solsen
---

# Type testing and casting operators for interfaces

[!INCLUDE [2024-releasewave2](../includes/2024-releasewave2.md)]

In the AL language, you can define interfaces and extend them. With [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 2, two operators, `is` and `as`, are added to facilitate type testing and casting interfaces.

## The `is` operator

The `is` operator allows you to test whether an instance of an interface or the content of a variant supports a specific interface. Here’s the syntax for using the `is` keyword:


```al
procedure TestInterface(intf: Interface IFoo)
begin
    if intf is IBar then
        Message('I also support IBar');
end;
```

You can also use the `is` operator with variants:

```al
procedure TestVariant(v: Variant)
begin
    if v is IBar then
        Message('I support IBar');
end;
```

## The `as` operator

The `as` operator is used for casting an instance of an interface to a specific interface. If the source interface does not implement the target interface, it will throw an error at runtime. Here’s an example:

```al
procedure CastInterface(intf: Interface IFoo): Interface IBar
begin
    exit(intf as IBar); // Throws an error if 'intf' doesn't implement 'IBar'
end;
```

Similarly, the `as` keyword works with variants:

```al
procedure CastInterface(v: Variant): Interface IBar
begin
    exit(v as IBar); // Throws an error if 'v' doesn't implement 'IBar'
end;
```
## See also

[Interfaces in AL](devenv-interfaces-in-al.md)  
<!--[Extending interfaces in AL](devenv-interfaces-in-al-extend.md) -->