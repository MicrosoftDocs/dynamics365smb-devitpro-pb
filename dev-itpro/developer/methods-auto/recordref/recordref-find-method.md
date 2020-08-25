---
title: "Find Method"
ms.author: solsen
ms.custom: na
ms.date: 08/12/2020
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
# Find Method
Finds a record in a table based on the values stored in the key fields.


## Syntax
```
[Ok := ]  RecordRef.Find([Which: String])
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*Which*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies how to perform the search. The table will be searched until the record is found or there are no more records. Each character in the string can be present only one time. You can use the following characters:
-   =  search for a record that equals the key values (default)
-   >  search for a record that is larger than the key values
-   <  search for a record that is less than the key values
-   +  search for the last record in the table (+ can only be used alone)
-   -  search for the first record in the table (- can only be used alone)
You can combine the '=', '>', and '<' characters. If this parameter contains '=', '>', or '<', then you must assign value to all fields of the current and primary keys before you call FIND.
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 FIND retrieves the first record that meets the conditions set by the *Which* parameter and the filters associated with the record. The search path reflects the sort order defined by the current key. If the current key is not the primary key, there is a chance that several records might have the same values in current key fields. If this occurs, the sort order defined by the primary key is used as the search path.  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable named CustomerRecref. The value for the field 1 \(No.\) is set to a specified record. In this example, the field is set to record 40000. The code uses the FIND method to find the record that matches. 40000 in the table. If the record is found, the number, name, address and city of the customer are displayed in message boxes. The values in the fields are retrieved by using the [FIELD Method \(RecordRef\)](recordref-field-method.md). 
 
```  
var
    CustomerRecref: RecordRef;
    MyFieldRef: FieldRef;
    varCustomerNo: Code;
    Text000: Label 'The customer was found.\\';
    Text001: Label 'Customer No. %1 is:\\%2';
    Text002: Label 'Sorry, that customer could not be found.';
begin
    varCustomerNo := '40000';  
    CustomerRecref.OPEN(18);  
    MyFieldRef := CustomerRecref.FIELD(1);  
    MyFieldRef.VALUE := varCustomerNo;  
    if CustomerRecref.FIND('=') then begin  
      MESSAGE(Text000 + Text001,  CustomerRecref.FIELD(1), CustomerRecref.FIELD(2));  
      MESSAGE('Address: %1, %2',  CustomerRecref.FIELD(5),  CustomerRecref.FIELD(7));  
    end else
      MESSAGE(Text002);  
end;
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)