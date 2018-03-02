---
title: "ISDATE Function (Variant)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 95420b45-4c60-489b-b71e-f56e63a84cb3
caps.latest.revision: 9
---
# ISDATE Function (Variant)
Indicates whether a C/AL variant contains a Date variable.  
  
## Syntax  
  
```  
  
Ok := Variant.ISDATE  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the C/AL variant contains a Date variable; otherwise, **false**.  
  
## Example  
 The following example determines whether a C/AL variant contains a Date variable. The code initializes the MyDate variable with a Date value. The MyDate variable is assigned to the variant variable that is named MyVariant. The **ISDATE** function determines whether the variant contains a Date variable and stores the return value in the varResult variable. In this case, the variant contains a Date variable so **Yes** is returned and displayed in a message box. The [ISCODE Function \(Variant\)](ISCODE-Function--Variant-.md) determines whether the variant contains a Code variable. The return value is **No** because the variant does not contain a code. This example requires that you create the following variables and text constants in the **C/AL Globals** window.  
  
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
 [Variant Data Type](Variant-Data-Type.md)