---
title: "MODIFY Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 449bcf4c-5ae0-498d-b247-ea5704272329
caps.latest.revision: 17
manager: edupont
---
# MODIFY Function (RecordRef)
Modifies a record in a table.  
  
## Syntax  
  
```  
  
[Ok :=] RecordRef.MODIFY([RunTrigger])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that identifies the record that you want to change.  
  
> [!WARNING]  
>  The record cannot be from table 2000000001, the **Object** table, or table 2000000006, the **Company** table.  
  
 *RunTrigger*  
 Type: Boolean  
  
 Specifies whether to run the C/AL code in the [OnModify Trigger](OnModify-Trigger.md).  
  
 If this parameter is **true**, then the code in the **OnModify** trigger is executed. If this parameter is **false** \(default\), then the code is not executed.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record was modified; otherwise, **false**.  
  
 If you omit this optional return value and if the record cannot be modified, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## Remarks  
 Select the record that you want to modify by using the primary key fields. The record's current key and filters do not affect the operation.  
  
 If an end-user modifies a record between the time that another end-user or another process reads the record and modifies it, then the second user must refresh the value of the record variable before editing the record. Otherwise, the end-user receives the following run-time error:  
  
 **Another user has modified the record for this \<Table Name> after you retrieved it from the database.**  
  
 **Enter your changes again in the updated window, or start the interrupted activity again.**  
  
 In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], certain situations allowed code that an end-user runs to modify a record after a newer version of the record was written and committed to the database. This would overwrite the newer changes. However, in [!INCLUDE[navnowlong](includes/navnowlong_md.md)], we have restricted the **MODIFY** Function \(RECORDREF\), [RENAME Function \(RecordRef\)](RENAME-Function--RecordRef-.md), and [DELETE Function \(RecordRef\)](DELETE-Function--RecordRef-.md) so that the end-user receives the following run-time error in these certain situations:  
  
 **Unable to change an earlier version of the \<Table Name> record. The record should be read from the database again. This is a programming error.**  
  
 You must design your application so that you use the most up-to-date version of the record for modifications to the database. You use the [GET Function \(RecordRef\)](GET-Function--RecordRef-.md) to refresh the record with the latest version.  
  
 This function works the same as the [MODIFY Function \(Record\)](MODIFY-Function--Record-.md).  
  
## See Also  
 [MODIFYALL Function \(Record\)](MODIFYALL-Function--Record-.md)   
 [RecordRef Data Type](RecordRef-Data-Type.md)