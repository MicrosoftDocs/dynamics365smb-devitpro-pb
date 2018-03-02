---
title: "VARIANT2TIME Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 2fa5fb1e-998c-4469-bd90-2ed0f64190fe
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# VARIANT2TIME Method
Gets a time from a variant.  

## Syntax  

```  

Time := VARIANT2TIME(Variant)  
```  

#### Parameters  
 *Variant*  
 Type: Variant  

 The input variant.  

## Property Value/Return Value  
 Type: Time  

 The resulting time.  

## Example  
 This example requires that you create the following variables.  

|Name|DataType|  
|----------|--------------|  
|TestTime|Time|  
|variant1|Variant|  

```  
variant1 := TIME;  
TestTime := VARIANT2TIME(variant1);  
```  

## See Also  
 [Variant Data Type](../datatypes/devenv-Variant-Data-Type.md)   
 [Date and Time Methods](devenv-Date-and-Time-Methods.md)   
<!--[Using COM Technologies in Microsoft Dynamics NAV](Using-COM-Technologies-in-Microsoft-Dynamics-NAV.md)-->
