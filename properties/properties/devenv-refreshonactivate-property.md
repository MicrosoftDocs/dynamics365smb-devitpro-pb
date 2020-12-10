---
title: "RefreshOnActivate Property"
description: "Describes the RefreshOnActivate property"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 036a07c2-26b0-483b-96ae-4052fdfba6ad
caps.latest.revision: 2
---

# RefreshOnActivate Property
Set this property on pages where you want to refresh the data when the user navigates back from another page.   
  
## Applies to  
  
- Pages 

## Syntax

```AL
RefreshOnActivate = true;
```
 
## Remarks

On RoleCenters, modifying data in one part will automatically refresh data in any other parts which have the RefreshOnActivate property set to **true**.

## See Also  

[Properties](devenv-properties.md)  
[Page Properties](devenv-page-properties.md)