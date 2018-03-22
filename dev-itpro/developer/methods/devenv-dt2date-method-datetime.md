---
title: "DT2DATE Method (DateTime)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: c8e6bf9e-4098-4b51-96c7-d16e12a0cddf
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# DT2DATE Method (DateTime)
Gets the date part of a DateTime object.  
  
## Syntax  
  
```  
  
Date := DT2DATE(Datetime)  
```  
  
#### Parameters  
 *Datetime*  
 Type: DateTime  
  
 The DateTime of which to return the date part.  
  
## Property Value/Return Value  
 Type: Date  
  
 The date part of the DateTime object.  
  
## Remarks  
 If *Datetime* is undefined, then this method returns an undefined date.  
  
## See Also  
 [DateTime Methods](devenv-DateTime-Methods.md)