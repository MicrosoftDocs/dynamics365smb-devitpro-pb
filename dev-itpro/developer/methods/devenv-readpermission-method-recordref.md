---
title: "READPERMISSION Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 950d7dac-a821-4f9f-873c-952b87857400
caps.latest.revision: 14
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# READPERMISSION Method (RecordRef)
Determines if you can read from a table.  
  
## Syntax  
  
```  
  
Ok := RecordRef.READPERMISSION  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the record in the table for which you want to know if you have read permission.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 Specifies whether you have permission to read from the table.  
  
 **true** if you can read from some or all of the table; otherwise, **false**.  
  
## Remarks  
 This method can test for both full read permission and a partial read permission that has been granted with a security filter.  
  
 This method uses the filter that is currently applied to the *RecordRef* to determine whether you have read permission. If no filter is applied, the method tests for full read permission. If a filter has been set, the method only tests for read permission in the range of the filter.  
  
 To determine whether the user has a partial read permission because a security filter has been applied, view the **Permissions** page. <!--Links For more information, see [How to: Set Security Filters](How-to--Set-Security-Filters.md).-->  
  
 If you do not have permission to read from a table and you attempt to read, a run-time error occurs. This method lets you determine in advance if you have read permission. When the permissions are checked, the combination of the permissions in the license file and the user's permissions in the Permission table is considered.  
  
 This method works the same as the [READPERMISSION Method \(Record\)](devenv-READPERMISSION-Method-Record.md).  
  
## Example  
 The following example opens table 18 \(Customer\) and creates a RecordRef variable that is named MyRecordRef for the table. The READPERMISSION method determines whether the table has read permission and stores the return value in the varHasReadPerm variable. The Customer table has read permission, so the message displays **Yes**. You can initialize the varTableNo variable with any table number. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|varHasReadPerm|Boolean|  
|varTableNo|Integer|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Does the %1 table have read permission? %2|  
  
```  
  
varTableNo := 18;  
MyRecordRef.OPEN(varTableNo);  
varHasReadPerm := MyRecordRef.READPERMISSION;  
MESSAGE(Text000, MyRecordRef.NAME, varHasReadPerm);  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)