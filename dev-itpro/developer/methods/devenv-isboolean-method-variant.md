---
title: "ISBOOLEAN Method (Variant)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 62258e4d-504d-436e-88c3-d9fe4a788b03
caps.latest.revision: 9
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ISBOOLEAN Method (Variant)
Indicates whether an AL variant contains a Boolean variable.  
  
## Syntax  
  
```  
  
Ok := Variant.ISBOOLEAN  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **True** if the AL variant contains a Boolean variable; otherwise, **false**.  
  
## Example  
 The following example determines whether an AL variant contains a Boolean variable. The code initializes the MyBoolean variable with a Boolean value. The MyBoolean variable is assigned to the variant variable that is named MyVariant. The **ISBOOLEAN** method determines whether the variant contains a Boolean variable and stores the return value in the varResult variable. In this case, the variant contains a Boolean variable so **true** is returned and displayed in a message box. The Boolean value is obtained from the **Critical** field in the **Item** table. The [ISCODE Method (Variant)](devenv-ISCODE-Method-Variant.md) determines whether the variant contains a code variable. The return value is **false** because the variant does not contain a code. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|ItemRec|Record|Item|  
|MyBoolean|Boolean|Not applicable|  
|MyVariant|Variant|Not applicable|  
|varResult|Boolean|Not applicable|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|Does the variant >%1\< contain a Boolean variable? %2|  
|Text001|Does the variant >%1\< contain a code variable? %2|  
  
```  
MyBoolean := ItemRec.Critical;  
MyVariant := MyBoolean;  
varResult := MyVariant.ISBOOLEAN;  
MESSAGE(Text000,MyVariant,varResult);  
varResult := MyVariant.ISCODE;  
MESSAGE(Text001,MyVariant,varResult);  
```  
  
## See Also  
 [Variant Data Type](../datatypes/devenv-variant-data-type.md)