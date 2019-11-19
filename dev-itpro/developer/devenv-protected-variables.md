---
title: "Protected Variables"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Protected Variables

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

Use the `protected` keyword on the declaration of a `var` section to make the declared variable within that section accessible from other objects across modules. The `protected` keyword can be used to make variables accessible between tables and table extensions and between pages and page extensions. If you want to only expose some variables as `protected`, you must create two sections of `var` declarations. See the syntax below.

## Syntax
```
protected var
        myInt: Integer;

var
        myLocalInt: Integer;
```

## See Also  
[AL Method Reference](methods/devenv-al-method-reference.md)   
[Properties](properties/devenv-properties.md)  
[Access Property](properties/devenv-access-property.md)  
[Extensible Property](properties/devenv-extensible-property.md)
