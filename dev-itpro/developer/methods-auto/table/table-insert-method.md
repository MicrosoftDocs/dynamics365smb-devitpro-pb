---
title: "Insert Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Insert Method
Inserts a record into a table.

## Syntax
```
[Ok := ]  Table.Insert([RunTrigger: Boolean])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If this parameter is true, the code in the OnInsert Trigger is executed. If this parameter is false, the code in the OnInsert trigger is not executed. The default value is false.
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)