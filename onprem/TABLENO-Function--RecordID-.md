---
title: "TABLENO Function (RecordID)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e4b07b76-3a0b-4483-acb7-71d291a20ac8
caps.latest.revision: 15
manager: edupont
---
# TABLENO Function (RecordID)
Gets the table number of the table that is identified by RecordID. This function returns an error if the record is blank.  
  
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
 In previous versions of [!INCLUDE[navnow](includes/navnow_md.md)], if a RecordID referred to a temporary table, then the table number value of the RecordID was the run-time generated sequence ID, which is from the base value of 2000100000. You could use the table number to determine if a RecordID referred to a temporary table. In [!INCLUDE[navnow](includes/navnow_md.md)], the table number value of a RecordID always contains the ID of the originating physical table and not the run-time generated sequence ID. If you previously used the [TABLENO Function \(RECORDID\)](TABLENO-Function--RecordID-.md) to test for the sequence number and determine if the RecordID was temporary, then you use the [ISTEMPORARY Function \(RecordRef\)](ISTEMPORARY-Function--RecordRef-.md) in [!INCLUDE[navnowlong](includes/navnowlong_md.md)] instead.  
  
## Example  
 The following example opens the Customer table with the record reference variable named RecRef and finds the first record in the Customers table. If a record is found, the [RECORDID Function \(RecordRef\)](RECORDID-Function--RecordRef-.md) gets the ID of the first record in the table. The TABLENO function then uses the RecID variable to retrieve the number of the table that contains the record. The table number is then displayed in a message box. This example requires that you create the following variables in the **C/AL Globals** window.  
  
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
 [RecordID Data Type](RecordID-Data-Type.md)