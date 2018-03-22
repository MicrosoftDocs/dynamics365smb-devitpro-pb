---
title: "MODIFYALL Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 87c1f61d-378d-45ef-a810-ae33622061d6
caps.latest.revision: 7
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# MODIFYALL Method (Record)
Modifies a field in all records within a range that you specify.  
  
## Syntax  
  
```  
  
Record.MODIFYALL(Field, NewValue [, RunTrigger])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that contains the field that you want to modify.  
  
 *Field*  
 Type: Field  
  
 The field that you want to modify.  
  
 *NewValue*  
 Type: Any  
  
 The value that you want to assign to *Field* in all records. The data type of *NewValue* must match the data type of *Field*.  
  
 *RunTrigger*  
 Type: Boolean  
  
 If this parameter is **true**, the code in the [OnModify Trigger](../triggers/devenv-OnModify-Trigger.md) is executed. If this parameter is **false** \(default\), the code in the **OnModify** trigger is not executed.  
  
## Remarks  
 If no filter is set, the field is modified in all records in the table. If a filter is set, the fields are modified only in the records which fall within the range specified by the filter.  
  
 The [OnValidate \(Fields\) Trigger](../triggers/devenv-OnValidate-Fields-Trigger.md) is never executed when MODIFYALL is used.  
  
## Example  
 This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
  
```  
// The result of this statement:  
CustomerRec.MODIFYALL("Statistics Group", 2);  
// is equivalent to:  
IF CustomerRec.FIND('-') THEN   
  REPEAT  
    CustomerRec."Statistics Group" := 2;  
    CustomerRec.MODIFY;  
  UNTIL CustomerRec.NEXT = 0;  
```  
  
## See Also  
 [MODIFY Method \(Record\)](devenv-MODIFY-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)