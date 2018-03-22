---
title: "ISDATE Method (Variant)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 95420b45-4c60-489b-b71e-f56e63a84cb3
caps.latest.revision: 9
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ISDATE Method (Variant)
Indicates whether an AL variant contains a Date variable.  
  
## Syntax  
  
```  
  
Ok := Variant.ISDATE  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **True** if the AL variant contains a Date variable; otherwise, **false**.  
  
## Example  
 The following example determines whether an AL variant contains a Date variable. The code initializes the MyDate variable with a Date value. The MyDate variable is assigned to the variant variable that is named MyVariant. The **ISDATE** method determines whether the variant contains a Date variable and stores the return value in the varResult variable. In this case, the variant contains a Date variable so **true** is returned and displayed in a message box. The [ISCODE Method (Variant)](devenv-ISCODE-Method-Variant.md) determines whether the variant contains a Code variable. The return value is **false** because the variant does not contain a code. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyDate|Date|  
|MyVariant|Variant|  
|varResult|Boolean|  
  
|Text constant name|Enu value|  
|------------------------|---------------|  
|Text000|Does the variant >%1\< contain a date variable? %2.|  
|Text001|Does the variant >%1\< contain a code variable? %2.|  
  
```  
MyDate := TODAY;  
MyVariant :=  MyDate;  
varResult := MyVariant.ISDATE;  
MESSAGE(Text000,MyVariant,varResult);  
varResult := MyVariant.ISCODE;  
MESSAGE(Text001,MyVariant,varResult);  
```  
  
## See Also  
 [Variant Data Type](../datatypes/devenv-variant-data-type.md)