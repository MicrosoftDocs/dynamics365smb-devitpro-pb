---
title: "WRITEPERMISSION Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 89baebc9-7d28-42b9-b8ad-cb3ca760fad2
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# WRITEPERMISSION Method (Record)
Determines whether a user can write to a table. This method can test for both full write permission and partial write permission that has been granted with a security filter. A write permission consists of Insert, Delete, and Modify permissions.  
  
## Syntax  
  
```  
  
Ok := Record.WRITEPERMISSION  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 A record in the table from which you want to determine if you have write permission.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 Specifies whether you have permission to write to the table using any of the following record methods:  
  
-   [INSERT Method \(Record\)](devenv-INSERT-Method-Record.md)  
  
-   [DELETE Method \(Record\)](devenv-DELETE-Method-Record.md)  
  
-   [MODIFY Method \(Record\)](devenv-MODIFY-Method-Record.md)  
  
-   [RENAME Method \(Record\)](devenv-RENAME-Method-Record.md)  
  
-   [DELETEALL Method \(Record\)](devenv-DELETEALL-Method-Record.md)  
  
-   [MODIFYALL Method \(Record\)](devenv-MODIFYALL-Method-Record.md)  
  
 **true** if you have direct or indirect permission to insert, modify, and delete all or some records in the table; **false** if you cannot write to the table. For example, if a permssion set grants indirect *Insert* and *Modify* permission to a table, but not *Delete* permission, the function will return **false**. If you change the permission set to grant *Insert* permission also, the function will return **true**.   
  
## Remarks  
 This method uses the filter that is currently applied to the *Record* to determine whether you have write permission. If no filter is applied, the method tests for full write permission. If a filter has been set, the method only tests for write permission within the range of the filter.  
  
 To determine whether the user has a partial read permission, because a security filter has been applied, view the **Permissions** page. <!--Links For more information, see [How to: Set Security Filters](How-to--Set-Security-Filters.md).-->  
  
 If you do not have permission to write to a table and you attempt to write, a run-time error occurs. This method allows you to determine in advance if you have write permission. When the permissions are checked, the combination of permissions in the license file and the user's permissions in the Permission table is considered.  
  
## Example  
 The following example uses a record from the Vendor table to check whether the user is granted write permission to the Vendor table. The return value from the WRITEPERMISSION method is stored in the varHasWrite variable and displayed in a message box. The value, **Yes** is displayed because the user can write to the Vendor table. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Vendor|  
|varHasWrite|Boolean|Not applicable|  
  
```  
  
MyRecord.GET('10000');  
varHasWrite := MyRecord.WRITEPERMISSION;  
MESSAGE('Table has Write permission? %1', varHasWrite);  
```  
  
## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)