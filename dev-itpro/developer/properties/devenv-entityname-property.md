---
title: EntityName Property
description: Sets the singular entity name with which the page is exposed in the api endpoint.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# EntityName Property

Sets the singular entity name with which the page is exposed in the api endpoint. The following example illustrates the syntax:

## Applies to  
  
- Pages  
- Queries  

## Syntax

```AL
EntityName = 'Customer';
```

> [!NOTE]
> The value `EntityMetadata` is reserved and using for the **EntityName Property** it will result in a compiler error.
  
## See Also

[EntitySetName Property](devenv-entitysetname-property.md)  
[Properties](devenv-properties.md)  