---
title: "RecordRef.Ascending Method"
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
# RecordRef.Ascending Method
Changes or checks the order in which a search through the table that is referred to by RecordRef will be performed.


## Syntax
```
[IsAscending := ]  RecordRef.Ascending([SetAscending: Boolean])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*SetAscending*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If this parameter is true, it will search in ascending order. If this parameter is false, it will search in descending order. If you do not specify this parameter, it will check the search order.  


## Return Value
*IsAscending*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies the order in which a search will be performed.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method works just like the [ASCENDING Method \(Record\)](../../methods/devenv-ascending-method-record.md).  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The [SETVIEW Method (RecordRef)](recordref-setview-method.md) sets a filter that includes sorting the data in ascending order. The ASCENDING method then checks whether the sort order is ascending, stores the return value in the IsAscending variable and displays **True** in a message box. 
    
  
```
var
    IsAscending: Boolean;
    CustomerRecref: RecordRef;
    Text000: Label 'Is the sort order ascending?  %1';
begin
    CustomerRecref.OPEN(18);  
    CustomerRecref.SETVIEW('SORTING(Name) ORDER(Ascending) WHERE(No.=CONST(10000..20000))');  
    IsAscending := CustomerRecref.ASCENDING;  
    MESSAGE(Text000, IsAscending);  
end;
```  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The [SETVIEW Method (RecordRef)](recordref-setview-method.md) sets a filter that includes sorting the data in descending order. The ASCENDING method then checks whether the sort order is ascending, stores the return value in the IsAscending variable and displays **False** in a message box because the sort order is descending. The ASCENDING method changes the sort order to ascending by setting the *SetAscending* parameter to **true**. The ASCENDING method checks the sort order again. This time **True** is displayed.  
  
```  
CustomerRecref.OPEN(18);  
CustomerRecref.SETVIEW('SORTING(Name) ORDER(Descending) WHERE(No.=CONST(10000..20000))');  
IsAscending := CustomerRecref.ASCENDING;  
MESSAGE(Text000, IsAscending);  
IsAscending := CustomerRecref.ASCENDING(TRUE);  
MESSAGE(Text000, IsAscending);  
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)