---
title: "SignDisplacement Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 932a7c72-f9b4-42c0-914c-2ecea112e73f
caps.latest.revision: 5
---

 

# SignDisplacement Property
Sets a value to shift negative values to the right for display purposes only. You can shift negative values in increments of 1/100 of a millimeter.  
  
## Applies to  
 Text boxes 

## Syntax
```
SignDisplacement = 600; 
```
  
## Remarks  
 For example, if you enter 600 (6 millimeters) you would see a result similar to:  
  
 (+)999888777  
  
 (+)123456789  
  
 (-) 123456789  
  
 (-) 999888777  
  
 (+)987654321  
  
## See Also  
 [Properties](devenv-properties.md)