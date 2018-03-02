---
title: "ISBYTE Method (Variant)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 28606407-f54a-48e6-941f-811634efefff
caps.latest.revision: 3
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ISBYTE Method (Variant)
Indicates whether an AL variant contains a Byte data type variable.  
  
## Syntax  
  
```  
  
Ok := Variant.ISBYTE  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **True** if the AL variant contains a Byte data type variable; otherwise, **false**.  
  
## Example  
 The following example determines whether an AL variant contains a Byte data type variable. The code initializes the MyByte data type variable with the constant text string **A**. The MyByte variable is assigned to the variant variable that is named MyVariant. The **ISBYTE** method determines whether the variant contains a Byte variable and stores the return value in the varResult variable. In this case, the variant contains a Byte variable so **true** is returned and displayed in a message box. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyByte|Byte|  
|MyVariant|Variant|  
|varResult|Boolean|  
  
|Text constant name|Enu value|  
|------------------------|---------------|  
|Text000|Does the variant contain a Byte variable? %1.|  
  
```  
MyByte := 'A';  
MyVariant := MyByte;  
varResult := MyVariant.ISBYTE;  
MESSAGE(Text000,varResult);  
```  
  
## See Also  
 [Variant Data Type](../datatypes/devenv-variant-data-type.md)