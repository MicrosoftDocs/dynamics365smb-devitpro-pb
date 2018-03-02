---
title: "OPTIONSTRING Method (FieldRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: ec2d3585-1585-4b5a-a4f7-aee88e799ba0
caps.latest.revision: 12
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# OPTIONSTRING Method (FieldRef)
Gets the list of options that are available in the field that is currently selected.  
  
## Syntax  
  
```  
  
OptionString := FieldRef.OPTIONSTRING  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 Refers to the current field.  
  
## Property Value/Return Value  
 Type: Text  
  
 The list of options that is available in the field.  
  
## Remarks  
 All the options for this field are returned as a comma separated string.  
  
 This method returns an error if no field is selected.  
  
 If the field is not an option an empty string is returned  
  
## Example  
 The following example opens the Item table with RecordRef variable that is named ItemRecref and creates a reference to field 19 \(Price/Profit Calculation\), which is an Options field. The OPTIONSTRING method retrieves the options in the field and displays them as a comma separated list. This example requires that you create the following global variabless.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|ItemRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|OptionString|Text|  
  
```  
  
ItemRecref.OPEN(DATABASE::Item);  
MyFieldRef := ItemRecref.FIELD(19);  
OptionString := MyFieldRef.OPTIONSTRING;  
MESSAGE(' %1', OptionString);  
```  
  
## See Also  
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)