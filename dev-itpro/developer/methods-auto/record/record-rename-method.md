---
title: "Record.Rename(Any [, Any,...]) Method"
description: "Changes the value of a primary key in a table."
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
# Record.Rename(Any [, Any,...]) Method
> **Version**: _Available or changed with runtime version 1.0._

Changes the value of a primary key in a table.


## Syntax
```AL
[Ok := ]  Record.Rename(Value1: Any [, Value2: Any,...])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Value1*  
&emsp;Type: [Any](../any/any-data-type.md)  
  
*[Optional] Value2*  
&emsp;Type: [Any](../any/any-data-type.md)  
  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Use the Rename method, for example, if you use the customer's telephone number as the customer number. You can use this method to change the customer number in case the telephone number changes.

Certain tables you cannot rename, for example:

- Tables in which the user cannot rename the **Document No.** field for legal or business reasons.
- Tables in which an **Option** data type field, such as **Document Type**, is part of the primary key.

Examples of tables that you cannot rename are:

- Table 36, Sales Header
- Table 38, Purchase Header
- Table 5405, Production Order
- Table 5766, Warehouse Activity Header

If an end-user modifies a record between the time that another end-user or another process reads the record and modifies it, then the second user must refresh the value of the record variable before editing the record. Otherwise, the end-user receives the following run-time error:

`Another user has modified the record for this <Table Name> after you retrieved it from the database. Enter your changes again in the updated window, or start the interrupted activity again.`

You must design your application so that you use the most up-to-date version of the record for modifications to the database. You use the  [Get Method](record-get-method.md) to refresh the record with the latest version. The second example illustrates this situation.

When a record is renamed, the change is written and committed to the database without calling the [OnModify Trigger](../../../../triggers/triggers/devenv-onmodify-trigger.md). This is done because renaming a record changes the primary key and updates the primary key value in all related tables. Therefore, you should use the Rename method and [Record.Modify([Boolean]) Method](record-modify-method.md) on a record separately.

## See Also

[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)