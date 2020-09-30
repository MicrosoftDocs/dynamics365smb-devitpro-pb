---
title: "MaxOccurs Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 10ccbe1e-73e2-472d-9f9b-5202d966a357
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

 

# MaxOccurs Property
Sets a value that indicates the maximum number of times an element can occur.  
  
## Applies to  
 XMLports  
  
## Property Value  
  
|**SourceType**|**Default**|  
|--------------|-----------|  
|**Table**|Unbounded|  
|**Text**|Unbounded|  
|**Field**|Once|  

## Syntax
```
MaxOccurs = Once;
```
 
## Remarks  
 The default value of the **MaxOccurs** property varies depending on the type of this element.  
  
 The minimum number of times an element can appear is determined by the value of the [MinOccurs Property](devenv-minoccurs-property.md).  
  
 The **MinOccurs** and **MaxOccurs** properties conform to the standard occurrence constraints that are used when defining XML schemas.  
  
 The minimum number can be either 1 or 0.  
  
 The maximum number can be either 1 or infinite.  
  
## See Also  
 [Properties](devenv-properties.md)