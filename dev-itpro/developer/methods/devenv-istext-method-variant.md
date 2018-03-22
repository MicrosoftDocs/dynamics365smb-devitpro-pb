---
title: "ISTEXT Method (Variant)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 4025dac3-569b-4e4c-983d-36e346079e79
caps.latest.revision: 11
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ISTEXT Method (Variant)
Indicates whether an AL variant contains a Text variable.  
  
## Syntax  
  
```  
  
Ok := Variant.ISTEXT  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the AL variant contains a Text variable; otherwise, **false**.  
  
## Example  
 The following example determines whether an AL variant contains a text variable. The code initializes the MyText variable with a text value. The MyText variable is assigned to the variant variable that is named MyVariant. The **ISTEXT** method determines whether the variant contains a text variable and stores the return value in the varResult variable. In this case, the variant contains a text variable so **Yes** is returned and displayed in a message box. The **ISCODE** method determines whether the variant contains a code variable. The return value is **No** because the variant does not contain a code. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|MyText|Text|50|  
|MyVariant|Variant|Not applicable|  
|varResult|Boolean|Not applicable|  
  
|Text constant name|Enu value|  
|------------------------|---------------|  
|Text000|Does the variant >%1\< contain a text variable? %2.|  
|Text001|Does the variant >%1\< contain a code variable? %2.|  
  
```  
MyText := 'This is some text';  
MyVariant :=  MyText;  
varResult := MyVariant.ISTEXT;  
MESSAGE(Text000,MyVariant,varResult);  
varResult := MyVariant.ISCODE;  
MESSAGE(Text001,MyVariant,varResult);  
```  
  
## See Also  
 [Variant Data Type](../datatypes/devenv-Variant-Data-Type.md)