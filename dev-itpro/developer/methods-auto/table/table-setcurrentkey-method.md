---
title: "SetCurrentKey Method"
ms.author: solsen
ms.custom: na
ms.date: 11/06/2018
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
# SetCurrentKey Method
Selects a key for a table.

## Syntax
```
[Ok := ]  Table.SetCurrentKey(Field1: Any, [Field2: Any,...])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field1*  
&emsp;Type: [Any](../any/any-data-type.md)  
  
*Field2*  
&emsp;Type: [Any](../any/any-data-type.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
**SetCurrentKey** is used to sort the contents of the table on the provided fields and select the key that contains the specified fields if possible. This key becomes the current key and is used by the [FIND Method \(Record\)](../../methods/devenv-find-method-record.md), the [NEXT Method \(Record\)](../../methods/devenv-next-method-record.md), and other methods until another key is selected. Until this method is called, the table's primary key is used as the current key.  
  
In [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], the [CALCFIELDS Method \(Record\)](../../methods/devenv-calcfields-method-record.md), [CALCSUMS Method \(Record\)](../../methods/devenv-calcsums-method-record.md) and [CALCSUM Method \(FieldRef\)](../../methods/devenv-calcsum-method-fieldref.md) do not require that a SIFT index is defined for the fields that are being calculated. Therefore, you do not need to define keys solely for SIFT indexes. Fewer SIFT indexes and fewer keys can improve performance. In [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], an index is not required to support a certain sorting, but sorting without an index could lead to bad performance if a search returns a large result set, which would then have to be sorted before the first row is returned.  
  
Use the following guidelines when you use **SetCurrentKey**:  
  
-   Inactive fields are ignored. Only active keys are scanned.  
  
-   When searching for a key, [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] selects the first occurrence of the specified field\(s\). This means the following:  
  
    -   If you specify only one field as a parameter when you call **SetCurrentKey**, then the key that is actually selected may consist of more than one field.  
  
    -   If the field that you specify is the first component of several keys, then the key that is selected is the first one that matches, which may not be the key that you expect.  
  
-   If no keys can be found that include the field\(s\) that you specify and sorting on a given field\(s\) cannot be set, then a runtime error occurs unless you test the Boolean value of **SetCurrentKey** in your code.  
  
-   If you do test the return value, then you must decide what to do if the method returns **false**, because without a runtime error, the application continues to run even though no key was found and may fail later.  
  
-   Use only the necessary key fields in a call to **SetCurrentKey**. If the definition of the key includes the fields that you specify in the call to **SetCurrentKey** in the order given, then you can change the definition of the key without having to change any code. If the table order is not important, then consider one of the following:  
  
    -   If the expected result set is small, then do not call **SetCurrentKey** at all. The result will be sorted according to the smallest possible key, which is the primary key.  
  
    -   If the expected result set is large, then call **SetCurrentKey** with a field set that matches subsequent calls to **SETRANGE** and **SETFILTER** methods. This way, there is less risk that extra sorting of the large result must be done.  
  
## Example  
This example shows how to use the **SetCurrentKey** method without using a return value. This statement applies sorting on the Name field and selects the Name key for the **Customer** table if possible. If sorting cannot be applied, a runtime error occurs.
  
```  
procedure SortingOnName()
var 
  MyCustomer: Record Customer;
begin
  MyCustomer.SetCurrentKey(Name);  
end
```  
 

## Example  
This example shows how to use the **SetCurrentKey** method with a return value. By including a return value, you can avoid a runtime error if sorting could not be applied.
 
```  
procedure ReturnValue()
var 
  MyCustomer: Record Customer;
  Text000: TextConst ENU='The key was successfully selected.';
  Text001: TextConst ENU='The key could not be found.';
begin
  MyCustomer.SetCurrentKey(Name);

if MyCustomer.SetCurrentKey(Name) then  
  Message(Text000)  
else  
  Message(Text001);
end  
```  


## Example
The following code exemplifies how to check if a key was set.

 ```
procedure KeyIsSet()
var 
  SalesInvoiceHeader: Record "Sales Invoice Header";
  SalesInvoiceHeaderRef: RecordRef;
begin
  SalesInvoiceHeader.SetCurrentKey("Document Date"); 
// RecordRef data type can be used to check if key was set
SalesInvoiceHeaderRef.GETTABLE(SalesInvoiceHeader); 

if SalesInvoiceHeaderRef.CurrentKeyIndex = -1 then
  Message('Key is NOT set, but sorting is.')
else
  Message('Both key and sorting are set.'); 
end
 ```

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)