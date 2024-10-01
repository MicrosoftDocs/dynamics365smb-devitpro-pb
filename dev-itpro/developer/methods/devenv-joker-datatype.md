---
title: Joker Data Type
description: The Joker data type is an internal type, a wildcard, not exposed to AL developers.
author: SusanneWindfeldPedersen
ms.date: 04/26/2024
ms.topic: reference
ms.custom: evergreen
ms.author: solsen
ms.reviewer: solsen
---

# Joker data type
 
The `Joker` data type is an *internal* data type that isn't exposed to AL developers. `Joker` can replace any other type and represents a wildcard. In certain cases, `Joker` plays the role of a generic T which is inferred from the type of the left-hand side of the invocation expression, in other cases, it is inferred from another parameter.

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

## See also

[AL method reference](../methods-auto/library.md)  
[AL development environment](../devenv-reference-overview.md)  
