---
title: "RecordRef.AddLoadFields Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# RecordRef.AddLoadFields Method
> **Version**: _Available from runtime version 6.0._

Specifies additional fields to be initially loaded when the record is retrieved from its data source. Subsequent calls to AddLoadFields will not overwrite fields already selected for the initial load.


## Syntax
```
[Ok := ]  RecordRef.AddLoadFields([Fields: Integer,...])
```
## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

*Fields*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The FieldNo's of the fields to be loaded.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if all fields are selected for subsequent loads; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method is part of the partial records capability for improving performance. For more information, see [Using Partial Records](../../devenv-partial-records.md).

## Example

This code example uses the AddLoadFields method to make sure that if a record is a **Currency**, then the **Currency Factor** field is loaded. This code would have to be called before a database operation is executed on the RecordRef.

```al
procedure AlwaysNeededFields(VAR MyRecordRef: RecordRef)
var
        Currency: Record Currency;
begin
if (MyecordRef.Number = Database::Currency) then
// We always want the Currency."Currency Factor"
MyRecordRef.AddLoadFields(Currency.FieldNo(Currency."Currency Factor"));
end;
```

## See Also
[Using Partial Records](../../devenv-partial-records.md)  
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)