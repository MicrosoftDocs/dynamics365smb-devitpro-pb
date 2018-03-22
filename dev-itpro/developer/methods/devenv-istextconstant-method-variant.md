---
title: "ISTEXTCONSTANT Method (Variant)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d6d1630d-0969-4064-918d-0daff6ce23a0
caps.latest.revision: 2
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ISTEXTCONSTANT Method (Variant)
Indicates whether an AL variant contains a text constant.  
  
## Syntax  
  
```  
  
Ok := Variant.ISTEXTCONSTANT  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the AL variant contains a text constant; otherwise, **false**.  
  
## Example  
 The following example determines whether an AL variant contains a text constant. The code assigns the Text000 text constant to the variant variable that is named MyVariant. The **ISTEXTCONSTANT** method determines whether the variant contains a text constant and stores the return value in the varResult variable. In this case, the variant contains a text constant so **Yes** is returned and displayed in a message box. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyVariant|Variant|  
|varResult|Boolean|  
  
|Text constant name|Enu value|  
|------------------------|---------------|  
|Text000|This is some text.|  
|Text001|Does the variant contain a text constant? %1.|  
  
```  
MyVariant := Text000;  
varResult := MyVariant.ISTEXTCONSTANT;  
MESSAGE(Text001,MyVariant,varResult);  
MESSAGE(Text001,varResult);  
```  
  
## See Also  
 [Variant Data Type](../datatypes/devenv-Variant-Data-Type.md)