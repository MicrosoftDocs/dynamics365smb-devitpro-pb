---
title: "INSERT, MODIFY, MODIFYALL, DELETE, and DELETEALL Methods"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 73d7bcd0-9b00-4be2-bf4e-010bcc69ab33
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# INSERT, MODIFY, MODIFYALL, DELETE, and DELETEALL Methods
The following methods maintain the database by adding, modifying, and removing records:  
  
-   INSERT  
  
-   MODIFY  
  
-   MODIFYALL  
  
-   DELETE  
  
-   DELETEALL  
  
 These methods are some of the most frequently used AL methods.  
  
 Some of these methods return an optional Boolean value that indicates whether the method succeeded. If you do not handle the return value in your code, a run-time error occurs when a method returns FALSE. If you handle the return value by testing its value in an IF statement, no error will occur, and you must take corrective action in the code.  
  
## INSERT Method  
 INSERT inserts a record in a table.  
  
 INSERT has the following syntax.  
  
```  
[Ok :=] Record.INSERT([RunTrigger])  
```  
  
 The following example inserts a new record, with the **No.** and **Name** fields specified in the assigned values, while other fields will have their default values. If the **No.** field is the primary key of the **Customer** table, then the record will be inserted in the **Customer** table unless the table already contains a record with the same primary key. In this case you receive an error message because the return value is not tested.  
  
 This example requires that you create the following variable.  
  
|Variable|Data type|Subtype|  
|--------------|---------------|-------------|  
|Customer|Record|Customer|  
  
```  
Customer.INIT;  
Customer."No." := '4711';  
Customer.Name := 'Andrew Dixon';  
Customer.INSERT;  
```  
  
## MODIFY Method  
 MODIFY modifies a record that already exists.  
  
 MODIFY has the following syntax.  
  
```  
[Ok :=] Record.MODIFY([RunTrigger])  
```  
  
 MODIFY returns an optional Boolean value. It returns TRUE if the record to be modified exists; otherwise, it returns FALSE.  
  
 The following example changes the name of customer 4711 to Richard Roe. This example requires that you create the following variable.  
  
|Variable|Data type|Subtype|  
|--------------|---------------|-------------|  
|Customer|Record|Customer|  
  
```  
Customer.GET('4711');  
Customer.Name := 'Richard Roe';  
Customer.MODIFY;  
```  
  
## MODIFYALL Method  
 MODIFYALL performs a bulk update of records.  
  
 MODIFYALL has the following syntax.  
  
```  
Record.MODIFYALL(Field, NewValue [, RunTrigger])  
```  
  
 MODIFYALL uses the current filters. This means that you can perform the update on a specified set of records in a table. MODIFYALL returns no value, nor does it cause an error if the set of records to be changed is empty.  
  
 In the following example, the SETRANGE statement selects the records where Salesperson Code is PS. The MODIFYALL statement changes the Salesperson Code of these records to JR. The example requires that you create the following variable.  
  
|Variable|Data type|Subtype|  
|--------------|---------------|-------------|  
|Customer|Record|Customer|  
  
```  
Customer.SETRANGE("Salesperson Code",'PS','PS');  
Customer.MODIFYALL("Salesperson Code",'JR');  
```  
  
## DELETE Method  
 DELETE deletes a record from the database.  
  
 DELETE has the following syntax.  
  
```  
[Ok :=] Record.DELETE([RunTrigger])  
```  
  
 The record that you want to delete must be specified by using the values in the primary key fields before you call this method. This means that DELETE does take filters into consideration.  
  
 The following example shows how to use DELETE to delete the record for customer number 4711. This example requires that you create the following variable.  
  
|Variable|Data type|Subtype|  
|--------------|---------------|-------------|  
|Customer|Record|Customer|  
  
```  
Customer."No." := '4711';  
Customer.DELETE;  
```  
  
 DELETE returns an optional Boolean value. It returns TRUE if the record could be found; otherwise, it returns FALSE. Unless you test this value in your code, a run-time error occurs when DELETE fails  
  
 When you are developing your own applications, you should consider the following scenario:  
  
1.  Retrieve a record from the database.  
  
2.  Perform various checks to determine whether the record should be deleted.  
  
3.  If step 2 indicated that you should delete the record, then delete it.  
  
 This can cause problems in a multi-user environment. Another user can modify or delete the same record between your performing steps 2 and 3. If the record is modified, then perhaps the new contents of the record would have changed your decision to delete it. If it has been deleted by the other user, you can get a run-time error if you have just verified that the record existed \(in step 1\). If the design of your application indicates that you can encounter this problem, you should consider using the LOCKTABLE method. LOCKTABLE should be used sparingly because this method degrades performance. For more information about the LOCKTABLE method, see [LOCKTABLE Method](devenv-LOCKTABLE-Method.md).  
  
## DELETEALL Method  
 DELETEALL deletes all the records that are specified by the filter settings. If no filters are applied, it deletes all the records in the table.  
  
 DELETEALL has the following syntax.  
  
```  
Record.DELETEALL([RunTrigger])  
```  
  
 The following example deletes all the records from the **Customer** table where the Salesperson Code is PS. This example requires that you create the following variable.  
  
|Variable|Data type|Subtype|  
|--------------|---------------|-------------|  
|Customer|Record|Customer|  
  
```  
Customer.SETRANGE("Salesperson Code", 'PS', 'PS');  
Customer.DELETEALL;  
```  
  
> [!NOTE]  
>  When you use DELETEALL\(TRUE\), [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] creates a copy of the AL variable with its initial values. This means that when you use DELETEALL\(TRUE\) to run the OnDelete trigger, all the changes that were made to the variables in the method or codeunit that is making the call cannot be seen in the OnDelete trigger. If you want to see the changes that you made to the variables, you must use DELETE\(TRUE\) in a loop. There is no difference in performance between using DELETEALL\(TRUE\) and using DELETE\(TRUE\) in a loop.