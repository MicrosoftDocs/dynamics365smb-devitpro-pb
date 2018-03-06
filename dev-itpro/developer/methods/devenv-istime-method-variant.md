---
title: "ISTIME Method (Variant)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 596021b0-a751-4fb3-83ea-e33b42dbdf24
caps.latest.revision: 9
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ISTIME Method (Variant)
Indicates whether an AL variant contains a Time variable.  
  
## Syntax  
  
```  
  
Ok := Variant.ISTIME  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the AL variant contains a Time variable; otherwise, **false**.  
  
## Example  
 The following example determines whether an AL variant contains a time variable. The code initializes the MyTime variable with a Time value. The MyTime variable is assigned to the variant variable that is named MyVariant. The **ISTIME** method determines whether the variant contains a Time variable and stores the return value in the varResult variable. In this case, the variant contains a Time variable so **Yes** is returned and displayed in a message box. The [ISCODE Method (Variant)](devenv-ISCODE-Method-Variant.md) determines whether the variant contains a Code variable. The return value is **No** because the variant does not contain a code. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyTime|Time|  
|MyVariant|Variant|  
|varResult|Boolean|  
  
|Text constant name|Enu value|  
|------------------------|---------------|  
|Text000|Does the variant >%1\< contain a time variable? %2.|  
|Text001|Does the variant >%1\< contain a code variable? %2.|  
  
```  
MyTime := TIME;  
MyVariant := MyTime;  
varResult := MyVariant.ISTIME;  
MESSAGE(Text000,MyVariant,varResult);  
varResult := MyVariant.ISCODE;  
MESSAGE(Text001,MyVariant,varResult);  
```  
  
## See Also  
 [Variant Data Type](../datatypes/devenv-Variant-Data-Type.md)