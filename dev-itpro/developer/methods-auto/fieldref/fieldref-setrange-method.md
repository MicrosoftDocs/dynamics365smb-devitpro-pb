---
title: "FieldRef.SetRange Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# FieldRef.SetRange Method
Sets a simple filter on a field, such as a single range or a single value.


## Syntax
```
 FieldRef.SetRange([FromValue: Any] [, ToValue: Any])
```
## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

*FromValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The lower limit of the range. The data type of FromValue must match the data type of the field referred to by FieldRef.
        
*ToValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The upper limit of the range. If you omit this parameter, the FromValue you specified is used. The data type of ToValue must match the data type of the field referred to by FieldRef.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks  
The SETRANGE method provides a quick way to set a simple filter on a field.  If you call this method by using a field that already has a filter, that filter is removed before the new filter is set.  
  
If you omit all of the optional parameters, all filters set for that field are removed. The SETRANGE method fails if no field is selected.  
  
 This method is like the [SETRANGE Method \(Record\)](../../methods-auto/record/record-setrange-method.md) method.  
  
## Example  
 The following example opens the Customer table as a RecordRef object, creates a reference to the first \(No.\) field, and stores the reference in the MyFieldRef variable. The SETRANGE method sets a filter that selects all records from 10000 to 40000 in the No. field. The [FIND Method \(RecordRef\)](../../methods-auto/recordref/recordref-find-method.md) searches and selects the first record in the filter and counts the number of records that are found. The number of records is stored in the Count variable. The process is repeated by looping through all the records in the filter until no more records are found. The number of records that are found in the range is stored in the Count variable and displayed in a message box. 
 
 ```
var
    MyFieldRef: FieldRef;
    CustomerRecref: RecordRef;
    Count: Integer;
    Text000: Label '%1 records were retrieved.';
begin  
    CustomerRecref.OPEN(DATABASE::Customer);  
    MyFieldRef := CustomerRecref.FIELD(1);  
    MyFieldRef.SETRANGE('10000' , '40000');  
    Count := 0;  
    if CustomerRecref.FIND('-') then  
      repeat  
        Count := Count + 1;  
      until CustomerRecref.NEXT = 0;  
    MESSAGE(Text000 , Count);  
end;
```  
  
## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)