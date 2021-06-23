---
title: "Record.SetRecFilter Method"
description: "Sets the values in the current key of the current record as a record filter."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# Record.SetRecFilter Method
> **Version**: _Available or changed with runtime version 1.0._

Sets the values in the current key of the current record as a record filter.


## Syntax
```AL
 Record.SetRecFilter()
```

## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

The key isn't necessarily the primary key, the table view might be set to use a secondary key. All fields in the key as defined on the table are filtered. For more information the key selection, see [SetCurrentKey Method](record-setcurrentkey-method.md).

## Example  

The following example uses the SetRecFilter method to set a filter on the **Customer** table, based a key set by the SetCurrentKey method. The [GetFilters method)](record-getfilters-method.md) retrieves the filters and displays them in a message box. Because **Name** is the only field specified by the SetCurrentKey method, then the first key in the **Customer** table that starts with the field **Name** is used. In this case, for example, it's a secondary key defined as `key(Key7; Name, Address, City)`.

```al
var
    CustomerRec: Record Customer;
    varFilters: Text;
    Text000: Label 'The filter is set on the fields:  %1';
begin
    CustomerRec.SetCurrentKey(Name);
    CustomerRec.SetRecFilter();
    varFilters := CustomerRec.GetFilters;
    Message(Text000, varFilters);
end;
```
  
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)