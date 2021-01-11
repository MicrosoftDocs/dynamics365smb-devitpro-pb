---
title: "RecordRef.Init Method"
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
# RecordRef.Init Method
> **Version**: _Available from runtime version 1.0._

Initializes a record in a table.


## Syntax
```
 RecordRef.Init()
```

## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

This method assigns default values to each field in the record, including the SystemId field. The values that are assigned in the record correspond to those defined when the table was created. If no value was assigned when the table was created, the values are assigned based on the data type, as shown in the following table.  
  
|Data type|Default value|  
|---------|-------------------|  
|BigInteger|0|  
|BigText|\<Empty>|  
|BLOB|\<Empty>|  
|Boolean|No|  
|Code|'' \(empty string\)|  
|Date|0d \(Undefined date\)|  
|DateFormula|'' \(empty string\)|  
|DateTime|0DT \(Undefined datetime\)|  
|Decimal|0.0|  
|Duration|0|  
|GUID|00000000-0000-0000-0000-000000000000|  
|Integer|0|  
|Option|0|  
|RecordID|\<Empty>|  
|TableFilter|\<Empty>|  
|Text|'' \(empty string\)|  
|Time|0T \(Undefined time\)|  
  
> [!NOTE]  
> Primary key and timestamp fields are not initialized.  
  
After the method runs, you can change the values in any or all of the fields before you call the [Insert Method (RecordRef)](recordref-insert-method.md) to enter the record in the table. Be sure that the fields that make up the primary key contain values that make the total primary key unique. If the primary key is not unique (such as the record already exists), then the record is rejected.  
  
The method works in the same way as the [INIT Method (Record)](../record/record-init-method.md).  
  
## Example  
The following example opens a table 18 (Customer) with a RecordRef variable that is named CustomerRecref. The [Field Method (RecordRef)](recordref-field-method.md) creates a FieldRef variable that is named MyFieldRef for the field. The INIT method initializes the values in the fields by using default values and then uses the [Insert Method (RecordRef)](recordref-insert-method.md) to insert a new record. The new record is 1120. This is the primary key for the new record.  
  
> [!NOTE]  
> In this example, the INIT method is called before the primary key is assigned a value. The INIT method does not initialize primary key fields. Therefore calling the INIT method before or after you assign values to the primary key field does not make any difference.  
   
```   
var
    CustomerRecref: RecordRef;
    MyFieldRef: FieldRef;
    Text000: Label 'The value of the field before initialization is %1.';
    Text001: Label 'The value of the field after you insert the record is %1.';
begin 
    CustomerRecref.Open(18);  
    MyFieldRef := CustomerRecref.Field(1);  
    CustomerRecref.INIT;  
    Message(‘%1’, MyFieldRef.Value);  
    MyFieldRef.Value := '1120';  
    CustomerRecref.Insert;  
    Message(‘%1’, MyFieldRef.Value);  
end;
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)