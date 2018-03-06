---
title: "NAME Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8e6cb8f3-5674-4d97-8daf-56917ca8d05b
caps.latest.revision: 10
manager: edupont
---
# NAME Function (RecordRef)
Gets the name of the table that is currently selected. Returns an error if no table is selected.  
  
## Syntax  
  
```  
  
Name := RecordRef.NAME  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that identifies the table in which you are interested.  
  
## Property Value/Return Value  
 Type: Text \(30\)  
  
 The name of the table.  
  
## Remarks  
 This function works the same as the [TABLENAME Function \(Record\)](TABLENAME-Function--Record-.md).  
  
## Example  
 The following example opens a table as a RecordRef variable that is named MyRecordRef. You can specify any table number in the [OPEN Function \(RecordRef\)](OPEN-Function--RecordRef-.md). In this example, the table 18 \(Customer\) is open. The NAME function retrieves the name of table 18 and stores it in the varTableName variable. The table number and name are displayed in a message box. This example requires that you create the following variables text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|varTableName|Text|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Table %1 is the %2 table.|  
  
```  
  
TableNo := 18;  
MyRecordRef.OPEN(TableNo);  
varTableName := MyRecordRef.NAME;  
MESSAGE(Text000, TableNo, varTableName);  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)