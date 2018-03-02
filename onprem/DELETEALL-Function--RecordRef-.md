---
title: "DELETEALL Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7f6bc123-2390-45d4-b2e7-6c45594b6aea
caps.latest.revision: 11
manager: edupont
---
# DELETEALL Function (RecordRef)
Deletes all records in a table that fall within a specified range.  
  
## Syntax  
  
```  
  
RecordRef.DELETEALL([RunTrigger])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 Identifies the table in which the deletion will occur. Only those records selected by the filters set for RecordRef are deleted.  
  
 *RunTrigger*  
 Type: Boolean  
  
 Specifies whether the code in the **OnDelete** trigger will be executed. If this parameter is **true**, the code will be executed. If this parameter is **false** \(default\), the code will not be executed.  
  
 This parameter is optional.  
  
## Remarks  
 This function works the same way as the [DELETEALL Function \(Record\)](DELETEALL-Function--Record-.md).  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecRef. The [FIELD Function \(RecordRef\)](FIELD-Function--RecordRef-.md) creates a FieldRef variable that is named MyFieldRef for field 1 \(No.\). From the No. field, the [SETRANGE Function \(FieldRef\)](SETRANGE-Function--FieldRef-.md) selects records in the range from 10000 to 20000. The number of records in the range is displayed in a message box. The DELETEALL function deletes all records in that range. The number of records is displayed again. This time, 0 is displayed because all the records in the range are deleted. This example requires that you create the following variable and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecRef|RecordRef|  
|MyFieldRef|FieldRef|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The number of records in the range is %1.|  
  
```  
  
CustomerRecRef.OPEN(18);  
MyFieldRef := CustomerRecRef.FIELD(1);  
MyFieldRef.SETRANGE('10000' , '20000');  
MESSAGE(Text000 ,CustomerRecRef.COUNT);  
CustomerRecRef.DELETEALL;  
MESSAGE(Text000 ,CustomerRecRef.COUNT);  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)   
 [OnDelete Trigger](OnDelete-Trigger.md)