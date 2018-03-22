---
title: "DT2TIME Method (DateTime)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 174d53c4-7f71-4e3b-800e-d8d729552123
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# DT2TIME Method (DateTime)
Gets the time part of a DateTime object.  
  
## Syntax  
  
```  
  
Time := DT2TIME(Datetime)  
```  
  
#### Parameters  
 *Datetime*  
 Type: DateTime  
  
 The DateTime of which to return the time part.  
  
## Property Value/Return Value  
 Type: Time  
  
 The time part of the DateTime object.  
  
## Remarks  
 If *Datetime* is undefined, then this method returns an undefined time.  
  
## See Also  
 [DateTime Methods](devenv-DateTime-Methods.md)