---
title: Type testing and casting operators for interfaces
description: With the `is` and `as` operators, you can do type testing and casting of interfaces in AL for Business Central.
author: SusanneWindfeldPedersen
ms.date: 09/13/2024
ms.topic: conceptual
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# Type testing and casting operators for interfaces

[!INCLUDE [2024-releasewave2](../includes/2024-releasewave2.md)]

In the AL language, you can define interfaces, which is a syntactical contract that can be implemented by a nonabstract method. With [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 2, you can also extend an interface, which allows for a more flexible and adaptable design. Learn more in [Extending interfaces in AL](devenv-interfaces-in-al-extend.md). In connection with the extensibility of interfaces, it's useful to be able to do type testing and casting of interfaces. For this purpose, 2 operators `is` and `as` are availble.

## Type testing with the `is` operator

Type testing with the `is` operator is useful when extending interfaces, because it allows you to test whether an instance of an interface or the content of a variant supports a specific interface. 

Here’s the syntax for using the `is` keyword:


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

## Casting with the `as` operator

The `as` operator is used for casting an instance of an interface to a specific interface. If the source interface doesn't implement the target interface, it throws an error at runtime. Here’s an example:

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
[Extending interfaces in AL](devenv-interfaces-in-al-extend.md)  