---
title: "RecordRef.Reset Method"
ms.author: solsen
ms.custom: na
ms.date: 12/03/2020
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
# RecordRef.Reset Method
> **Version**: _Available from runtime version 1.0._

Removes all filters, including any special filters set by the MarkedOnly method (Record), changes fields select for loading back to all, and changes the current key to the primary key. Also removes any marks on the record and clears any AL variables defined on its table definition.


## Syntax
```
 RecordRef.Reset()
```

## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If no table is selected, this method returns an error.  
  
 This method works the same as the [Reset Method \(Record\)](../../methods/devenv-reset-method-record.md).  
  
## Example  
 The following example opens the Customer \(18\) table and creates a RecordRef variable that is named RecRef. The [GetFilters Method \(RecordRef\)](recordref-getfilters-method.md) gets filters that have been applied to records in the table. The filters that are returned, if any, are stored in the Filters1 variable and displayed in message box. In this example, no filters are set so the message is blank. The [SetRecFilter Method \(RecordRef\)](recordref-setrecfilter-method.md) sets a filter on the current key of the current record that is represented by the RecRef variable. The [GetFilters Method \(RecordRef\)](recordref-getfilters-method.md) gets the filters that have been set and stores the value in the Filters2 variable. The message displays No. because the No. field is set as a filter. The Reset method removes the filter that was set. The value of the filter that is returned by the [GetFilters Method \(RecordRef\)](recordref-getfilters-method.md) after the [Reset Method \(RecordRef\)](recordref-reset-method.md) is executed is stored in the Filters3 variable. Filter3 is blank because the filter that was set by `RecRef.SetRecFilter;` is removed by the Reset method. 
   
```al
var
    RecRef: RecordRef;
    Filters1: Text;
    Filters2: Text;
    Filters3: Text;
    Text000: Label 'Filter before filter is set is: %1.';
    Text001: Label 'Filter after filter is set is: %1.';
    Text002: Label 'Filter before filter is reset is: %1.';
begin   
    RecRef.Open(Database::Customer);  
    Filters1 := RecRef.GetFilters;  
    Message(Text000, Filters1);  
    RecRef.SetRecFilter;  
    Filters2 := RecRef.GetFilters;  
    Message(Text001, Filters2);  
    RecRef.Reset;  
    Filters3 := RecRef.GetFilters;  
    Message(Text002, Filters3);  
end;
  
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)