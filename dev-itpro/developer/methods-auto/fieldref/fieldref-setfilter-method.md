---
title: "FieldRef.SetFilter Method"
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
# FieldRef.SetFilter Method
> **Version**: _Available from runtime version 1.0._

Assigns a filter to a field that you specify.


## Syntax
```
 FieldRef.SetFilter(String: String [, Value: Any,...])
```
## Parameters
*FieldRef*
&emsp;Type: [FieldRef](fieldref-data-type.md)
An instance of the [FieldRef](fieldref-data-type.md) data type.

*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The filter expression. A valid expression consists of alphanumeric characters and one or more of the following operators: \<, \>, , &, &#124;, and =. You can use replacement fields (%1, %2, and so on) to insert values at run time.  
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
Replacement values to insert in replacement fields in the filter expression. The data type of Value must match the type of FieldRef.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If the method is called with a field for which a filter already exists, the filter is removed before a new one is set. You can construct filters using the following operators.  
  
|Operator|Description|  
|--------------|-----------------|  
|..|Range|  
|&|And|  
|&#124;|Or|  
|\<|Less than|  
|\<=|Less than or equal to|  
|>|Greater than|  
|>=|Greater than or equal to|  
|\<>|Different from|  
|\*|Forms a part of value|  
|@|Case-insensitive|  
  
 This method is like the [SETFILTER Method \(Record\)](../../methods/devenv-setfilter-method-record.md) method.  
  
## Example  
 The following example opens the Customer table as a RecordRef variable that is named CustomerRecref. The [FIELD Method \(RecordRef\)](../../methods/devenv-field-method-recordref.md) creates a FieldRef for the first field \(No.\) and stores the reference in the MyFieldRef variable. The [GETFILTER Method \(FieldRef\)](../../methods/devenv-getfilter-method-fieldref.md) retrieves the filters that are set on the No. field and stores the value in the Filter1 variable. The value of any filter that is set is displayed in a message box. The SETFILTER method sets a filter that selects records from 10000 to 40000 in the No. field. The [GETFILTER Method \(FieldRef\)](../../methods/devenv-getfilter-method-fieldref.md) retrieves and stores the new filter in the Filter2 variable and displays it in a message. The value in the Filter1 variable is blank because no filter is set. The value in Filter2 is 10000..40000 because of the filter that is set by the SETFILTER method.
 
```
var
    MyFieldRef: FieldRef;
    CustomerRecref: RecordRef;
    Filter1: Text;
    Filter3: Text;
    Text000: Label 'Filter before filters set: %1.';
    Text001: Label 'Filter after filters set: %1.';
begin
    CustomerRecref.OPEN(DATABASE::Customer);  
    MyFieldRef := CustomerRecref.FIELD(1);  
    Filter1 := MyFieldRef.GETFILTER;  
    MESSAGE(Text000, Filter1);  
    MyFieldRef.SETFILTER('10000..40000');  
    Filter2 := MyFieldRef.GETFILTER;  
    MESSAGE(Text001, Filter2);  
end;
```  
  
## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)