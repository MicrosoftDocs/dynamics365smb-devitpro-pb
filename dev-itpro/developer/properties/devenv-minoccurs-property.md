---
title: "MinOccurs Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: e35b2d60-5c3e-499b-a4f9-f9b8481d69c8
caps.latest.revision: 13
author: SusanneWindfeldPedersen
---

 

# MinOccurs Property
Sets the minimum number of times that an element can occur.  
  
## Applies To  
 XMLports  
  
## Property Values  
 The possible values are **Once** and **Zero** (0). The default value is **Once**.  

## Syntax
```
MinOccurs = Zero;
```
 
## Remarks  
 The maximum number of times an element can appear is determined by the value of the [MaxOccurs Property](devenv-maxoccurs-property.md). The **MinOccurs** and **MaxOccurs** properties conform to the standard occurrence constraints that are used when defining XML schemas.  
  
 If you use Lazy API for XML (LAX), then the minimum number is 1. If you do not use LAX, then the minimum number is 0.  
  
 The maximum number can be either 1 or infinite.  
  
## See Also  
 [MaxOccurs Property](devenv-maxoccurs-Property.md)