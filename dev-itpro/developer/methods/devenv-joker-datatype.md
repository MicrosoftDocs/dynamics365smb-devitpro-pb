---
title: "Joker Data Type"
description: "Joker is an internal type, a wildcard, not exposed to AL developers."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 01/21/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Joker Data Type
 
`Joker` is an *internal* data type that is not exposed to AL developers. Joker can replace any other type and represents a wildcard. In certain cases, `Joker` plays the role of a generic T which is inferred from the type of the left-hand side of the invocation expression, in other cases, it is inferred from another parameter.

The following illustrates examples of how `Joker` is used in AL.

```al
procedure SetRange(Field: Joker, [FromValue: Joker], [ToValue: Joker])
```

```al
procedure SetFilter(Field: Joker, String: Text, [Value: Joker, ...])
```

```al
procedure SetAscending(Field: Joker, Ascending: Boolean)
```

## See Also

[AL Method Reference](../methods-auto/library.md)  
[AL Development Environment](../devenv-reference-overview.md)  
