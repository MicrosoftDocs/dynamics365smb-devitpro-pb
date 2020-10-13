---
title: EntitySetName Property
description: Sets the plural entity name with which the page is exposed in the api endpoint.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# EntitySetName Property

Sets the plural entity name with which the page is exposed in the api endpoint. The following example illustrates the syntax:
    
## Applies to  
  
- Pages    
- Queries  
 
## Syntax

```AL
EntitySetName = 'Customers';
```

> [!NOTE]
> The value `EntityDefinitions` is reserved and using it for the **EntitySetName Property** it will result in a compiler error.

## See Also

[EntityName Property](devenv-entityname-property.md)  
[Properties](devenv-properties.md)  