---
title: "SETAUTOCALCFIELDS Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d0f9ef06-a608-40f2-ab4a-498d1f1528d4
caps.latest.revision: 10
manager: edupont
---
# SETAUTOCALCFIELDS Function (Record)
Sets the FlowFields that you specify to be automatically calculated when the record is retrieved from the database.  
  
## Syntax  
  
```  
[OK :=] Record.SETAUTOCALCFIELDS([Field1,Field2, …])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record in the table for which you want to automatically calculate FlowFields.  
  
 *Field1*, *Field2*, …  
 Type: Field  
  
 The FlowFields that you want to automatically calculate. Each field must be defined as a FlowField and must belong to the same record variable.  
  
 To remove the automatic calculation setting on a field that you previously set with the **SETAUTOCALCFIELDS** function, you must call **SETAUTOCALCFIELDS** without parameters.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record was set successfully; otherwise, **false**. If you omit this optional return value and if the record cannot be set to automatically calculate, then a run-time error occurs. If you include a return value, then you must handle any errors.  
  
## Remarks  
 FlowFields are virtual fields. The values in these fields are not saved in the table. This means that you must use either the [CALCFIELDS Function \(Record\)](CALCFIELDS-Function--Record-.md)or the **SETAUTOCALCFIELDS** function to update them. For example, if you retrieve records using the [FIND Function \(Record\)](FIND-Function--Record-.md) and [NEXT Function \(Record\)](NEXT-Function--Record-.md), then the FlowFields in those records are set to zero \(0\). However, if you call **SETAUTOCALCFIELDS** before you retrieve the records, then when you call **FIND** and **NEXT**, the FlowFields values are automatically calculated.  
  
 When a FlowField is a direct source expression on a page or a report, the calculation will be performed automatically.  
  
 You can improve performance by using the **SETAUTOCALCFIELDS** function before looping through records with FlowFields instead of calling the **CALCFIELDS** function on each record in the loop.  
  
 The automatic calculation setting applies to the fields that you specify until the Record parameter goes out of scope or until you call **SETAUTOCALCFIELDS** without any parameters.  
  
 The fields that you specify in the *Field* parameters are added to any fields that you previously set with the **SETAUTOCALCFIELDS** function. Previously set fields are not overwritten when you call **SETAUTOCALCFIELDS** with different parameters. To clear the list of fields that are automatically calculated, call the **SETAUTOCALCFIELDS** function without parameters.  
  
 If you assign a record to another record variable, then the automatic calculation setting on FlowFields is not transferred with the record.  
  
 If you copy a record by using the [COPY Function \(Record\)](COPY-Function--Record-.md), then the automatic calculation setting on FlowFields is copied with the record.  
  
 The Rec and xRec system variables are set to always automatically calculate FlowFields. If you call the **NEXT** function on Rec or xRec, then FlowFields in the record are automatically calculated.  
  
## Example  
 The first six lines of this example show how to use the CALCFIELDS function. The last lines of this example show how you can use the **SETAUTOCALCFIELDS** function instead of the **CALCFIELDS** function to improve performance.  
  
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
 [FieldClass Property](FieldClass-Property.md)   
 [FlowFields](FlowFields.md)