---
title: "NEXT Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 29d765c2-ce4e-4bff-b263-6f9e19e09a7f
caps.latest.revision: 10
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# NEXT Method (RecordRef)
Steps through a specified number of records and retrieves a record.  
  
## Syntax  
  
```  
  
[Steps :=] RecordRef.NEXT([Steps])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the record that you want to use as the starting point for the steps. The method returns 0 if no table is selected.  
  
 *Steps*  
 Type: Integer  
  
 Defines the direction of the search and how many records to step over.  
  
 If this parameter is greater than zero, the method will search the number of records specified in *Steps* forward in the table. If this parameter is less than zero, the method will search the number of records specified in *Steps* backward in the table. If this parameter is 0, no records are stepped over.  
  
 If you do not specify this parameter, the method finds the next record.  
  
## Property Value/Return Value  
 Type: Integer  
  
 Returns the number of records inspected which meet the criteria of any filters and the current key. This value can be less than *Steps*, depending on the number of records in the table. If the table is empty, zero is returned and the record is not changed.  
  
## Remarks  
 This method locates a record positioned a given number of steps forward or backward from the record specified by *RecordRef*. Movement through the table is governed by the filters and the current key associated with the records. The fields in the record which will be compared with the current key fields must contain appropriate values before the method is called.  
  
 This method works the same as the [NEXT Method \(Record\)](devenv-NEXT-Method-Record.md).  
  
## Example  
 The following example opens the Customer table as a RecordRef object, creates a reference to the first \(No.\) field, and stores the reference in the MyFieldRef variable. The SETRANGE method sets a filter that selects all records from 10000 to 40000 in the No. field. The [FIND Method \(RecordRef\)](devenv-FIND-Method-RecordRef.md) searches and selects the first record in the filter and counts the number of records that are found. The number of records is stored in the Count variable. The process is repeated by looping through all the records in the filter until no more records are found. The NEXT method steps through the records and finds the next record because no value is specified for the *Steps* parameter. The number of records that are found in the range is stored in the Count variable and displayed in a message box. This example requires that you create the following global variables and text constants.  
  
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
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)