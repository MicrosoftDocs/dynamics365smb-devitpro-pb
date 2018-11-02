---
title: "SetAutoCalcFields Method"
ms.author: solsen
ms.custom: na
ms.date: 11/02/2018
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
# SetAutoCalcFields Method
Sets the FlowFields that you specify to be automatically calculated when the record is retrieved from the database.

## Syntax
```
[Ok := ]  Table.SetAutoCalcFields([Field1: Any,...])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field1*  
&emsp;Type: [Any](../any/any-data-type.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 FlowFields are virtual fields. The values in these fields are not saved in the table. This means that you must use either the [CALCFIELDS Method \(Record\)](../../methods/devenv-calcfields-method-record.md)or the **SETAUTOCALCFIELDS** method to update them. For example, if you retrieve records using the [FIND Method \(Record\)](../../methods/devenv-find-method-record.md) and [NEXT Method \(Record\)](../../methods/devenv-next-method-record.md), then the FlowFields in those records are set to zero \(0\). However, if you call **SETAUTOCALCFIELDS** before you retrieve the records, then when you call **FIND** and **NEXT**, the FlowFields values are automatically calculated.  
  
 When a FlowField is a direct source expression on a page or a report, the calculation will be performed automatically.  
  
 You can improve performance by using the **SETAUTOCALCFIELDS** method before looping through records with FlowFields instead of calling the **CALCFIELDS** method on each record in the loop.  
  
 The automatic calculation setting applies to the fields that you specify until the Record parameter goes out of scope or until you call **SETAUTOCALCFIELDS** without any parameters.  
  
 The fields that you specify in the *Field* parameters are added to any fields that you previously set with the **SETAUTOCALCFIELDS** method. Previously set fields are not overwritten when you call **SETAUTOCALCFIELDS** with different parameters. To clear the list of fields that are automatically calculated, call the **SETAUTOCALCFIELDS** method without parameters.  
  
 If you assign a record to another record variable, then the automatic calculation setting on FlowFields is not transferred with the record.  
  
 If you copy a record by using the [COPY Method \(Record\)](../../methods/devenv-copy-method-record.md), then the automatic calculation setting on FlowFields is copied with the record.  
  
 The Rec and xRec system variables are set to always automatically calculate FlowFields. If you call the **NEXT** method on Rec or xRec, then FlowFields in the record are automatically calculated.  
  
## Example  
 The first six lines of this example show how to use the CALCFIELDS method. The last lines of this example show how you can use the **SETAUTOCALCFIELDS** method instead of the **CALCFIELDS** method to improve performance.  
  
 This example requires that you create the following variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Customer|Record|Customer|  
  
```  
// Using CALCFIELDS  
IF (Customer.FIND(’-’)=true) THEN  
  REPEAT  
    Customer.CALCFIELDS(Balance,"Net Change");  
    … // Do some additional processing.  
  UNTIL (Customer.NEXT=0)  
  
// Using SETAUTOCALCFIELDS  
Customer.SETAUTOCALCFIELDS(Balance,"Net Change");  
IF (Customer.FIND(’-’)=true) THEN  
  REPEAT  
    // Customer.Balance and Customer."Net Change" have been auto calculated.  
    … //Do some additional processing.  
  
  UNTIL (Customer.NEXT=0)  
  
```  
  
## Example  
 The following example shows how to add fields to the list of automatically calculated FlowFields and how to clear the list of automatically calculated FlowFields  
  
 This example requires that you create the following variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Customer|Record|Customer|  
  
```  
Customer.SETAUTOCALCFIELDS(Balance);  
Customer.SETAUTOCALCFIELDS("Net Change");  
// The previous lines are equivalent to the following:  
Customer.SETAUTOCALCFIELDS(Balance,"Net Change");  
// To clear the list of automatically calculated FlowFields so that no fields are calculated automatically, use the following code.  
Customer.SETAUTOCALCFIELDS();  
```  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)