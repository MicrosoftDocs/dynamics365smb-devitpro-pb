---
title: "GETPOSITION Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9b356763-1569-4c58-bd2e-1802158e6cf6
caps.latest.revision: 11
---
# GETPOSITION Function (RecordRef)
Gets a string that contains the primary key of the current record.  
  
## Syntax  
  
```  
  
String := RecordRef.GETPOSITION([UseCaptions])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the record for which you want to know the primary key.  
  
 *UseNames*  
 Type: Boolean  
  
 Indicates whether a reference to the field caption or the field number should be returned.  
 
 The *UseCaptions* parameter is optional. If it is set to **true** \(default value\) or if it is empty, then the returned string contains references to field captions in the table with which the record is associated. If the parameter is set to **false**, then field numbers are used instead.   
  
## Property Value/Return Value  
 Type: Text or code  
  
 The name or number of the field that contains the primary key.  
  
## Remarks  
 This function works just like the [GETPOSITION Function \(Record\)](GETPOSITION-Function--Record-.md).  
  
## Example  
 The following example opens the Customer table as a RecodRef that is named RecRef. The RecordRef variable uses the GETPOSITION function to retrieve the position of the primary key. The *UseCaptions* parameter is set to **true** so the caption of the field that contains the primary key is returned. If you set *UseCaptions* to **false**, the number of the field is returned. This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|RecRef|RecordRef|  
|varPrimaryKey|Text|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The primary key is: %1.|  
  
```  
  
RecRef.OPEN(DATABASE::Customer);  
varPrimaryKey := RecRef.GETPOSITION(TRUE);  
MESSAGE(Text000, varPrimaryKey);  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)