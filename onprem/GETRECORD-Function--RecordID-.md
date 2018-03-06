---
title: "GETRECORD Function (RecordID)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 58abfa67-013a-40d6-8e71-94dbb1ddd03d
caps.latest.revision: 14
---
# GETRECORD Function (RecordID)
Gets a RecordRef that refers to the record identified by the RecordID.  

## Syntax  

```  

RecordRef := RecordID.GETRECORD  
```  

#### Parameters  
 *RecordID*  
 Type: RecordID  

 The RecordID of the record for which you want the RecordRef.  

## Property Value/Return Value  
 Type: RecordRef  

 The RecordRef of the record.  

## Remarks  
 No data is read from the database when you run this function and therefore, no other fields in the record are set. Furthermore, no filters are set on the record.

## Example  
 The following example opens table number 18 \(Customer table\) and sets a reference to the table. The [FINDLAST Function \(RecordRef\)](FINDLAST-Function--RecordRef-.md) selects the last record in the table. The [RECORDID Function \(RecordRef\)](RECORDID-Function--RecordRef-.md) retrieves the ID of the currently selected record. In this case, it is the last record in the table. The [GETRECORD Function \(RECORDID\)](GETRECORD-Function--RecordID-.md) uses the retrieved record ID to determine the RecordRef of the selected record \(the last record\). This example requires that you create the following variables and text constant in the **C/AL Globals** window.  

|Variable name|DataType|  
|-------------------|--------------|  
|RecRef|RecordRef|  
|RecID|RecordID|  

```  

RecRef.OPEN(18);  
RecRef.FINDLAST;  
RecID := RecRef.RECORDID;   
RecRef := RecID.GETRECORD;  
```  

## See Also  
 [RecordID Data Type](RecordID-Data-Type.md)
