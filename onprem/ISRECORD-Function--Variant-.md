---
title: "ISRECORD Function (Variant)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b7bdf284-f0a7-481b-b949-62bf215656e5
caps.latest.revision: 10
---
# ISRECORD Function (Variant)
Indicates whether a C/AL variant contains a Record variable.  
  
## Syntax  
  
```  
  
Ok := Variant.ISRECORD  
```  
  
#### Parameters  
 *Variant*  
 Type: Variant  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the C/AL variant contains a Record variable; otherwise, **false**.  
  
## Example  
 The following example determines whether a C/AL variant contains a record variable. The GET function gets customer number 10000 from the **Customer** table. The record is stored in the MyRecord variable. The MyRecord variable is assigned to the variant variable that is named MyVariant. The **ISRECORD** function determines whether the variant contains a Record variable and stores the return value in the varResult variable. In this case, the variant contains a Record variable so **Yes** is returned and displayed in a message box. The [ISCODE Function \(Variant\)](ISCODE-Function--Variant-.md)determines whether the variant contains a code variable. The return value is **No** because the variant does not contain a code. This example requires that you create the following variables and text constants in the **C/AL Globals** window.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Customer|  
|MyVariant|Variant|Not applicable|  
|varResult|Boolean|Not applicable|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|Does the variant >%1\< contain a record variable? %2.|  
|Text001|Does the variant >%1\< contain a code variable? %2.|  
  
```  
MyRecord.GET('10000');  
MyVariant := MyRecord;  
varResult := MyVariant.ISRECORD;  
MESSAGE(Text000,MyVariant,varResult);  
varResult := MyVariant.ISCODE;  
MESSAGE(Text001,MyVariant,varResult);  
```  
  
## See Also  
 [Variant Data Type](Variant-Data-Type.md)