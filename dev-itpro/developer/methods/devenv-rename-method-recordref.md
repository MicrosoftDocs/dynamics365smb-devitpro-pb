---
title: "RENAME Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 783136a0-01d1-4750-848b-593b1c34e71e
caps.latest.revision: 7
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RENAME Method (RecordRef)
Changes the value of a primary key in a table.  
  
## Syntax  
  
```  
[Ok :=] RecordRef.RENAME(Value1[, Value2,...])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the table that contains the primary key that you want to change.  
  
 *Value1, Value2, …*  
 Type: Any  
  
 The new values for the primary key.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the primary key was renamed; otherwise, **false**. If the table does not exist or if you do not have permission to write to it, then **false** is returned.  
  
 If you omit this optional return value and if the record is not renamed, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## Remarks  
 You cannot rename some tables. Examples of the types of tables that you cannot rename are:  
  
-   Tables in which the user is not allowed to rename the Document No. for legal or business reasons.  
  
-   Tables in which an Option data type field, such as Document Type, is part of the primary key.  
  
 Some examples of tables that you cannot rename are:  
  
-   Table 36, Sales Header  
  
-   Table 38, Purchase Header  
  
-   Table 5405, Production Order  
  
-   Table 5766, Warehouse Activity Header  
  
 If an end-user modifies a record between the time that another end-user or another process reads the record and modifies it, then the second user must refresh the value of the record variable before editing the record. Otherwise, the end-user receives the following run-time error:  
  
 **Another user has modified the record for this \<Table Name> after you retrieved it from the database.**  
  
 **Enter your changes again in the updated window, or start the interrupted activity again.**  
  
 In earlier versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], certain situations allowed code that an end-user runs to modify a record after a newer version of the record was written and committed to the database. This would overwrite the newer changes. However, in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], we have restricted the [MODIFY Method \(RecordRef\)](devenv-MODIFY-Method-RecordRef.md), **RENAME** Method \(RecordRef\), and [DELETE Method \(RecordRef\)](devenv-DELETE-Method-RecordRef.md) so that the end-user receives the following run-time error in these certain situations:  
  
 **Unable to change an earlier version of the \<Table Name> record. The record should be read from the database again. This is a programming error.**  
  
 You must design your application so that you use the most up-to-date version of the record for modifications to the database. You use the [GET Method \(RecordRef\)](devenv-GET-Method-RecordRef.md) to refresh the record with the latest version.  
  
## Example  
 This example shows how to change the value of the primary key of a Record variable, and how to change the value of the primary key of a RecordRef variable. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
|NewNo1|Code|Not applicable|  
|NewNo2|Code|Not applicable|  
|result|Boolean|Not applicable|  
|CustomerRecRef|RecordRef|Not applicable|  
  
```  
CustomerRec.GET('0112121');  
NewNo1 := ‘9999999’;  
NewNo2 := ‘8888888’;  
MESSAGE('Customer name: %1; Customer number: %2',CustomerRec.Name, CustomerRec."No.");  
result := CustomerRec.RENAME(NewNo1);  
IF result THEN  
  MESSAGE('After rename - Customer name: %1; Customer number: %2',CustomerRec.Name, CustomerRec."No.")  
ELSE  
  MESSAGE('No rename.');  
CustRecRef.GETTABLE(CustomerRec);  
result := CustRecRef.RENAME(NewNo2);  
IF result THEN BEGIN  
  CustomerRec.GET(NewNo2);  
  MESSAGE('After rename 2 - Customer name: %1; Customer number: %2',CustomerRec.Name, CustomerRec."No.")  
END ELSE  
  MESSAGE('No rename.');  
```  
  
 If a record with No. 0112121 is found, and if the renames are successful, then the following messages are displayed:  
  
 **Customer name: Spotsmeyer’s Furnishings; Customer number: 0112121**  
  
 **After rename - Customer name: Spotsmeyer’s Furnishings; Customer number: 9999999**  
  
 **After rename 2 - Customer name: Spotsmeyer’s Furnishings; Customer number: 8888888**  
  
## See Also  
 [RENAME Method \(Record\)](devenv-RENAME-Method-Record.md)