---
title: "RECORDID Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: de13007e-9cd2-4b47-9e76-581699387de7
caps.latest.revision: 9
---
# RECORDID Function (RecordRef)
Gets the RecordID of the record that is currently selected in the table. If no table is selected, an error is generated.  
  
## Syntax  
  
```  
  
RecordID := RecordRef.RECORDID  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef of the record whose recordID you want to get.  
  
## Property Value/Return Value  
 Type: RecordID  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named MyRecordRef. The [FINDLAST Function \(RecordRef\)](FINDLAST-Function--RecordRef-.md) finds the last record in the table. The record id of the last record is retrieved, stored in the RecID variable displayed in message box. This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|RecID|RecordID|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The record id for the last record is: %1|  
  
```  
  
MyRecordRef.OPEN(18);  
MyRecordRef.FINDLAST;  
RecID := MyRecordRef.RECORDID;  
MESSAGE(Text000, RecID);  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)