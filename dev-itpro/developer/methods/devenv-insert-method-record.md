---
title: "INSERT Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 57b23ba2-2d1d-458d-8bb7-94fc156b1874
caps.latest.revision: 12
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# INSERT Method (Record)
Inserts a record into a table.  
  
## Syntax  
  
```  
  
[Ok :=] Record.INSERT([RunTrigger])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that you want to insert.  
  
> [!WARNING]  
>  The record cannot be from table 2000000001, the **Object** table or table 2000000006, the **Company** table.  
  
 *RunTrigger*  
 Type: Boolean  
  
 If this parameter is **true**, the code in the [OnInsert Trigger](../triggers/devenv-OnInsert-Trigger.md) is executed. If this parameter is **false**, the code in the **OnInsert** trigger is not executed. The default value is **false**.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **True** if the record was inserted; otherwise, **false**.  
  
 If you omit this optional return value and if the record cannot be inserted, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## Remarks  
 Records are uniquely identified by the values in primary key fields. The Database Management System \(DBMS\) checks the primary key for the table before it inserts a new record.  
  
 If the table contains an auto-increment field, the auto-increment feature is used if the record contains a zero value in that field. The auto-increment feature enters the new value into the field as part of the insert.  
  
 If the auto-increment field contains a non-zero value, that value is inserted into the table and the auto-increment feature is not used. If the value in the auto-increment field is greater than the last auto-increment value in the table, then the next auto-increment value that is entered into the table will be greater than the value in the field that you just inserted. If the value in the auto-increment field already occurs in the table, then a run-time error occurs.  
  
## Example  
 This example shows how to use the **INSERT** method without a return value.  
  
```  
Customer.INIT  
Customer."No." := '1120';  
Customer.INSERT;  
```  
  
 If customer 1120 already exists, then a run-time error occurs.  
  
## Example  
 This example requires that you create the following global variable and text constants.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|Customer no: %1 inserted.|  
|Text001|Customer no: %1 already exists.|  
  
```  
CustomerRec.INIT  
CustomerRec."No." := '1120';  
If CustomerRec.INSERT THEN  
  MESSAGE(Text000, CustomerRec."No.")  
ELSE  
  MESSAGE(Text001, CustomerRec."No.");  
```  
  
 No run-time error occurs if customer 1120 already exists.  
  
## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)