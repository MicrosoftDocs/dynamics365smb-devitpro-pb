---
title: "RecordRef.AddLoadFields([Integer,...]) Method"
description: "Specifies additional fields to be initially loaded when the record is retrieved from its data source."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.AddLoadFields([Integer,...]) Method
> **Version**: _Available or changed with runtime version 6.0._

Specifies additional fields to be initially loaded when the record is retrieved from its data source. Subsequent calls to AddLoadFields will not overwrite fields already selected for the initial load.


## Syntax
```AL
[Ok := ]  RecordRef.AddLoadFields([Fields: Integer,...])
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*[Optional] Fields*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The FieldNo's of the fields to be loaded.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if all fields are selected for subsequent loads; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Calling SetLoadFields on a record without passing any fields will reset the fields selected to load to the default, where all readable normal fields are selected for load.

> [!NOTE]
> You must not use the method AddLoadFields on fields with FieldClass FlowFilter or FlowField. Otherwise a runtime error will occur.

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
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)