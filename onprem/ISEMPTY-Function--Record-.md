---
title: "ISEMPTY Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cec48300-a0c5-4e44-8792-f07dc4dc7e37
caps.latest.revision: 14
---
# ISEMPTY Function (Record)
Determines whether a table or a filtered set of records is empty.  
  
## Syntax  
  
```  
  
Empty := Record.ISEMPTY  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The filtered set of records that you want to check.  
  
## Property Value/Return Value  
 Type: Boolean  
  
## Remarks  
 **true** if the record or table is empty; otherwise, **false**. If you have applied filters, the function determines whether the filtered set of records is empty. The number of filters that you have applied to the records affects the speed of the **ISEMPTY** function. The fewer the number of filters, the faster the operation is performed.  
  
 When you are using SQL Server, this function is faster than using the [COUNT Function \(Record\)](COUNT-Function--Record-.md) and then testing the result for zero.  
  
## Example  
 The following code example uses a record from the **Customer** table to determine whether the table has any records. The **ISEMPTY** function uses the CustomerRec variable to determine whether the **Customer** table is empty, stores the return value in the varIsEmpty variable, and displays the value in a message box. The value of the varIsEmpty variable is **No** because the **Customer** table has records \(that is, not empty\). The function then uses the PrinterSelec variable, which is a record from the **Printer Selection** table to check whether the **Printer Selection** table has any records and stores the return value in the varIsEmpty variable. The value of **Yes** is displayed in the message box because the **Printer Selection** table has no records \(that is, empty\). This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|Data Type|Subtype|  
|-------------------|---------------|-------------|  
|CustomerRec|Record|Customer|  
|PrinterSelec|Record|Printer Selection|  
|varIsEmpty|Boolean|Not applicable|  
  
```  
varIsEmpty := CustomerRec.ISEMPTY;  
MESSAGE('Is the Customer table empty?: %1', varIsEmpty);  
varIsEmpty := PrinterSelec.ISEMPTY;  
MESSAGE('Is the Printer Selection table empty?: %1', varIsEmpty);  
```  
  
## See Also  
 [Record Data Type](Record-Data-Type.md)