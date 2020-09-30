---
title: "FieldRef.GetFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# FieldRef.GetFilter Method
Gets the filter that is currently applied to the field referred to by FieldRef.


## Syntax
```
String :=   FieldRef.GetFilter()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 See also [GETFILTERS Method \(RecordRef\)](../../methods-auto/recordref/recordref-getfilters-method.md), [SETFILTER Method \(FieldRef\)](../../methods-auto/fieldref/fieldref-setfilter-method.md), and [SETRANGE Method \(FieldRef\)](../../methods-auto/fieldref/fieldref-setrange-method.md).  
  
 This method is like the [GETFILTER Method \(Record\)](../../methods-auto/record/record-getfilter-method.md).  
  
## Example  
 The following example opens the Customer table as a RecordRef variable that is named CustomerRecref. The [FIELD Method \(RecordRef\)](../../methods-auto/recordref/recordref-field-method.md) creates a FieldRef for the first field \(No.\) and stores the reference in the MyFieldRef variable. The GETFILTER method retrieves the filters that are set on the No. field and stores the value in the Filters1 variable. The value of any filter that is set is displayed in a message box. The [SETFILTER Method \(FieldRef\)](../../methods-auto/fieldref/fieldref-setfilter-method.md) sets the filter that selects records from 10000 to 40000 in the No. field. The GETFILTER method retrieves and stores the filter in the Filter2 variable and displays it in a message. The value in the Filter1 variable is blank because no filter is set. The value in Filter2 is 10000..40000 because of the filter that is set by the [SETFILTER Method \(FieldRef\)](../../methods-auto/fieldref/fieldref-setfilter-method.md). 
 
 ```
var
    MyFieldRef: FieldRef;
    CustomerRecref: RecordRef;
    Filters1: Text;
    Filters2: Text;
    Text000: Label 'Filter before filters set: %1.';
    Text001: Label 'Filter after filters set: %1.';
begin
    CustomerRecref.OPEN(DATABASE::Customer);  
    MyFieldRef := CustomerRecref.FIELD(1);  
    Filters1 := MyFieldRef.GETFILTER;  
    MESSAGE(Text000, Filters1);  
    MyFieldRef.SETFILTER('10000..40000');  
    Filters2 := MyFieldRef.GETFILTER;  
    MESSAGE(Text001, Filters2);  
end;
  
```  


## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)