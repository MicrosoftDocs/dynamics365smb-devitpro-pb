---
title: "FIELDEXIST Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 75e3d634-83fa-4f7f-b506-e18c675dac4f
caps.latest.revision: 12
---
# FIELDEXIST Function (RecordRef)
Determines if the field that has the number *FieldNo* exists in the table that is referred to by the RecordRef. Returns an error if no table is currently selected.  
  
## Syntax  
  
```  
  
Exist := RecordRef.FIELDEXIST(FieldNo)  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that identifies the record and the table in which you are interested.  
  
 *FieldNo*  
 Type: Integer  
  
 The FieldNo that you want to know whether it exists in the table.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the field exists in the table; otherwise, **false**.  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named MyRecordRef. The code loops through fields 1 through 12 and uses the FIELDEXIST function to determine whether the specified field exists. If the field exists, the name of the field and a message that indicates that the field exists is displayed. Otherwise, a message that indicates that the field does not exist is displayed. This example requires that you create the following variables and text constants in the **C/AL Globals** window.  
  
|||  
|-|-|  
|Name|DataType|  
|MyRecordRef|RecordRef|  
|i|Integer|  
|VarFieldName|FieldRef|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Field %1 exists.\\The name of the Field is: " %2 ".|  
|Text001|Text|Field %1 does not exist.|  
  
```  
  
MyRecordRef.OPEN(18);  
FOR i := 1 TO 12 DO BEGIN  
  IF MyRecordRef.FIELDEXIST(i) THEN BEGIN  
     VarFieldName := MyRecordRef.FIELD(i);  
     MESSAGE(Text000, i, VarFieldName.NAME);  
    END  
  ELSE  
    MESSAGE(Text001, i);  
  END;  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)