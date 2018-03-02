---
title: "TABLENO Method (RecordID)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e4b07b76-3a0b-4483-acb7-71d291a20ac8
caps.latest.revision: 15
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# TABLENO Method (RecordID)
Gets the table number of the table that is identified by RecordID. This method returns an error if the record is blank.  
  
## Syntax  
  
```  
  
No := RecordID.TABLENO  
```  
  
#### Parameters  
 *RecordID*  
 Type: RecordID  
  
 The RecordID of the record whose number you want returned.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of the table.  
  
## Remarks  
 In previous versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], if a RecordID referred to a temporary table, then the table number value of the RecordID was the run-time generated sequence ID, which is from the base value of 2000100000. You could use the table number to determine if a RecordID referred to a temporary table. In [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], the table number value of a RecordID always contains the ID of the originating physical table and not the run-time generated sequence ID. If you previously used the [TABLENO Method \(RECORDID\)](devenv-TABLENO-Method-RecordID.md) to test for the sequence number and determine if the RecordID was temporary, then you use the [ISTEMPORARY Method \(RecordRef\)](devenv-ISTEMPORARY-Method-RecordRef.md) in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] instead.  
  
## Example  
 The following example opens the Customer table with the record reference variable named RecRef and finds the first record in the Customers table. If a record is found, the [RECORDID Method \(RecordRef\)](devenv-RECORDID-Method-RecordRef.md) gets the ID of the first record in the table. The TABLENO method then uses the RecID variable to retrieve the number of the table that contains the record. The table number is then displayed in a message box. This example requires that you create the following global variables.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|RecID|RecordID|  
|RecRef|RecordRef|  
|varTableNumber|Integer|  
  
```  
  
RecRef.OPEN(DATABASE::Customer);  
IF RecRef.FIND('-') THEN BEGIN  
  RecID := RecRef.RECORDID;  
  varTableNumber := RecID.TABLENO;  
  MESSAGE('The Customer table is number: %1', varTableNumber);  
  END  
ELSE BEGIN  
MESSAGE('No records found in the table');  
END;  
```  
  
## See Also  
 [RecordID Data Type](../datatypes/devenv-RecordID-Data-Type.md)