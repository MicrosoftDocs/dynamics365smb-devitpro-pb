---
title: "SETRANGE Method (FieldRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: dad61b4c-6b02-480b-85be-1cd64fe96318
caps.latest.revision: 14
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETRANGE Method (FieldRef)
Sets a simple filter on a field, such as a single range or a single value.  
  
## Syntax  
  
```  
  
FieldRef.SETRANGE([FromValue] [, ToValue])  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 The FieldRef that refers to the field that you want to place a filter on.  
  
 *FromValue*  
 Type: any  
  
 The lower limit of the range. The data type of *FromValue* must match the data type of the field referred to by *FieldRef*.  
  
 *ToValue*  
 Type: any  
  
 The upper limit of the range. If you omit this parameter, the *FromValue* you specified is used. The data type of *ToValue* must match the data type of the field referred to by *FieldRef*.  
  
## Remarks  
 The SETRANGE method provides a quick way to set a simple filter on a field.  
  
 If you call this method by using a field that already has a filter, that filter is removed before the new filter is set.  
  
 If you omit all of the optional parameters, all filters set for that field are removed.  
  
 The SETRANGE method fails if no field is selected.  
  
 This method is like the [SETRANGE Method \(Record\)](devenv-SETRANGE-Method-Record.md) method.  
  
## Example  
 The following example opens the Customer table as a RecordRef object, creates a reference to the first \(No.\) field, and stores the reference in the MyFieldRef variable. The SETRANGE method sets a filter that selects all records from 10000 to 40000 in the No. field. The [FIND Method \(RecordRef\)](devenv-FIND-Method-RecordRef.md) searches and selects the first record in the filter and counts the number of records that are found. The number of records is stored in the Count variable. The process is repeated by looping through all the records in the filter until no more records are found. The number of records that are found in the range is stored in the Count variable and displayed in a message box. This example requires that you create the following global variabless.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|Count|Integer|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|%1 records were retrieved.|  
  
```  
  
CustomerRecref.OPEN(DATABASE::Customer);  
MyFieldRef := CustomerRecref.FIELD(1);  
MyFieldRef.SETRANGE('10000' , '40000');  
Count := 0;  
IF CustomerRecref.FIND('-') THEN  
  REPEAT  
    Count := Count + 1;  
  UNTIL CustomerRecref.NEXT = 0;  
MESSAGE(Text000 , Count);  
```  
  
## See Also  
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)