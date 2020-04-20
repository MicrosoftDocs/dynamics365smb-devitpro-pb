---
title: "SetRecFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 04/15/2020
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
# SetRecFilter Method
Sets a filter on a record that is referred to by a RecordRef.


## Syntax
```
 RecordRef.SetRecFilter()
```

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method works the same as the [SETRECFILTER Method \(Record\)](../../methods/devenv-setrecfilter-method-record.md).  

## Example  
 The following example opens the Customer table as a RecordRef variable that is named MyRecordRef. The SETRECFILTER method sets the values in the current key of the current record as a record filter. The [GETFILTERS Method \(RecordRef\)](recordref-getfilters-method.md) retrieves the filters that have been set and displays them in a message box. No. is displayed because the filter is set on the No. field, which is the current key. 
 
```  
var
    MyRecordRef: RecordRef;
    varFilters: Text;
    Text000: Label 'The filter is set on the %1 field.';
begin 
    MyRecordRef.OPEN(DATABASE::Customer);  
    MyRecordRef.SETRECFILTER;  
    varFilters := MyRecordRef.GETFILTERS;  
    MESSAGE(Text000, varFilters);  
end;
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)