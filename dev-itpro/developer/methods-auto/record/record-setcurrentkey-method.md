---
title: "Record.SetCurrentKey(Any [, Any,...]) Method"
description: "Selects a key for a table."
ms.author: solsen
ms.date: 02/23/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.SetCurrentKey(Any [, Any,...]) Method
> **Version**: _Available or changed with runtime version 1.0._

Selects a key for a table.


## Syntax
```AL
[Ok := ]  Record.SetCurrentKey(Field1: Any [, Field2: Any,...])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field1*  
&emsp;Type: [Any](../any/any-data-type.md)  
  

*[Optional] Field2*  
&emsp;Type: [Any](../any/any-data-type.md)  
  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You can use `SetCurrentKey` to hint a sort order to the [!INCLUDE[prod_short](../../includes/prod_short.md)] server. With the fields suggested in `SetCurrentKey`, the [!INCLUDE[prod_short](../../includes/prod_short.md)] server then searches available key definitions and adds an ORDER BY clause with the fields from the key to the SQL statement issued to the database. 

A key matches the fields passed to `SetCurrentKey` if the key fields are either an exact match, or if the fields are a prefix of the key fields.

If no key is found that matches the fields given to `SetCurrentKey`, the sort order will still be applied but without a key, the query may be slower.

When you use `SetCurrentKey`, the following rules apply:  

- You can't use `SetCurrentKey` on:

  - FlowFilter fields
  - Nested FlowFields
  - FlowFields on ExternalSQL tables
  - Blob fields
  - FlowFields on virtual tables
  - FlowFields that query across application database / tenant database
  - FlowFields that query different table types

  These fields aren't sortable. If any of these fields are used in the method, it returns `false` at runtime and an error occurs if not handled.
- Only active keys are considered.

- When the system searches for a key, the first occurrence of a key that starts with the specified fields is selected, which means:  

  - Fields that are part of a **IncludedFields** definition aren't used when searching for a matching key.

  - If you specify only one field as a parameter when you call `SetCurrentKey`, the key that is selected might consist of more than one field.  

  - If the field that you specify is the first component of several keys, the key that is selected might not be the key that you expect.  

## Related information

[Record data type](record-data-type.md)  
[Get started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)  
