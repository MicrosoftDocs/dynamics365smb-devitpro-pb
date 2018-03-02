---
title: "ISBYTE Function (Variant)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 28606407-f54a-48e6-941f-811634efefff
caps.latest.revision: 3
---
# ISBYTE Function (Variant)
Indicates whether a C/AL variant contains a Byte data type variable.  
  
## Syntax  
  
```  
  
Ok := Variant.ISBYTE  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the C/AL variant contains a Byte data type variable; otherwise, **false**.  
  
## Example  
 The following example determines whether a C/AL variant contains a Byte data type variable. The code initializes the MyByte data type variable with the constant text string **A**. The MyByte variable is assigned to the variant variable that is named MyVariant. The **ISBYTE** function determines whether the variant contains a Byte variable and stores the return value in the varResult variable. In this case, the variant contains a Byte variable so **Yes** is returned and displayed in a message box. This example requires that you create the following variables and text constants in the **C/AL Globals** window.  
  
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
 [Variant Data Type](Variant-Data-Type.md)