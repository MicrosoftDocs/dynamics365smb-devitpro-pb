---
title: "ISAUTOMATION Method (Variant)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 1b08e80f-22fd-499b-afea-02f9006c0f04
caps.latest.revision: 11
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ISAUTOMATION Method (Variant)
Indicates whether an AL variant contains an Automation variable.  
  
## Syntax  
  
```  
  
Ok := Variant.ISAUTOMATION  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **True** if the AL variant contains an Automation variable; otherwise, **false**.  
  
## Example  
 The following example determines whether an AL variant contains an Automation variable. The MyAutomation variable is assigned to the variant variable that is named MyVariant. The **ISAUTOMATION** method determines whether the variant contains an Automation variable and stores the return value in the varResult variable. In this case, the variant contains an Automation variable so **Yes** is returned and displayed in a message box. The [ISCODE Method (Variant)](devenv-ISCODE-Method-Variant.md) determines whether the variant contains a code variable. The return value is **No** because the variant does not contain a code. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyAutomation|Automation|AFormAut 1.0 Type Library|  
|MyVariant|Variant|Not applicable|  
|varResult|Boolean|Not applicable|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|Does the variant contain an Automation variable? %1|  
|Text001|Does the variant contain a code variable? %1|  
  
```  
MyVariant := MyAutomation;  
varResult := MyVariant.ISAUTOMATION;  
MESSAGE(Text000,varResult);  
varResult := MyVariant.ISCODE;  
MESSAGE(Text001, varResult);  
```  
  
## See Also  
 [Variant Data Type](../datatypes/devenv-Variant-Data-Type.md)