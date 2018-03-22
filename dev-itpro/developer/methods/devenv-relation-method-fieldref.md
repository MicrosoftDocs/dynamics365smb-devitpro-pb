---
title: "RELATION Method (FieldRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 3b7b4cc8-77ac-4b41-9d6b-f88ee11bb4e7
caps.latest.revision: 13
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RELATION Method (FieldRef)
Finds the table relationship of a given field.  
  
## Syntax  
  
```  
  
TableNumber := FieldRef.RELATION  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 The FieldRef that refers to the field for which you want to find the table relationship.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of the table that has a relationship with the field referred to by *FieldRef*.  
  
 This relationship is set up through the properties.  
  
## Remarks  
 You can use this method for several purposes such as to determine lookups or to check to see if you have permission to read from a table.  
  
 This method is similar to the [RELATION Method \(Record\)](devenv-RELATION-Method-Record.md) method.  
  
## Example  
 The following example opens table 37, the Sales Line table, as a RecordRef variable and creates a reference to field 2 \(Sell-to Customer No.\). The [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md) of field 2 is stored in the MyFieldRef variable. The RELATION method retrieves the number of the table that has a relation with the Sell-To-Customer field \(field 2\). The table number is stored the varRelation variable and displayed in the message box. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|SaleRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|varRelation|Integer|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Field 2 in the Sales Line \(37\) table has a relation with table %1.|  
  
```  
  
SaleRecref.OPEN(37);  
MyFieldRef := SaleRecref.FIELD(2);  
varRelation := MyFieldRef.RELATION;  
MESSAGE(Text000, varRelation);  
```  
  
## See Also  
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)