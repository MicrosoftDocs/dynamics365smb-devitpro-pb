---
title: "SETPOSITION Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 4c480c65-1e5d-4472-b76e-a37de8fdffa6
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETPOSITION Method (RecordRef)
Sets the fields in a primary key on a record to the values specified in the *String* parameter. The remaining fields are not changed.  
  
## Syntax  
  
```  
  
RecordRef.SETPOSITION(String)  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the record.  
  
 *String*  
 Type: Text or Code  
  
 The string that is used to set the primary key. This string contains the primary key value to set.  
  
## Remarks  
 This method works the same as the [SETPOSITION Method \(Record\)](devenv-SETPOSITION-Method-Record.md).  
  
## Example  
 The following example changes the value in the primary key, the No. field, in table 23 \(Vendor\). Other fields are not changed. The code starts by opening table 23 \(Vendor\) as a RecordRef variable that is named MyRecordRef. The [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md) selects the first field \(No.\) and stores the value in the MyFieldRef variable. The [SETFILTER Method \(FieldRef\)](devenv-SETFILTER-Method-FieldRef.md) sets a filter that selects records from 10000 to 20000. The [FINDLAST Method \(RecordRef\)](devenv-FINDLAST-Method-RecordRef.md) finds and retrieves the last record in the record set. The SETPOSITION method changes the value in the No. field from 20000 to 20001. The record No. and the name of the record are displayed before and displayed again after the primary key value is changed. The string that contains the new primary key is initialized in the InputString variable. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|InputString|Text|  
|MyRecordRef|RecordRef|  
|MyFieldRef|FieldRef|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The record No. before the primary key was changed is %1.\\ The vendor name before the primary key was changed is %2.|  
|Text001|Text|The record No. after the primary key was changed is %1. \\ The vendor name after the primary key was changed is %2.|  
  
```  
  
InputString := 'No.=CONST(20001)';  
MyRecordRef.OPEN(23);  
MyFieldRef := MyRecordRef.FIELD(1);  
MyFieldRef.SETFILTER('10000..20000');  
MyRecordRef.FINDLAST;  
MESSAGE(Text000, MyRecordRef.RECORDID, MyRecordRef.FIELD(2));  
MyRecordRef.SETPOSITION(InputString);  
MESSAGE(Text001, MyRecordRef.RECORDID, MyRecordRef.FIELD(2));  
  
```  
  
 The following is displayed before the SETPOSITION method is called:  
  
 **The record No. before the primary key was changed is Vendor: 20000.**  
  
 **The vendor name before the primary key was changed is AR Day property Management.**  
  
 The following is displayed after the SETPOSITION method is called:  
  
 **The record No. after the primary key was changed is Vendor: 20001.**  
  
 **The vendor name after the primary key was changed is AR Day property Management.**  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)