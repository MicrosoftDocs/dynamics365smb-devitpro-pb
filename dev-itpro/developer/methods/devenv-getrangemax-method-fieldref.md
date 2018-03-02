---
title: "GETRANGEMAX Method (FieldRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 3f00ac16-e745-4d4a-9e20-17a09f015780
caps.latest.revision: 15
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETRANGEMAX Method (FieldRef)
Gets the maximum value in a range for a field.  
  
## Syntax  
  
```  
  
Value := FieldRef.GETRANGEMAX  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 Refers to the current field.  
  
## Property Value/Return Value  
 Type: depends on the field referred to by the FieldRef.  
  
 Contains the maximum value of the range set for the field referred to by the FieldRef.  
  
 The type of value must match the type of the field referred to by the FieldRef.  
  
## Remarks  
 This method is like the [GETRANGEMAX Method \(Record\)](devenv-GETRANGEMAX-Method-Record.md) method.  
  
## Example  
 The following example opens the Customer table as RecordRef variable, creates a FieldRef for the first field \(No.\) and stores the reference in the MyFieldRef variable. The [SETFILTER Method \(FieldRef\)](devenv-SETFILTER-Method-FieldRef.md) sets a filter that selects records in the range 10000 to 40000 from the No. field. The GETRANGEMAX method retrieves and stores the maximum value that was set in the filter, stores the value in the varMax variable and displays it in a message box. The varMax variable contains 40000 which is the maximum value that is set in the filter. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|varMax|Text|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The maximum value in the filter is %1.|  
  
```  
  
CustomerRecref.OPEN(DATABASE::Customer);  
MyFieldRef := CustomerRecref.FIELD(1);  
MyFieldRef.SETFILTER('10000..40000');  
varMax := MyFieldRef.GETRANGEMAX;  
MESSAGE(Text000, varMax);  
```  
  
## See Also  
 [GETRANGEMIN Method \(FieldRef\)](devenv-GETRANGEMIN-Method-FieldRef.md)   
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)