---
title: "READPERMISSION Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 53f7980f-1d26-44cf-9262-cb27006b5983
caps.latest.revision: 14
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# READPERMISSION Method (Record)
Determines whether a user is granted read permission to the table that contains a record. This method can test for both full read permission and partial read permission that has been granted with a security filter.  
  
## Syntax  
  
```  
  
Ok := Record.READPERMISSION  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record in the table for which you want to check for read access.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 Specifies whether the user is granted read access to the table.  
  
 **true** if you can read from some or the entire table; otherwise, **false**.  
  
## Remarks  
 This method uses the filter that is currently applied to the *Record* to determine whether you have read permission. If no filter is applied, the method tests for full read permission. If a filter has been set, the method only tests for read permission within the range of the filter.  
  
 To determine whether the user has a partial read permission because a security filter has been applied, view the **Permissions** page. <!--Links For more information, see [How to: Set Security Filters](How-to--Set-Security-Filters.md).-->  
  
 If you do not have permission to read from a table and you attempt to read, a run-time error occurs. This method allows you to determine in advance if you have read permission. When the permissions are checked, the combination of permissions in the license file and the user's permissions in the **Permission** table is considered.  
  
## Example  
 The following code example retrieves record number 10000 from the Vendor table and stores the record in the MyRecord variable. The **READPERMISSION** method determines whether the user is granted read permission to the Vendor table. The value **Yes** is displayed in the message box because the user can read from the vendor table. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Vendor|  
|varHasRead|Boolean|Not applicable|  
  
```  
MyRecord.GET('10000');  
varHasRead := MyRecord.READPERMISSION;  
MESSAGE(Is user the granted Read permission? %1', varHasRead);  
```  
  
## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)