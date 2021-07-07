---
title: "Record.AreFieldsLoaded(Any,...) Method"
description: "Checks whether the specified fields are all initially loaded."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Record.AreFieldsLoaded(Any,...) Method
> **Version**: _Available or changed with runtime version 6.0._

Checks whether the specified fields are all initially loaded.


## Syntax
```AL
Ok :=   Record.AreFieldsLoaded(Fields: Any,...)
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Fields*  
&emsp;Type: [Any](../any/any-data-type.md)  
The FieldNo's of the fields to check.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if all the fields specified by the Fields parameter are currently loaded; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method is part of the partial records capability for improving performance. For more information, see [Using Partial Records](../../devenv-partial-records.md).

## Example

This example shows how to use the AreFieldsLoaded method when you only need to load either the **Name** or the **Name 2** field on the **Customer** table. The procedure selects which ever field is actually loaded. If neither is loaded, this causes a JIT load.

```al
procedure GetLoadedName(Cust: Record Customer): Text 
begin 
    if Cust.AreFieldsLoaded(Cust.Name) then 
        exit(Cust.Name) 
    else 
        if Cust.AreFieldsLoaded(Cust."Name 2") then 
            exit(Cust."Name 2") 
        else 
            exit(Cust.Name);
end;
```

## See Also

[Using Partial Records](../../devenv-partial-records.md)  
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)