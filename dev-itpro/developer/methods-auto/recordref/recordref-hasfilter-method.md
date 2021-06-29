---
title: "RecordRef.HasFilter Method"
description: "Determines whether a filter has been applied to the table that the RecordRef refers to."
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
# RecordRef.HasFilter Method
> **Version**: _Available or changed with runtime version 1.0._

Determines whether a filter has been applied to the table that the RecordRef refers to.


## Syntax
```
Ok :=   RecordRef.HasFilter()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the table referred to by RecordRef has a filter; otherwise, **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method works just like the [HasFilter Method \(Record\)](../record/record-hasfilter-method.md).  
  
## Example  
 The following example opens the Customer table with a RecordRef variable that is named RecRef. The HasFilter method determines whether a filter has been applied in the Customer table. The method returns **false** because no filters are applied. The return value is stored in the varHasFilters variable. The [SetRecFilter Method \(RecordRef\)](recordref-setrecfilter-method.md) is used to set a filter. The HasFilter method now returns **true**. This example requires that you create the following global variables and text constant.  
    
```al
var
    varHasFilters: Text;
    RecRef: RecordRef;
    Text000: Label 'Are there any filters? %1';
begin   
    RecRef.Open(Database::Customer);  
    VarHasFilters := RecRef.HasFilter;  
    Message('Are there any filters? %1', VarHasFilters);  
    RecRef.SetRecFilter;  
    VarHasFilters := RecRef.HasFilter;  
    Message(Text000, VarHasFilters);  
end;
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)