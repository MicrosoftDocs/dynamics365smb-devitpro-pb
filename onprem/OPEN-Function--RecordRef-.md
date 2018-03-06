---
title: "OPEN Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c7294ae4-3289-4ffc-b58a-c149b6849ce4
caps.latest.revision: 10
manager: edupont
---
# OPEN Function (RecordRef)
Causes a RecordRef variable to refer to a table, which is identified by its number in a particular company.  
  
## Syntax  
  
```  
  
RecordRef.OPEN(No[, Temp][, CompanyName])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 *No*  
 Type: Integer  
  
 The number of the table.  
  
 *Temp*  
 Type: Boolean  
  
 *CompanyName*  
 Type: Text or code  
  
 The name of the company to which you want to change. If you omit this parameter, the current company is used.  
  
## Remarks  
 When you use the RecordRef.OPEN function a new object is created. This object contains references to the open table, filters, and the record itself and all the fields it contains. You can open a table by using the table number or the name of the table that represents the table number. For example, you open the Customer table by using following syntax: `RecordRef.Open(18)` or `RecordRef.Open(DATABASE::Customer)`  
  
 If you use the *CompanyName* parameter, then this function works the same as the [CHANGECOMPANY Function \(Record\)](CHANGECOMPANY-Function--Record-.md).  
  
## Example  
 The following example uses the OPEN function to create a RecordRef variable that is named MyRecordRef for the Customer table. The parameters are omitted in this example because there is only one company in this example and the table will not be open as temporary table. The caption and number of records in the table are displayed in a message box. At the end of the display, the [CLOSE Function \(RecordRef\)](CLOSE-Function--RecordRef-.md) closes the table. This example requires that you create the following variable and text constants in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|'The %1 table contains %2 records.'|  
  
```  
  
MyRecordRef.OPEN(DATABASE::Customer);  
MESSAGE(Text000, MyRecordRef.CAPTION, MyRecordRef.COUNT);  
MyRecordRef.CLOSE;  
```  
  
## Example  
 This example shows how to use the OPEN function. In this example, "MyRecordRef" opens table 27 and then "FIND\('-'\)" finds the first record in the table. "TempMyRecordRef" opens a temporary table which is empty and therefore the "FIND\('-'\)" returns false. This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|TempMyRecordRef|RecordRef|  
  
```  
MyRecordRef.OPEN(27,FALSE);  
TempMyRecordRef.OPEN(27,TRUE);  
  
IF MyRecordRef.FIND('-') THEN // This is true and will find the first record in the table.  
  MESSAGE('MyRecordRef finds')  
ELSE  
  MESSAGE('MyRecordRef does not find');  
  
IF TempMyRecordRef.FIND('-') THEN // This is false because there are no records in a temporary table.  
  MESSAGE('TempMyRecordRef finds')  
ELSE  
  MESSAGE('TempMyRecordRef does not find');  
```  
  
## See Also  
 [GETTABLE Function \(RecordRef\)](GETTABLE-Function--RecordRef-.md)   
 [CHANGECOMPANY Function \(Record\)](CHANGECOMPANY-Function--Record-.md)   
 [RecordRef Data Type](RecordRef-Data-Type.md)