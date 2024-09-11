---
title: "Record.AddLoadFields([Any,...]) Method"
description: "Specifies fields to be initially loaded when the record is retrieved from its data source."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.AddLoadFields([Any,...]) Method
> **Version**: _Available or changed with runtime version 6.0._

Specifies fields to be initially loaded when the record is retrieved from its data source. Subsequent calls to AddLoadFields will not overwrite fields already selected for the initial load.


## Syntax
```AL
[Ok := ]  Record.AddLoadFields([Fields: Any,...])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] Fields*  
&emsp;Type: [Any](../any/any-data-type.md)  
The FieldNo's of the fields to be loaded.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if all fields are selected for subsequent loads; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
It is not necessary to include the following fields, because they are always selected for loading: Primary key, SystemId, and data audit fields (SystemCreatedAt, SystemCreatedBy, SystemModifiedAt, SystemModifiedBy).  

Depending on the runtime version, the runtime may require extra fields to be selected for loading. Which extra fields to specify depends on the state of the record and table or table extension definition. For example, fields that are filtered upon are always loaded.

> [!NOTE]
> You must not use the method AddLoadFields on fields with FieldClass FlowFilter or FlowField. Otherwise a runtime error will occur.

This method is part of the partial records capability for improving performance. For more information, see [Using Partial Records](../../devenv-partial-records.md).

## Example

The following example code shows how to use the AddLoadFields method to add a field for loading on a report. The example loads a field that is outside of the default fields selected by DataColumns of the report. The field is added by using the AddLoadFields on the [OnPreDataItem trigger](../../triggers-auto/reportdataitem/devenv-onpredataitem-reportdataitem-trigger.md).

```al
trigger OnPreDataItem()
begin
    CurrencyDataItem.AddLoadFields("ISO Numeric Code");
end;

trigger OnAfterGetRecord()
begin
    if CurrencyDataItem."ISO Numeric Code" <> 'DKK' then
        CurrReport.Skip();
end;
```

## See Also

[Using Partial Records](../../devenv-partial-records.md)  
[Record Data Type](record-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
