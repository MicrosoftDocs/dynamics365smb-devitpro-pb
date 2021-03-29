---
title: "RecordRef.Rename Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# RecordRef.Rename Method
> **Version**: _Available or changed with runtime version 1.0._

Changes the value of a primary key in a table.


## Syntax
```
[Ok := ]  RecordRef.Rename(Value1: Any [, Value2: Any,...])
```
## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

*Value1*  
&emsp;Type: [Any](../any/any-data-type.md)  
The new values for the primary key.  
*Value2*  
&emsp;Type: [Any](../any/any-data-type.md)  
The new values for the primary key.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
  
 In earlier versions of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)], certain situations allowed code that an end-user runs to modify a record after a newer version of the record was written and committed to the database. This would overwrite the newer changes. However, in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], we have restricted the [Modify Method \(RecordRef\)](recordref-modify-method.md), **Rename** Method \(RecordRef\), and [Delete Method \(RecordRef\)](recordref-delete-method.md) so that the end-user receives the following run-time error in these certain situations:  
  
 **Unable to change an earlier version of the \<Table Name> record. The record should be read from the database again. This is a programming error.**  
  
 You must design your application so that you use the most up-to-date version of the record for modifications to the database. You use the [Get Method \(RecordRef\)](recordref-get-method.md) to refresh the record with the latest version.  
  
## Example  
 This example shows how to change the value of the primary key of a Record variable, and how to change the value of the primary key of a RecordRef variable. 
 
```al
var
    CustomerRecRef: RecordRef;
    NewNo1: Code;
    NewNo2: Code;
    result: Boolean;
    CustomerRec: Record Customer;
begin 
    CustomerRec.Get('0112121');  
    NewNo1 := ‘9999999’;  
    NewNo2 := ‘8888888’;  
    Message('Customer name: %1; Customer number: %2',CustomerRec.Name, CustomerRec."No.");  
    result := CustomerRec.Rename(NewNo1);  
    if result then  
      Message('After rename - Customer name: %1; Customer number: %2',CustomerRec.Name, CustomerRec."No.")  
    else  
      Message('No rename.');  
    CustRecRef.GetTable(CustomerRec);  
    result := CustRecRef.Rename(NewNo2);  
    if result then begin  
      CustomerRec.Get(NewNo2);  
      Message('After rename 2 - Customer name: %1; Customer number: %2',CustomerRec.Name, CustomerRec."No.")  
    end else  
      Message('No rename.');  
end;
```  
  
 If a record with No. 0112121 is found, and if the renames are successful, then the following messages are displayed:  
  
 **Customer name: Spotsmeyer’s Furnishings; Customer number: 0112121**  
  
 **After rename - Customer name: Spotsmeyer’s Furnishings; Customer number: 9999999**  
  
 **After rename 2 - Customer name: Spotsmeyer’s Furnishings; Customer number: 8888888**  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)