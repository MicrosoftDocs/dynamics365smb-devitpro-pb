---
title: "Record.AddLoadFields Method"
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
# Record.AddLoadFields Method
Specifies fields to be initially loaded when the record is retrieved from its data source. Subsequent calls to AddLoadFields will not overwrite fields already selected for the initial load.


## Syntax
```
[Ok := ]  Record.AddLoadFields([Fields: Any,...])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Fields*  
&emsp;Type: [Any](../any/any-data-type.md)  
The FieldNo's of the fields to be loaded.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if all fields are selected for subsequent loads; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

On a report, you might load a field that is outside the ones default selected for load via DataColumn, so one can add it in the OnPreDataItem trigger:

```
trigger OnPreDataItem() 
begin 

    CurrencyDataItem.AddLoadFields(CurrencyDataItem."ISO Numeric Code"); 
end; 

trigger OnAfterGetRecord() 
begin 
    if (CurrencyDataItem."ISO Numeric Code" <> 'DKK') then 
    begin 
        CurrReport.Skip(); 
    end; 
end; 
```

## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)