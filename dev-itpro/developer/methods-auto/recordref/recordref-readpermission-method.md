---
title: "ReadPermission Method"
ms.author: solsen
ms.custom: na
ms.date: 09/24/2019
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
# ReadPermission Method
Determines if you can read from a table.


## Syntax
```
Ok :=   RecordRef.ReadPermission()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if you can read from some or all of the table; otherwise, **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method can test for both full read permission and a partial read permission that has been granted with a security filter.  
  
 This method uses the filter that is currently applied to the *RecordRef* to determine whether you have read permission. If no filter is applied, the method tests for full read permission. If a filter has been set, the method only tests for read permission in the range of the filter.  
  
 To determine whether the user has a partial read permission because a security filter has been applied, view the **Permissions** page. <!-- Links For more information, see [How to: Set Security Filters](How-to-Set-Security-Filters.md). -->  
  
 If you do not have permission to read from a table and you attempt to read, a run-time error occurs. This method lets you determine in advance if you have read permission. When the permissions are checked, the combination of the permissions in the license file and the user's permissions in the Permission table is considered.  
  
 This method works the same as the [READPERMISSION Method \(Record\)](../../methods/devenv-readpermission-method-record.md).  
  
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
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)