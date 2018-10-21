---
title: "WritePermission Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
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
# WritePermission Method
Determines whether a user can write to a table. This function can test for both full write permission and partial write permission that has been granted with a security filter. A write permission consists of Insert, Delete, and Modify permissions.

## Syntax
```
Ok :=   Table.WritePermission()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method uses the filter that is currently applied to the *Record* to determine whether you have write permission. If no filter is applied, the method tests for full write permission. If a filter has been set, the method only tests for write permission within the range of the filter.  
  
 To determine whether the user has a partial read permission, because a security filter has been applied, view the **Permissions** page. <!--Links For more information, see [How to: Set Security Filters](How-to-Set-Security-Filters.md).-->  
  
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
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)