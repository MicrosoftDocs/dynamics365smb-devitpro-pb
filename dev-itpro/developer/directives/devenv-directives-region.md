---
title: "Region Directive in AL"
description: 
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/19/2020
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Region Directive in AL


## Region

|Region preprocessor directive| Description|
|-----------------------------|------------|
|#region                | Specifies a block of code that you can expand or collapse. |
|#endregion             | Specifies the end of a #region block of code. |


## Examples

### Region support

```
#region Ugly code - let's skip this
    procedure UglyCode()
    begin
        // No one should look at this
    end;
#endregion
```

## See Also

[Development in AL](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)