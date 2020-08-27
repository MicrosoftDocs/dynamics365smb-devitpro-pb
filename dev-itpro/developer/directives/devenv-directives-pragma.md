---
title: "Pragma Directive in AL"
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

# Pragma Directive in AL

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

## Pragma

|Pragma preprocessor directive| Description|
|-----------------------------|------------|
|#pragma                | Gives the compiler special instructions for the compilation of the file in which it appears. The `#pragma` directive has a number of actions; such as `disable`, `restore`, and `enable`.|


## Examples

## Warning suppression

```
table 50110 MyTable
{
    fields
    {
        #pragma warning disable AL0468
        field(1; TableWithLongIdentifierThatExceedsOurMax; Integer) { }
        #pragma warning restore
    }
}
```

## See Also

[Development in AL](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)