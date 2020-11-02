---
title: "Permissions Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
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
# Permissions Property
Sets whether an object has additional permission required to perform some operations on one or more tables. The operations can be to read, insert, modify, and delete data.

## Applies to
-   Codeunit
-   Table
-   Request Page
-   Page
-   Xml Port
-   Report
-   Query

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
Permissions = TableData 1221 = rimd;
```
  
## Remarks  

The license determines the permissions that users have in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. These permissions are further refined by the security permission sets that administrators grant to users. For data, the types of access are **Read**, **Insert**, **Modify**, and **Delete**. A user with Read permission can open the page that displays the data from a table, for example, the Item or Customer tables. However, to change or delete the data the user must have Modify and Delete permissions.

Sometimes the license or permission set only give user indirect permission to perform operations on certain data in tables (TableData). A user who has Indirect Read permission cannot open a page that displays data from a table unless the page has been given permission to read data from the table for the user. That means the user can perform an action on the data only through another object (see Applies To). In other words, if you only have indirect permission to, for example, insert data into a particular table, you cannot insert data into this table from the standard user interface. You must use a database object that has been given extra permission to insert data into the table.

By default, objects do not have the permission property defined and use the same permissions as the user. However for special cases, such as various Ledger Entries tables, users do not have write or modify permissions. Instead, users should run posting routines that create ledger entries on behalf of user.

## Example - Indirect Permission

You can give users access to an object, but only through another object. This is called giving "Indirect" permission. For example, a user can have permission to run codeunit 80, Sales-Post. The Sales-Post codeunit performs many tasks, including modifying table 37, Sales Line. When the user posts a sales document by using the Sales-Post codeunit, Business Central checks whether the user has permission to modify the Sales Line table. If not, the codeunit cannot complete its tasks, and the user receives an error message. If so, the codeunit runs successfully.

However, the user does not need full access to the Sales Line table to run the codeunit. If the user has Indirect permission for the Sales Line table, then the Sales-Post codeunit runs successfully. When a user has Indirect permission, that user can only modify the Sales Line table by running the Sales-Post codeunit or another object that has permission to modify the Sales Line table. The user can only modify the Sales Line table when doing so from supported application areas. The user cannot run the feature inadvertently or maliciously by other methods.

<!--
|||Permission granted|Permission granted|Permission granted|
|---------|---------|---------|---------|---------|
|||**Blank**<br> No permissions|**Indirect**<br>|**Yes**<br>Direct permission|
|Permission property in object|Defined|Result: Runtime error caused by missing permissions.<br>The user must also have Indirect permission.|Result: Success|Result: Success <br> User has full access to the data.|
|Permission property in object|Not defined<br>Default|Result: Runtime error caused by missing permissions.|Result: Runtime error caused by missing permissions.|Result: Success|
-->

The following table illustrates how the Permission property works with the permissions granted to an object by the license or a permission set. The table shows the runtime results when the Permission property is set and when it isn't.

<!--
|Is Permission property set?|No permission to object|Indirect permission to object|Direct permission to object |
|---------|---------|---------|---------|
|Yes|Runtime error caused by missing permissions.|Success|Success <br> User has full access to the data.|
|No (default)|Runtime error caused by missing permissions.|Runtime error caused by missing permissions.|Success|

-->

|Permissions granted by permission set|Permission property not set|Permission property set|
|---------|---------|---------|
|None|Runtime error caused by missing permissions.|Runtime error caused by missing permissions.|
|Indirect permission|Runtime error caused by missing permissions.|Success|
|Direct permission|Success|Success<br> User has full access to the data.|


The following example shows how to specify the permissions property for the codeunit used for customer ledger entries. You can define the permissions property in other objects in the same way.

```AL
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

> [!NOTE]  
> After you set the **Permissions** property of an object, only users with direct permission to perform all the extra operations that the object has been given can modify this object.  
> 
> Do not use the **Permissions** property to give extra permissions to an object that you would like your users to be able to modify. These users might not have direct permission to perform these operations. This is why you should be careful when you use the **Permissions** property for tables and pages.  
  
## See Also

[Properties](devenv-properties.md)  
[Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions)  
[Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions)