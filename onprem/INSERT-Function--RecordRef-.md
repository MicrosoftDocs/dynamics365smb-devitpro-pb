---
title: "INSERT Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 47a1d40b-d9ea-4cd3-aca1-46cb8431d07b
caps.latest.revision: 15
---
# INSERT Function (RecordRef)
Inserts a record into a table.  
  
## Syntax  
  
```  
  
[Ok :=] RecordRef.INSERT([RunTrigger])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the record that you want to insert.  
  
> [!WARNING]  
>  The record cannot be from table 2000000001, the Object table or table 2000000006, the Company table.  
  
 *RunTrigger*  
 Type: Boolean  
  
 Specifies whether to run the C/AL code in the [OnInsert Trigger](OnInsert-Trigger.md).  
  
 If this parameter is **true**, the code on the **OnInsert** trigger will be executed.  
  
 If this parameter is **false**, the code on the **OnInsert** trigger will not be exectued.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record was inserted; otherwise, **false**.  
  
 If you omit this optional return value and if the record cannot be inserted, a run-time error occurs. If you include the return value, you must handle any errors.  
  
## Remarks  
 Records are uniquely identified by the values in primary key fields. The Database Management System \(DBMS\) checks the primary key for the table before it inserts a new record.  
  
 If the table contains an auto-increment field, the auto-increment feature is used if the record contains a zero value in that field. The auto-increment feature enters the new value into the field as part of the insert.  
  
 If the auto-increment field contains a non-zero value, that value is inserted into the table and the auto-increment feature is not used. If the value in the auto-increment field is greater than the last auto-increment value in the table, the next auto-increment value that is entered into the table will be greater than the value in the field that you just inserted. If the value in the auto-increment field already exists in the table, a run-time error occurs.  
  
 This function works the same as the [INSERT Function \(Record\)](INSERT-Function--Record-.md).  
  
## Example  
 The following example opens a table 18 \(Customer\) with a RecordRef variable that is named CustomerRecref. The [FIELD Function \(RecordRef\)](FIELD-Function--RecordRef-.md) creates a FieldRef variable that is named MyFieldRef for the field. The [INIT Function \(RecordRef\)](INIT-Function--RecordRef-.md) initializes the values in the fields by using default values and then the INSERT function inserts a new record. The new record is 1120. This is the primary key for the new record.  
  
> [!NOTE]  
>  In this example, the INIT function is called before the primary key is assigned a value. The INIT function does not initialize primary key fields. Therefore calling the [INIT Function \(RecordRef\)](INIT-Function--RecordRef-.md) before or after you assign values to the primary key field does not make any difference.  
  
 This example requires that you create the following variables and text constants in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The value of the field after you insert the record is %1.|  
  
```  
CustomerRecref.OPEN(18);  
MyFieldRef := CustomerRecref.FIELD(1);  
CustomerRecref.INIT;  
MyFieldRef.VALUE := '1120';  
CustomerRecref.INSERT;  
MESSAGE(‘%1’, MyFieldRef.VALUE);  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)