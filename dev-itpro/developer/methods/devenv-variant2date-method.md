---
title: "VARIANT2DATE Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: c55ac544-71e3-4d6c-913a-0bce2bd25c22
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# VARIANT2DATE Method
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
 [Variant Data Type](../datatypes/devenv-Variant-Data-Type.md)   
 [Date and Time Methods](devenv-Date-and-Time-Methods.md)   
 <!--[Using COM Technologies in Microsoft Dynamics NAV](Using-COM-Technologies-in-Microsoft-Dynamics-NAV.md)-->
