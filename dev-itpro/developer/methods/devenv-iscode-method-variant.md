---
title: "ISCODE Method (Variant)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f6980d9b-7464-4c7e-8ae0-4681d3859aeb
caps.latest.revision: 10
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ISCODE Method (Variant)
Indicates whether an AL variant contains a Code variable.  
  
## Syntax  
  
```  
  
Ok := Variant.ISCODE  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **True** if the AL variant contains a Code variable; otherwise, **false**.  
  
## Example  
 The following example determines whether an AL variant contains a code variable. The code initializes the MyCode variable with a string value. The MyCode variable is assigned to the variant variable that is named MyVariant. The **ISCODE** method determines whether the variant contains a code variable and stores the return value in the varResult variable. In this case, the variant contains a code variable so **true** is returned and displayed in a message box. The [ISTEXT Method (Variant)](devenv-ISTEXT-Method-Variant.md) determines whether the variant contains a text variable. The return value is **false** because the variant does not contain a text. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|MyCode|Code|100|  
|MyVariant|Variant|Not applicable|  
|varResult|Boolean|Not applicable|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|Does the variant >%1\< contain a code variable? %2.|  
|Text001|Does the variant >%1\< contain a text variable? %2.|  
  
```  
MyCode := 'A1297';  
MyVariant :=  MyCode;  
varResult := MyVariant.ISCODE;  
MESSAGE(Text000,MyVariant,varResult);  
varResult := MyVariant.ISTEXT;  
MESSAGE(Text001,MyVariant,varResult);  
```  
  
## See Also  
 [Variant Data Type](../datatypes/devenv-variant-data-type.md)