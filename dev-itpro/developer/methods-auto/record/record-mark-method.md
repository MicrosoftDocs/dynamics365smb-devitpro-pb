---
title: "Record.Mark([Boolean]) Method"
description: "Marks a record."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.Mark([Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Marks a record. You can also use this method to determine whether a record is marked.


## Syntax
```AL
[Marked := ]  Record.Mark([Mark: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] Mark*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if a record is marked.  


## Return Value
*[Optional] Marked*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the record is marked; otherwise, **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The mark on a record is temporary, and disappears when the current session ends. The Mark method is valid for the specific record instance/variable, and not shared between all variables of the same record type in a session.

You can use the [MarkedOnly (Record) Method](record-markedonly-method.md) to activate a special filter where your view of the table includes only records marked by the **Mark (Record)** method.

## Example 1

This example shows how to use the Mark method, assuming that no records are marked initially. The example loops through the customer records and marks a specific record. The message dialog displays the records one by one with information about whether the record is marked or not.

```al
codeunit 50121 MarkedRecord
{
    trigger OnRun()
    var
        Customer: Record Customer;
        Marked: Boolean;
        Text000: Text;
    begin
        Text000 := 'Customer."No." %1, Marked?: %2';

        Customer.SetCurrentKey("No.");
        Customer."No." := '10000';
        Customer.Find('=');
        Customer.Mark(true); // Mark a record.  
        Customer.Find('-'); // Find first record.  
        repeat // Go through records  
            Marked := Customer.Mark; // Test if marked.  
            Message(Text000, Customer."No.", Marked);
        until
            Customer.Next = 0;
    end;
}
```

## Example 2

This next example shows how to use the Mark method together with the MarkedOnly method, assuming that no records are marked initially.

```al
codeunit 50121 MarkedOnlyRecord
{
    trigger OnRun()
    var
        Customer: Record Customer;
        No1: Integer;
        No2: Integer;
        Text001: Text;
        Text002: Text;
    begin
        Text001 := 'Number of records before MarkedOnly: %1\';
        Text002 := 'Number of records after MarkedOnly: %2';

        Customer.SetCurrentKey(Customer."No.");
        Customer."No." := '10000';
        Customer.Find('=');
        Customer.Mark(true);
        No1 := Customer.Count();
        Customer.MarkedOnly(true);
        No2 := Customer.Count();
        Message(Text001 + Text002, No1, No2);
    end;
}
```

## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)