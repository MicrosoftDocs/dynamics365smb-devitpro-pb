---
title: "DELETEALL Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 7f6bc123-2390-45d4-b2e7-6c45594b6aea
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# DELETEALL Method (RecordRef)
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
 This method works the same way as the [DELETEALL Method \(Record\)](devenv-DELETEALL-Method-Record.md).  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecRef. The [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md) creates a FieldRef variable that is named MyFieldRef for field 1 \(No.\). From the No. field, the [SETRANGE Method \(FieldRef\)](devenv-SETRANGE-Method-FieldRef.md) selects records in the range from 10000 to 20000. The number of records in the range is displayed in a message box. The DELETEALL method deletes all records in that range. The number of records is displayed again. This time, 0 is displayed because all the records in the range are deleted. This example requires that you create the following global variable and text constant.  
  
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
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)   
 [OnDelete Trigger](../triggers/devenv-OnDelete-Trigger.md)