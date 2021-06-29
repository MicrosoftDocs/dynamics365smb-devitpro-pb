---
title: "Method Attributes"
description: "The attributes that you can apply to methods in AL for Business Central"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Method Attributes

An attribute is modifier on a method declaration that specifies information that controls the method's use and behavior. Adding an attribute on a method declaration is also known as *decorating* a method. For example, decorating a method with the `Integration` attribute sets the method to be an event publisher. An attribute can have one or more arguments that set properties for the method instance.

In AL, attributes are placed before the method, and have the following syntax:

```AL
[Attribute_Name(ArgumentName : data_type, ArgumentName : data_type)]
```

For example, the Integration attribute has two arguments, and the syntax is:

```AL
[Integration(IncludeSender : Boolean, GlobalVarAccess : Boolean)]
```

## See Also

[AL Method Reference](../methods-auto/library.md)  
