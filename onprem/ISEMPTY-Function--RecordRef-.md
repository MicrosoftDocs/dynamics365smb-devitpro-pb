---
title: "ISEMPTY Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b855236a-34f2-4c4f-9f0d-f8106f5bfd55
caps.latest.revision: 9
---
# ISEMPTY Function (RecordRef)
Determines whether any records exist in a filtered set of records in a table.  
  
## Syntax  
  
```  
  
Empty := RecordRef.ISEMPTY  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef of a record that refers to a table \(possibly with filters\).  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record or table is empty; otherwise, **false**.  
  
## Remarks  
 If you have not applied filters to the record, this function determines whether the table is empty. If you have applied filters, the function determines whether the filtered set of records is empty.  
  
 The number of filters that you have applied to the records affects the speed of the ISEMPTY function. The fewer the number of filters, the faster the operation is performed.  
  
 When you are using SQL Server, this function is faster than using the [COUNT Function \(Record\)](COUNT-Function--Record-.md) and then testing the result for zero.  
  
 This function works the same as the [ISEMPTY Function \(Record\)](ISEMPTY-Function--Record-.md).  
  
## Example  
 The following example opens table 18, the customer table as a RecordRef variable that is named. CustomerRecref. The [ISEMPTY Function \(RECORDREF\)](ISEMPTY-Function--RecordRef-.md) determines whether the table is empty. The message box displays **No** because the Customer table is not empty. **No** represents **false**. This example requires that you create the following variable text constant in the **C/AL Global** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Is the table empty? %1.|  
  
```  
  
CustomerRecref.OPEN(18);  
IsEmpty := CustomerRecref.ISEMPTY;  
MESSAGE(Text000, IsEmpty);  
```  
  
 If you open table 78 \(Printer Selection\), the message will display **Yes** because the table is empty.  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)