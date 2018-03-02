---
title: "RENAME Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 66174b64-3c51-4c2e-a438-47bffbf114d5
caps.latest.revision: 16
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RENAME Method (Record)
Changes the value of a primary key in a table.  
  
## Syntax  
  
```  
  
[Ok :=] Record.RENAME(Value1[, Value2,...])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that contains the primary key that you want to change.  
  
 *Value1, Value2, …*  
 Type: Text  
  
 The new values for the primary key.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the primary key was renamed; otherwise, **false**. If the record does not exist or if you do not have permission to write to the table, then **false** is returned.  
  
 If you omit this optional return value and if the record is not renamed, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## Remarks  
 For example, you can use the **RENAME** method if you use the customer's telephone number as the customer number. You can use this method to change the customer number if the telephone number changes.  
  
 You cannot rename some tables. Examples of the types of tables that you cannot rename are as follows:  
  
-   Tables in which the user cannot rename the Document No. field for legal or business reasons.  
  
-   Tables in which an Option data type field, such as Document Type, is part of the primary key.  
  
 Some examples of tables that you cannot rename are as follows:  
  
-   Table 36, **Sales Header**  
  
-   Table 38, **Purchase Header**  
  
-   Table 5405, **Production Order**  
  
-   Table 5766, **Warehouse Activity Header**  
  
     If an end-user modifies a record between the time that another end-user or another process reads the record and modifies it, then the second user must refresh the value of the record variable before editing the record. Otherwise, the end-user receives the following run-time error:  
  
     **Another user has modified the record for this \<Table Name> after you retrieved it from the database.**  
  
     **Enter your changes again in the updated window, or start the interrupted activity again.**  
  
     In earlier versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], certain situations allowed code that an end-user runs to modify a record after a newer version of the record was written and committed to the database. This would overwrite the newer changes. However, in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], we have restricted the [MODIFY Method \(Record\)](devenv-MODIFY-Method-Record.md), **RENAME** Method \(Record\), and [DELETE Method \(Record\)](devenv-DELETE-Method-Record.md) so that the end-user retrieves the following run-time error in these certain situations:  
  
     **Unable to change an earlier version of the \<Table Name> record. The record should be read from the database again. This is a programming error.**  
  
     You must design your application so that you use the most up-to-date version of the record for modifications to the database. You use the [GET Method \(Record\)](devenv-GET-Method-Record.md) to refresh the record with the latest version. The second example illustrates this situation.  
  
 When a record is renamed, the change is written and committed to the database without calling the [OnModify Trigger](../triggers/devenv-OnModify-Trigger.md). This is done because renaming a record changes the primary key and updates the primary key value in all related tables. Therefore, you should use the Rename method and Modify method on a record separately.  
  
## Example  
 This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|ItemRec|Record|Item|  
  
```  
ItemRec.GET(‘1150’);  
ItemRec.RENAME(‘1105’);  
```  
  
## Example  
 This example shows that you get an error if you attempt to rename a record after a newer version of the record has been written and committed to the database. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec1|Record|Customer|  
|CustomerRec2|Record|Customer|  
  
 In this example, you get a copy of a record from the **Customer** table and put it into the CustomerRec1 variable, then you modify the record. Next, you get a copy of the same record from the **Customer** table and put it into the CustomerRec2 variable. You modify the record and commit the changes to the database. Now the CustomerRec1 variable is out of date with the value in the database. If you were allowed to modify the record using the CustomerRec1 record, then the changes that you made with CustomerRec2 would be overwritten by the values in the CustomerRec1 variable. [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] does not allow you to rename a record with the old version of the record.  
  
> [!NOTE]  
>  If you do not call the **COMMIT** method in this example, then you do not receive an error.  
  
```  
CustomerRec1.LOCKTABLE;  
CustomerRec1.GET('10000');  
CustomerRec1."Address 2" := 'Suite 101';  
CustomerRec1.MODIFY;  
  
CustomerRec2.GET('10000');  
CustomerRec2."Phone No.":= '206-555-0109';  
CustomerRec2.MODIFY;  
  
COMMIT;  
  
CustomerRec1."Phone No." := '425-555-0184';  
CustomerRec1.RENAME('10001');  
```  
  
 If you run this code example, then you get the following error:  
  
 **Unable to change an earlier version of the Customer record. The record should be read from the database again. This is a programming error.**  
  
 **Identification fields and values:**  
  
 **No.='10000'**  
  
## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)   
 [RENAME Method \(RecordRef\)](devenv-RENAME-Method-RecordRef.md)   
 [COMMIT Method \(Database\)](devenv-COMMIT-Method-Database.md)   
 [LOCKTABLE Method \(Record\)](devenv-LOCKTABLE-Method-Record.md)