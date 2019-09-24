---
title: "Protected Variables"
ms.custom: na
ms.date: 08/27/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Protected Variables

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

Use the `protected` keyword on the declaration of a var section to make the declared variable within that section accessible from other objects within the same module. If you want to only expose some variables as `protected`, you must created two sections of var declarations. See in the syntax below.

## Syntax
```
protected var
        myInt: Integer;

var
        myLocalInt: Integer;
```

## Example

## See Also  
[AL Method Reference](methods/devenv-al-method-reference.md)   
[Properties](properties/devenv-properties.md)  
[Access Property](properties/devenv-access-property.md)  
[Extensible Property](properties/devenv-extensible-property.md)
