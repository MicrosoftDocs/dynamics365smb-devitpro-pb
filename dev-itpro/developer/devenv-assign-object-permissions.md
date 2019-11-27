---
title: Assign permissions to objects
description: Specify how users can access an object.
ms.custom: na
ms.date: 11/27/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: bholtorf
---
# Assign permissions to objects
When you create a new object, you must assign one of the following permission levels for it.

|Permission|Description|Rank|
|---------|---------|---------|
|Yes|The user can perform the action on the object in question.|Highest|
|Indirect|The user can perform the action on the object in question but only through another related object that the user has full access to.|Second highest|
|No|The user cannot perform the action on the object in question.|Lowest|

## Example - Indirect permission
You can assign an indirect permission to use an object only through another object. For example, a user can have permission to run codeunit 80, Sales-Post. The Sales-Post codeunit performs many tasks, including modifying table 37, Sales Line. When the user posts a sales document, the Sales-Post codeunit, Business Central checks if the user has permission to modify the Sales Line table. If not, the codeunit cannot complete its tasks, and the user receives an error message. If so, the codeunit runs successfully.

However, the user does not need to have full access to the Sales Line table to run the codeunit. If the user has indirect permission for the Sales Line table, then the Sales-Post codeunit runs successfully. When a user has indirect permission, that user can only modify the Sales Line table by running the Sales-Post codeunit or another object that has permission to modify the Sales Line table. The user can only modify the Sales Line table when doing so from supported application areas. The user cannot run the feature inadvertently or maliciously by other methods.

The following is an example of how to specify permissions for a codeunit. You grant permissions to other objects in the same way.

```
codeunit 50113 CreateCustomer
{
    Permissions = TableData "Cust. Ledger Entry" = rm;
    TableNo = Customer;

    trigger OnRun();
    begin
        InsertEntry(Rec);
    end;

    procedure InsertEntry(var Cust : Record Customer)
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgerEntry.Init();
        CustLedgerEntry."Entry No." := 1;
        CustLedgerEntry."Customer No." := Cust."No.";
        CustLedgerEntry."Posting Date" := WorkDate();
        CustLedgerEntry.Insert();
    end;
}
```

## Read more
[Assign Permissions to Users and Groups](/business-central/ui-define-granular-permissions.md)