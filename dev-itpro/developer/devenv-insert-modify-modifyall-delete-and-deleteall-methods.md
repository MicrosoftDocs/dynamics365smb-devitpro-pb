---
title: "Insert, Modify, ModifyAll, Delete, and DeleteAll Methods"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Insert, Modify, ModifyAll, Delete, and DeleteAll Methods

The following methods maintain the database by adding, modifying, and removing records:  

- Insert
- Modify
- ModifyAll
- Delete
- DeleteAll

These methods are some of the most frequently used AL methods.  

Some of these methods return an optional Boolean value that indicates whether the method succeeded. If you do not handle the return value in your code, a run-time error occurs when a method returns **false**. If you handle the return value by testing its value in an **if** statement, no error will occur, and you must take corrective action in the code.  

## Insert method  
The Insert method inserts a record in a table. Insert has the following syntax.
<!--
```  
[Ok :=] Record.Insert([RunTrigger])  
```  
-->
```  
[Ok := ]  Record.Insert([RunTrigger: Boolean[, InsertWithSystemId: Boolean]])
```  

A record must be assigned a **SystemId**. You have the option to assign your own value or have the platform assign an auto-generated value. The following example inserts a new record, with the **SystemId**, **No.**, and **Name** fields specified in the assigned values, while other fields will have their default values. If the **No.** field is the primary key of the **Customer** table, then the record will be inserted in the **Customer** table unless the table already contains a record with the same primary key. In this case you receive an error message because the return value is not tested.  

```
var
    Customer: Record Customer;
begin
    Customer.Init;
    Customer.SystemId := '{B6666666-F5A2-E911-8180-001DD8B7338E}';  
    Customer."No." := '4711';  
    Customer.Name := 'Andrew Dixon';  
    Customer.Insert(false, true);
end; 
```  

> [!IMPORTANT]
> After the **SystemId** has been set on a record, it cannot be changed.

## Modify method  
Modify modifies a record that already exists. For more information, see [Modify Method](methods-auto/record/record-modify-method.md).
Modify has the following syntax.  

```  
[Ok :=] Record.Modify([RunTrigger])  
```  

Modify returns an optional Boolean value. It returns **true** if the record to be modified exists; otherwise, it returns **false**.  

The following example changes the name of customer 4711 to Richard Roe. This example requires that you create the following variable.  

|Variable|Data type|Subtype|  
|--------------|---------------|-------------|  
|Customer|Record|Customer|  

```  
Customer.Get('4711');  
Customer.Name := 'Richard Roe';  
Customer.Modify;  
```  

## ModifyAll method  
ModifyAll performs a bulk update of records. For more information, see [ModifyAll Method](methods-auto/record/record-modifyall-method.md). 

ModifyAll has the following syntax.  

```  
Record.ModifyAll(Field, NewValue [, RunTrigger])  
```  

ModifyAll uses the current filters. This means that you can perform the update on a specified set of records in a table. ModifyAll returns no value, nor does it cause an error if the set of records to be changed is empty.  

In the following example, the `SetRange` statement selects the records where Salesperson Code is PS. The ModifyAll statement changes the Salesperson Code of these records to JR. The example requires that you create the following variable.  

|Variable|Data type|Subtype|  
|--------------|---------------|-------------|  
|Customer|Record|Customer|  

```  
Customer.SetRange("Salesperson Code",'PS','PS');  
Customer.ModifyAll("Salesperson Code",'JR');  
```  

## Delete method  
Delete deletes a record from the database. For more information, see [Delete Method](methods-auto/record/record-delete-method.md) 
Delete has the following syntax.  

```  
[Ok :=] Record.Delete([RunTrigger])  
```  

The record that you want to delete must be specified by using the values in the primary key fields before you call this method. This means that Delete does take filters into consideration.  

The following example shows how to use Delete to delete the record for customer number 4711. This example requires that you create the following variable.  

|Variable|Data type|Subtype|  
|--------|---------|-------------|  
|Customer|Record|Customer|  

```  
Customer."No." := '4711';  
Customer.Delete;  
```  

Delete returns an optional Boolean value. It returns **true** if the record could be found; otherwise, it returns **false**. Unless you test this value in your code, a run-time error occurs when Delete fails.  

When you are developing your own applications, you should consider the following scenario:  

1. Retrieve a record from the database.  

2. Perform various checks to determine whether the record should be deleted.  

3. If step 2 indicated that you should delete the record, then delete it.  

This can cause problems in a multi-user environment. Another user can modify or delete the same record between your performing steps 2 and 3. If the record is modified, then perhaps the new contents of the record would have changed your decision to delete it. If it has been deleted by the other user, you can get a run-time error if you have just verified that the record existed (in step 1). If the design of your application indicates that you can encounter this problem, you should consider using the LockTable method. LockTable should be used sparingly because this method degrades performance. For more information about the LockTable method, see [LockTable Method](methods-auto/record/record-locktable-method.md).  

## DeleteAll method  
DeleteAll deletes all the records that are specified by the filter settings. If no filters are applied, it deletes all the records in the table. For more information, see [DeleteAll Method](methods-auto/record/record-deleteall-method.md) 
DeleteAll has the following syntax.  

```  
Record.DeleteAll([RunTrigger])  
```  

The following example deletes all the records from the **Customer** table where the Salesperson Code is PS. This example requires that you create the following variable.  

|Variable|Data type|Subtype|  
|--------------|---------------|-------------|  
|Customer|Record|Customer|  

```  
Customer.SetRange("Salesperson Code", 'PS', 'PS');  
Customer.DeleteAll;  
```  

> [!NOTE]  
> When you use DeleteAll (true), a copy of the AL variable with its initial values is created. This means that when you use DeleteAll(true) to run the OnDelete trigger, all the changes that were made to the variables in the method or codeunit that is making the call cannot be seen in the OnDelete trigger. If you want to see the changes that you made to the variables, you must use Delete(true) in a loop. There is no difference in performance between using DeleteAll(true) and using Delete(true) in a loop.


## See Also
[AL Methods](methods/devenv-al-method-reference.md)  
[SystemId Field](devenv-table-system-fields.md#systemid)  