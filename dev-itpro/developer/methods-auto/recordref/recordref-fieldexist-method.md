---
title: "FieldExist Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldExist Method
Determines if the field that has the number FieldNo exists in the table that is referred to by the RecordRef. Returns an error if no table is currently selected.


## Syntax
```
Exist :=   RecordRef.FieldExist(FieldNo: Integer)
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*FieldNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The FieldNo that you want to know whether exists in the table.  


## Return Value
*Exist*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the field exists; otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named MyRecordRef. The code loops through fields 1 through 12 and uses the FIELDEXIST method to determine whether the specified field exists. If the field exists, the name of the field and a message that indicates that the field exists is displayed. Otherwise, a message that indicates that the field does not exist is displayed. This example requires that you create the following global variables and text constants.  
  
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
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)