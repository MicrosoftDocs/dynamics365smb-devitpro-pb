---
title: "Delete Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Delete Method
Deletes a record in a table.


## Syntax
```
[Ok := ]  RecordRef.Delete([RunTrigger: Boolean])
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the code in the OnDelete trigger will be executed. If this parameter is true, the code will be executed. If this parameter is false, then the code in the OnDelete trigger is not executed. The default value is false. This parameter is optional.
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The current key and any filters on the record do not affect this operation. The record to delete is identified by the values in its primary key.  

 If an end-user modifies a record between the time that another end-user or another process reads the record and modifies it, then the second user must refresh the value of the record variable before editing the record. Otherwise, the end-user receives the following run-time error:  

 **Another user has modified the record for this \<Table Name> after you retrieved it from the database.**  

 **Enter your changes again in the updated window, or start the interrupted activity again.**  

 In earlier versions of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)], certain situations allowed code that an end-user runs to modify a record after a newer version of the record was written and committed to the database. This would overwrite the newer changes. However, in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], we have restricted the [MODIFY Method \(RecordRef\)](../../methods/devenv-modify-method-recordref.md), [RENAME Method \(RecordRef\)](../../methods/devenv-rename-method-recordref.md), and **DELETE** Method \(RECORDREF\) so that the end-user receives the following run-time error in these certain situations:  

 **Unable to change an earlier version of the \<Table Name> record. The record should be read from the database again. This is a programming error.**  

 You must design your application so that you use the most up-to-date version of the record for modifications to the database. You use the [GET Method \(RecordRef\)](../../methods/devenv-get-method-recordref.md) to refresh the record with the latest version.  

## Example  
 The following example deletes a record from the Customer table. The code starts by opening the **Customer** table \(18\) as a RecordRef variable that is named MyRecordRef. The [FIELD Method \(RecordRef\)](../../methods/devenv-field-method-recordref.md) creates a FieldRef that is named MyFieldRef for field 1, which is the primary key of the **Customer** table. The [VALUE Method \(FieldRef, TestPage Field\)](../../methods/devenv-value-method-fieldref-testpage-field.md) assigns the value 10000 to the field that the MyFieldRef variable refers to. The [FIND Method \(RecordRef\)](../../methods/devenv-find-method-recordref.md) searches the table for a record with field 1 = 10000. If the record is found, then it is deleted, the table is modified, and a message is displayed. This example requires that you create the following global variables and text constant.  

|Variable name|DataType|  
|-------------------|--------------|  
|varRecordToDelete|Code|  
|MyRecordRef|RecordRef|  
|MyFieldRef|FieldRef|  

|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|Customer %1 is deleted.|  

```  
varRecordToDelete := '10000';  
MyRecordRef.OPEN(18);  
MyFieldRef := MyRecordRef.FIELD(1);  
MyFieldRef.VALUE := varRecordToDelete;  
IF MyRecordRef.FIND('=') THEN BEGIN  
  IF MyRecordRef.DELETE THEN BEGIN  
    MyRecordRef.MODIFY;  
    MESSAGE(Text000, MyFieldRef.VALUE);  
  END;  
END;  

```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)