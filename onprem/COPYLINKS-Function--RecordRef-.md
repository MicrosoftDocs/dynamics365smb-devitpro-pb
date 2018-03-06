---
title: "COPYLINKS Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cb387fc6-1939-47c7-984d-154a7e922e07
caps.latest.revision: 14
manager: edupont
---
# COPYLINKS Function (RecordRef)
Copies all the links from a particular record.  
  
## Syntax  
  
```  
  
RecordRef.COPYLINKS(FromRecord)  
```  
  
#### Parameters  
 *FromRecord*  
 Type: Record or RecordRef  
  
 Specifies the record from which you want to copy links.  
  
## Remarks  
 Use this function to copy all the links from a specified record and paste the links to the current record.  
  
 The link can be a link to a Web site, a file stored on the local or on a remote computer, or a link to a Microsoft Dynamics NAV page.  
  
## Example  
 The following example copies all links from a source record that is named VendorRecord to the currently open record in the Customer table. The source record is record 10000 from the Vendor table. The code opens the Customer table as a RecordRef variable that is named CustomerRecref. The [FIELD Function \(RecordRef\)](FIELD-Function--RecordRef-.md) creates a FieldRef variable that is named MyFieldRef for field 1 \(No.\) in the Customer table. The [SETRANGE Function \(FieldRef\)](SETRANGE-Function--FieldRef-.md) selects records in the range 20000 to 40000 from the Customer table and record 10000 from the Vendor table. The [FIND Function \(RecordRef\)](FIND-Function--RecordRef-.md) searches the Customer table for the records in the filtered range. If the record that meets the filter criteria is found, the links from the Vendor record No. 10000 are copied to the customer records in the range 30000 to 40000. The record id of the record to which the links were copied is displayed in a message box. The process is repeated until there is no more record in the range. The [CLOSE Function \(RecordRef\)](CLOSE-Function--RecordRef-.md) closes the table. This example requires that you create the following variables and text constants in the **C/AL Globals** window.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRecref|RecordRef|Not applicable|  
|MyFieldRef|FielRef|Not applicable|  
|VendorRecord|Record|Vendor|  
|Count|Integer|Not applicable|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The links have been copied to %1.|  
  
```  
  
CustomerRecref.OPEN(DATABASE::Customer);  
MyFieldRef := CustomerRecref.FIELD(1);  
MyFieldRef.SETRANGE('30000' , '40000');  
VendorRecord.SETRANGE("No.", '10000');  
Count := 0;  
IF CustomerRecref.FIND('-') THEN  
  REPEAT  
    Count := Count + 1;  
    CustomerRecref.COPYLINKS(VendorRecord);  
    MESSAGE(Text000, CustomerRecref.RECORDID);  
  UNTIL CustomerRecref.NEXT = 0;  
CustomerRecref.CLOSE;  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)