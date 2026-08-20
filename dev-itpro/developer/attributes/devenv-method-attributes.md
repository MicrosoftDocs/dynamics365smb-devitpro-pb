---
title: Method Attributes in AL for Business Central
description: Learn how AL method attributes modify method behavior in Business Central and review the syntax for applying attributes and arguments.
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Method attributes

An attribute is a modifier on a method declaration that controls the method's use and behavior. Adding an attribute to a method declaration is also known as *decorating* the method. For example, the `IntegrationEvent` attribute makes a method an event publisher. An attribute can have one or more arguments.

In AL, attributes are placed before the method, and they have the following syntax:

```al
[AttributeName(ArgumentValue1, ArgumentValue2)]
```

For example, the following method uses the `IntegrationEvent` attribute with both required arguments set to `false`:

```AL
[IntegrationEvent(false, false)]
procedure OnSomethingChanged()
begin
end;
```

> [!TIP]  
> If you already know the name of, for example, a data type, method, property, or trigger, use the **Filter by title** field in the upper left corner, above the table of contents to find the topic faster. Otherwise, you can scan the table of contents to find it.

## Related information

[AL method reference](../methods-auto/library.md)  
[IntegrationEvent attribute](devenv-integrationevent-attribute.md)
