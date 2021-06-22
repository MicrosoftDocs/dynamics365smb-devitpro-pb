---
title: "FieldRef.CalcField Method"
description: "Updates FlowFields in a record."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldRef.CalcField Method
> **Version**: _Available or changed with runtime version 1.0._

Updates FlowFields in a record.


## Syntax
```
[Ok := ]  FieldRef.CalcField()
```

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

FlowFields are virtual fields. The values in these fields are not saved in the table. This means that you must use the CalcFields method to update them. For example, if you retrieve a record using the [Find Method \(RecordRef\)](../../methods-auto/recordref/recordref-find-method.md) and [Next Method \(RecordRef\)](../../methods-auto/recordref/recordref-next-method.md) methods, the FlowFields in those records are set to zero \(0\). Then, you can call `FieldRef.CalcField`, to calculate the value in one of the FlowFields.  

When a FlowField is a direct source expression of a control on a page or a report, the calculation is automatically performed.  You can also use the CALCFieldS method to calculate binary large objects \(BLOBs\). For more information, see [BLOB Data Type](../library.md).  

This method is similar to the [CalcFields Method \(Record\)](../../methods-auto/record/record-calcfields-method.md) method.  

## Example

The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustRecordref. The [Find Method \(RecordRef\)](../../methods-auto/recordref/recordref-find-method.md) selects the first record in the table and then loops through all the records until no records could be found. For each record, the [Field Method \(RecordRef\)](../../methods-auto/recordref/recordref-field-method.md) creates a FieldRef variable that is named MyFieldref for the Balance Due field \(field 66\), which is a flow field. The CalcField method is called to update the field before the customer ID and the balance due are displayed. Otherwise, the balance due for every record will be set to 0. 
 
```al
var
    CustRecordref: RecordRef;
    MyFieldRef: FieldRef;
    Count: Integer;
    Text000: Label '%1: \\Balance Due: %2.';
begin
    Count := 0;  
    CustRecordref.Open(18);  
    if CustRecordref.Find('-') then  
      repeat  
        MyFieldRef := CustRecordref.Field(66);  
        MyFieldRef.CalcField;  
        Message(Text000, CustRecordref.RecordId, MyFieldRef);  
        Count := Count + 1;  
      until CustRecordref.Next = 0;  
end;
```  

## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)