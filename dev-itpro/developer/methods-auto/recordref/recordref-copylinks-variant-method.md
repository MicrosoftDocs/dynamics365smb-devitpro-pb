---
title: "RecordRef.CopyLinks Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.CopyLinks Method
> **Version**: _Available from runtime version 3.0._

Copies all the links from a particular record.


## Syntax
```
 RecordRef.CopyLinks(FromRecordOrRecordRef: Variant)
```
## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

*FromRecordOrRecordRef*  
&emsp;Type: [Variant](../variant/variant-data-type.md)  
Specifies the record from which you want to copy links.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 Use this method to copy all the links from a specified record and paste the links to the current record.  

 The link can be a link to a Web site, a file stored on the local or on a remote computer, or a link to a page in your application.  

## Example  
 The following example copies all links from a source record that is named VendorRecord to the currently open record in the Customer table. The source record is record 10000 from the Vendor table. The code opens the Customer table as a RecordRef variable that is named CustomerRecref. The [Field Method \(RecordRef\)](recordref-field-method.md) creates a FieldRef variable that is named MyFieldRef for field 1 \(No.\) in the Customer table. The [SETRANGE Method \(FieldRef\)](../fieldref/fieldref-setrange-method.md) selects records in the range 20000 to 40000 from the Customer table and record 10000 from the Vendor table. The [Find Method \(RecordRef\)](recordref-find-method.md) searches the Customer table for the records in the filtered range. If the record that meets the filter criteria is found, the links from the Vendor record No. 10000 are copied to the customer records in the range 30000 to 40000. The record id of the record to which the links were copied is displayed in a message box. The process is repeated until there is no more record in the range. The [CLOSE Method \(RecordRef\)](recordref-close-method.md) closes the table.


```  
var
    MyFieldRef: FieldRef;
    CustomerRecref: RecordRef;
    VendorRecord: Record Vendor;
    Count: Integer;
    Text000: Label 'The links have been copied to %1';
begin
    CustomerRecref.Open(DATABASE::Customer);  
    MyFieldRef := CustomerRecref.Field(1);  
    MyFieldRef.SETRANGE('30000' , '40000');  
    VendorRecord.SETRANGE("No.", '10000');  
    Count := 0;  
    ifCustomerRecref.Find('-') then  
      repeat  
        Count := Count + 1;  
        CustomerRecref.COPYLINKS(VendorRecord);  
        Message(Text000, CustomerRecref.RECORDID);  
      until CustomerRecref.NEXT = 0;  
    CustomerRecref.CLOSE;  
end;
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)