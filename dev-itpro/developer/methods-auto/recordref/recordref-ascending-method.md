---
title: "RecordRef.Ascending Method"
description: "Changes or checks the order in which a search through the table that is referred to by RecordRef will be performed."
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
# RecordRef.Ascending Method
> **Version**: _Available or changed with runtime version 1.0._

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

*[Optional] SetAscending*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If this parameter is true, it will search in ascending order. If this parameter is false, it will search in descending order. If you do not specify this parameter, it will check the search order.  


## Return Value
*[Optional] IsAscending*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies the order in which a search will be performed.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method works just like the [Ascending Method \(Record\)](../library.md).  
  
## Example 1

 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The [SetView Method (RecordRef)](recordref-setview-method.md) sets a filter that includes sorting the data in ascending order. The Ascending method then checks whether the sort order is ascending, stores the return value in the IsAscending variable and displays **True** in a message box. 
    
  
```al
var
    IsAscending: Boolean;
    CustomerRecref: RecordRef;
    Text000: Label 'Is the sort order ascending?  %1';
begin
    CustomerRecref.Open(18);  
    CustomerRecref.SetView('Sorting(Name) Order(Ascending) Where(No.=Const(10000..20000))');  
    IsAscending := CustomerRecref.Ascending;  
    Message(Text000, IsAscending);  
end;
```  
  
## Example 2

 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The [SetView Method (RecordRef)](recordref-setview-method.md) sets a filter that includes sorting the data in descending order. The Ascending method then checks whether the sort order is ascending, stores the return value in the IsAscending variable and displays **False** in a message box because the sort order is descending. The Ascending method changes the sort order to ascending by setting the *SetAscending* parameter to **true**. The Ascending method checks the sort order again. This time **True** is displayed.  
  
```al
CustomerRecref.Open(18);  
CustomerRecref.SetView('Sorting(Name) Order(Descending) Where(No.=Const(10000..20000))');  
IsAscending := CustomerRecref.Ascending;  
Message(Text000, IsAscending);  
IsAscending := CustomerRecref.Ascending(True);  
Message(Text000, IsAscending);  
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)