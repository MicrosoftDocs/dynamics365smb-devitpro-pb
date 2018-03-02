---
title: "NAME Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8e6cb8f3-5674-4d97-8daf-56917ca8d05b
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# NAME Method (RecordRef)
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
 This method works the same as the [TABLENAME Method \(Record\)](devenv-TABLENAME-Method-Record.md).  
  
## Example  
 The following example opens a table as a RecordRef variable that is named MyRecordRef. You can specify any table number in the [OPEN Method \(RecordRef\)](devenv-OPEN-Method-RecordRef.md). In this example, the table 18 \(Customer\) is open. The NAME method retrieves the name of table 18 and stores it in the varTableName variable. The table number and name are displayed in a message box. This example requires that you create the following variables global text constant.  
  
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
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)