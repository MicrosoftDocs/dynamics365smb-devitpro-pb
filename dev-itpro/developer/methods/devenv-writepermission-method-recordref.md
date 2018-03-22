---
title: "WRITEPERMISSION Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d61444c9-a333-45e8-af95-e4bcf2729f0b
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# WRITEPERMISSION Method (RecordRef)
Determines if you can write to a table.  
  
## Syntax  
  
```  
  
Ok := RecordRef.WRITEPERMISSION  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to a record in the table for which you want to know if you have write permission.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 Specifies if you have permission to write to the table using any of the following RecordRef methods:  
  
-   [INSERT Method \(RecordRef\)](devenv-INSERT-Method-RecordRef.md)  
  
-   [DELETE Method \(RecordRef\)](devenv-DELETE-Method-RecordRef.md)  
  
-   [MODIFY Method \(RecordRef\)](devenv-MODIFY-Method-RecordRef.md)  
  
-   [DELETEALL Method \(RecordRef\)](devenv-DELETEALL-Method-RecordRef.md)  
  
 **true** if you have direct or indirect permission to insert, modify, and delete all or some records in the table; **false** if you cannot write to the table. For example, if a permssion set grants indirect *Insert* and *Modify* permission to a table, but not *Delete* permission, the function will return **false**. If you change the permission set to grant *Insert* permission also, the function will return **true**.  
  
## Remarks  
 This method can test for both full write permission and a partial write permission that has been granted with a security filter. A write permission consists of Insert, Delete, and Modify permissions.  
  
 This method uses the filter that is currently applied to the *RecordRef* to determine whether you have write permission. If no filter is applied, the method tests for full write permission. If a filter has been set, the method only tests for write permission in the range of the filter.  
  
 To determine whether the user has partial write permission, because a security filter has been applied, view the **Permissions** page. <!--Links For more information, see [How to: Set Security Filters](How-to--Set-Security-Filters.md).-->  
  
 If you do not have permission to write to a table and you attempt to write, a run-time error occurs. This method lets you determine in advance if you have write permission. When the permissions are checked, the combination of permissions in the license file and the user's permissions in the Permission table is considered.  
  
 This method works the same as the [WRITEPERMISSION Method \(Record\)](devenv-WRITEPERMISSION-Method-Record.md).  
  
## Example  
 The following example opens table 18 \(Customer\) and creates a RecordRef variable that is named MyRecordRef for the table. The WRITEPERMISSION method determines whether the table has write permission and stores the return value in the varHasWritePerm variable. The Customer table has write permission, so the message displays **Yes**. You can initialize the varTableNo variable with any table number. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|varHasWritePerm|Boolean|  
|varTableNo|Integer|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Does the %1 table have write permission? %2|  
  
```  
  
varTableNo := 18;  
MyRecordRef.OPEN(varTableNo);  
varHasWritePerm := MyRecordRef.WRITEPERMISSION;  
MESSAGE(Text000, MyRecordRef.NAME, varHasWritePerm);  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)