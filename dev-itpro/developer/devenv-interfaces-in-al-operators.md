---
title: Type testing and casting operators for interfaces in AL
description: Learn how to use the `is` and `as` operators for type testing and casting interfaces in AL for Business Central.
author: SusanneWindfeldPedersen
ms.date: 06/27/2025
ms.topic: how-to
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# Type testing and casting operators for interfaces in AL

[!INCLUDE [2024-releasewave2](../includes/2024-releasewave2.md)]

In the AL language, you can define an interface, which is a syntactical contract that can be implemented by a nonabstract method. With [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 2, you can also extend an interface, which allows for a more flexible and adaptable design. Learn more in [Extending interfaces in AL](devenv-interfaces-in-al-extend.md). In connection with the extensibility of interfaces, it's useful to be able to do type testing and casting of interfaces, because this allows you to work with interfaces in a more dynamic way, enabling you to check if an interface supports a specific method or property, and to cast it to a more specific type when needed. For this purpose, two operators `is` and `as` are available.

## Type testing with the `is` operator

Type testing with the `is` operator is useful when extending interfaces because it allows you to test whether an instance of an interface or the content of a variant supports a specific interface. 

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

## Best practices

When working with interface operators in AL, follow these best practices:

- Use defensive programming - always check with `is` before casting with `as` to avoid runtime errors.
- Keep interfaces focused - design smaller, more specialized interfaces to make casting more predictable.
- Document interface relationships - when extending interfaces, clearly document the hierarchy to help other developers understand type relationships.
- Prefer explicit over implicit - when possible, design your code to use concrete types rather than relying heavily on runtime casting.
- Use consistent naming - follow a naming convention for interfaces to make code more readable, for example, prefixing the name with `I`.

## Related information

[Interfaces in AL](devenv-interfaces-in-al.md)  
[Extending interfaces in AL](devenv-interfaces-in-al-extend.md)  