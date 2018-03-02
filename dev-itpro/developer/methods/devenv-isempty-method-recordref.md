---
title: "ISEMPTY Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: b855236a-34f2-4c4f-9f0d-f8106f5bfd55
caps.latest.revision: 9
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ISEMPTY Method (RecordRef)
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

 **True** if the record or table is empty; otherwise, **false**.  

## Remarks  
 If you have not applied filters to the record, this method determines whether the table is empty. If you have applied filters, the method determines whether the filtered set of records is empty.  

 The number of filters that you have applied to the records affects the speed of the ISEMPTY method. The fewer the number of filters, the faster the operation is performed.  

 When you are using SQL Server, this method is faster than using the [COUNT Method \(Record\)](devenv-COUNT-Method-Record.md) and then testing the result for zero.  

 This method works the same as the [ISEMPTY Method \(Record\)](devenv-ISEMPTY-Method-Record.md).  

## Example  
 The following example opens table 18, the customer table as a RecordRef variable that is named. CustomerRecref. The [ISEMPTY Method \(RECORDREF\)](devenv-ISEMPTY-Method-RecordRef.md) determines whether the table is empty. The message box displays **No** because the Customer table is not empty. **No** represents **false**. This example requires that you create the following global variable and text constant.  

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
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)
