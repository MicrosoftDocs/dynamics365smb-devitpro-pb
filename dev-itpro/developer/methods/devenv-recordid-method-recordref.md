---
title: "RECORDID Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: de13007e-9cd2-4b47-9e76-581699387de7
caps.latest.revision: 9
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RECORDID Method (RecordRef)
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
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named MyRecordRef. The [FINDLAST Method \(RecordRef\)](devenv-FINDLAST-Method-RecordRef.md) finds the last record in the table. The record id of the last record is retrieved, stored in the RecID variable displayed in message box. This example requires that you create the following global variables and text constant.  
  
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
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)