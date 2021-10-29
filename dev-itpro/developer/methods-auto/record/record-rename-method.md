---
title: "Record.Rename(Any [, Any,...]) Method"
description: "Changes the value of a primary key in a table."
ms.author: solsen
ms.custom: na
ms.date: 10/29/2021
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

When a record is renamed, the change is written and committed to the database without calling the [OnModify Trigger](../../triggers-auto/table/devenv-onmodify-table-trigger.md). This is done because renaming a record changes the primary key and updates the primary key value in all related tables. Therefore, you should use the Rename method and [Record.Modify([Boolean]) Method](record-modify-method.md) on a record separately.

## Example 1

```al
var
    CustRec	Record Customer

CustRec.Get(10000);  
CustRec.Rename(10001);  
```

## Example 2

This example shows that you get an error if you attempt to rename a record after a newer version of the record has been written and committed to the database.

In this example, you get a copy of a record from the Customer table and put it into the `CustRec1` variable, then you modify the record. Next, you get a copy of the same record from the Customer table and put it into the `CustRec2` variable. You modify the record and commit the changes to the database. Now the `CustRec1` variable is out of date with the value in the database. If you were allowed to modify the record using the `CustRec1` record, then the changes that you made with `CustRec2` would be overwritten by the values in the `CustRec1` variable. It is not allowed to rename a record with the old version of the record.

> [!NOTE]  
> If you do not call the `Commit` method in this example, then you do not receive an error.

```al
var
    CustRec1: Record Customer;
    CustRec2: Record Customer;
...
    CustRec1.LockTable();
    CustRec1.Get(20000);
    CustRec1."Address 2" := 'Suite 102';
    CustRec1.Modify();

    CustRec2.Get(20000);
    CustRec2."Phone No." := '206-555-0109';
    CustRec2.Modify();

    Commit();

    CustRec1."Phone No." := '425-555-0184';
    CustRec1.Rename(20001);
```

`The changes to the Customer record cannot be saved because some information on the page is not up-to-date. Close the page, reopen it, and try again. Identification fields and values: No.='20000'`



## See Also

[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)