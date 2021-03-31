---
title: "Record.LockTable Method"
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
# Record.LockTable Method
> **Version**: _Available or changed with runtime version 1.0._

Locks a table to protect it from write transactions that conflict with each other.


## Syntax
```
 Record.LockTable([Wait: Boolean] [, VersionCheck: Boolean])
```
## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.

*Wait*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies what to do if the table is already locked. If this parameter is true and if another application has already locked the table, the system will wait until the table is unlocked. If this parameter is false and if another application has already locked the table, a run-time error occurs.  
*VersionCheck*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If this parameter is true, the version of the Record will be checked. If this parameter is false, blank, or not used, the version will not be checked.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)