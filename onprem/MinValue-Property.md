---
title: "MinValue Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 531a1e04-cd17-4128-a230-fbaa6ba33b65
caps.latest.revision: 9
manager: edupont
---
# MinValue Property
Sets the minimum value for a field.  
  
## Applies To  
  
-   Page Fields  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**0**|Integers|  
|**0.0**|Decimals|  
|**January 1, 0**|Dates|  
|**00:00:00**|Time|  
  
## Remarks  
 The field setting is checked during validation. Validation occurs only if the field or control value is updated through the UI, for example, if a value is updated on a page or if a field is updated in a table directly. If a field is updated through application code, then the **MinValue** property is not validated.  
  
## See Also  
 [MaxValue Property](MaxValue-Property.md)   
 [NotBlank Property](NotBlank-Property.md)   
 [Numeric Property](Numeric-Property.md)