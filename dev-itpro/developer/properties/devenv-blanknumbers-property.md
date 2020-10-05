---
title: "BlankNumbers Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: cd877cdb-059d-4f88-a071-cbb1b99b4eb0
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

# BlankNumbers Property
Indicates whether the system will clear a range of numbers as it formats them.  
  
## Applies to  
  
- Page Fields  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**DontBlank (default)**|Not clear any numbers|  
|**BlankNeg**|Clear negative numbers|  
|**BlankNegAndZero**|Clear negative numbers and zero|  
|**BlankZero**|Clear numbers equal to zero|  
|**BlankZeroAndPos**|Clear positive numbers and zero|  
|**BlankPos**|Clear positive numbers|  

## Syntax  
```
BlankNumbers = BlankNegAndZero;
```
## See Also  
 [BlankZero Property](devenv-blankzero-property.md)