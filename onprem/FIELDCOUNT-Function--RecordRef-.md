---
title: "FIELDCOUNT Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3d4fbd5d-52db-4acf-bb78-257e231874c6
caps.latest.revision: 12
---
# FIELDCOUNT Function (RecordRef)
Gets the number of fields in the table that are currently selected or returns the number of fields that have been defined in a key. Returns an error if no table or no key is selected.  
  
## Syntax  
  
```  
  
Count := RecordRef.FIELDCOUNT  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef of the record that you use to identify the table.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of fields in the table.  
  
## Example  
 The following example loops through tables 3 through 5 and displays the number of fields that are defined in each table. The code starts by opening table 3 \(Payment Terms\) as a RecordRef variable that is named MyRecordRef. MyRecordRef variable uses the FIELDCOUNT function to retrieve the number of fields that are defined in the table and stores it in the varFieldCount variable. The name of each table and the total number of fields in the table are displayed in a message box. The table that is open is closed before the next one is open. This example requires that you create the following variables and text constants in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|varFieldCount|Integer|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The %1 table contains %2 field\(s\).\\|  
  
```  
  
FOR i := 3 TO 5 DO BEGIN  
  MyRecordRef.OPEN(i);  
  varFieldCount := MyRecordRef.FIELDCOUNT;  
  MESSAGE(Text000, MyRecordRef.NAME, varFieldCount);  
  MyRecordRef.CLOSE;  
 END;  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)