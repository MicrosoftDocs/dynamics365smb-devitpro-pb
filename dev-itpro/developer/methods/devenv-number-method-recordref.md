---
title: "NUMBER Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 31bc8a42-1b0b-44c0-9744-cbb517cc8ce8
caps.latest.revision: 15
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# NUMBER Method (RecordRef)
Gets the table ID \(number\) of the table that contains the record that was referred to by the RecordRef.  
  
## Syntax  
  
```  
  
No := RecordRef.NUMBER  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the table in which you are interested.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of the table or the number of the field.  
  
## Remarks  
 In versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] earlier than [!INCLUDE[nav7long](../includes/nav7long_md.md)], if a RecordRef referred to a temporary table, then the table number value of the RecordRef was the run-time generated sequence ID, which is from the base value of 2000100000. You could use the table number to determine whether a RecordRef referred to a temporary table. In [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], the table number value of a RecordRef always contains the ID of the originating physical table and not the run-time generated sequence ID. If you previously used the NUMBER Method \(RECORDREF\) to test for the sequence number and determine whether the RecordRef was temporary, then you must use the [ISTEMPORARY Method \(RecordRef\)](devenv-ISTEMPORARY-Method-RecordRef.md) in [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] instead.  
  
## Example  
 The following example opens the Customer table \(18\) as a RecordRef object. The [OPEN Method \(RecordRef\)](devenv-OPEN-Method-RecordRef.md) accepts `DATABASE::Customer` as an integer. The NUMBER method retrieves the table number and displays the name and number of the table in a message box. This example requires that you create the following variables global text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|varDatabaseName|Integer|  
|MyRecordRef|RecordRef|  
|varTableNumber|Integer|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|%1 is table %2.|  
  
```  
  
varDatabaseName := DATABASE::Customer;  
MyRecordRef.OPEN(varDatabaseName);  
varTableNumber := MyRecordRef.NUMBER;  
MESSAGE(Text000, MyRecordRef.CAPTION, varTableNumber);  
  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)