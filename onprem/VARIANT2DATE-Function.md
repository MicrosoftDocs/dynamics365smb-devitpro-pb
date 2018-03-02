---
title: "VARIANT2DATE Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c55ac544-71e3-4d6c-913a-0bce2bd25c22
caps.latest.revision: 9
manager: edupont
---
# VARIANT2DATE Function
Gets a date from a variant.  
  
## Syntax  
  
```  
  
Date := VARIANT2DATE(Variant)  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
 The input variant.  
  
## Property Value/Return Value  
 Type: Date  
  
 The resulting date.  
  
## Example  
 This example requires that you create the following variables.  
  
|Name|DataType|  
|----------|--------------|  
|TestDate|Date|  
|variant1|Variant|  
  
```  
variant1 := TODAY;  
TestDate := VARIANT2DATE(variant1);  
```  
  
## See Also  
 [Variant Data Type](Variant-Data-Type.md)   
 [Date and Time Functions](Date-and-Time-Functions.md)   
 [Using COM Technologies in Microsoft Dynamics NAV](Using-COM-Technologies-in-Microsoft-Dynamics-NAV.md)