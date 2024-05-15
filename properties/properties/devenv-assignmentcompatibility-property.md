---
title: "AssignmentCompatibility Property"
description:
ms.author: solsen
ms.date: 10/01/2020
ms.suite: na
ms.topic: article
author: SusanneWindfeldPedersen
---

# AssignmentCompatibility Property
Sets the enum to be assignable to an enum of any type. 

> [!IMPORTANT]  
> This property provides backwards compatibility in certain cases when converting from options to enums. It should not be used for enums that are not converted from options. 
> Because the assignment is done by ordinal value without validation, there is no guarantee that the target will have a corresponding value. Special attention should be made if either source or target is marked as `extensible`.


## Syntax

```AL
AssignmentCompatibility = true;
```

## See Also
[Extensible Enums](../devenv-extensible-enums.md)  
