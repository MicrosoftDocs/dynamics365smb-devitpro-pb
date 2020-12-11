---
title: "Record.FieldName Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Record.FieldName Method
> **Version**: _Available from runtime version 1.0._

Gets the name of a field as a string.


## Syntax
```
Name :=   Record.FieldName(Field: Any)
```
## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The name of the field in the record.
          


## Return Value
*Name*
&emsp;Type: [String](../string/string-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The advantage of using the FIELDNAME method call instead of a static assignment, like NameOfField := 'MyField', is that using the FIELDNAME method dynamically adapts to any change to the field name made in the development environment.

## Example

The following example gets the name of the **No.** field in the **Customer** table, and stores it in a string.

```
var
    NameOfField: Text;
    CustomerRec: Record Customer;

begin
    NameOfField := CustomerRec.FIELDNAME("No.");
end;
```

## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)