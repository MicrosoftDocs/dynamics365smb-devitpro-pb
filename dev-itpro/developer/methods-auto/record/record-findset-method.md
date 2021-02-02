---
title: "Record.FindSet Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Record.FindSet Method
> **Version**: _Available from runtime version 1.0._

Finds a set of records in a table based on the current key and filter.


## Syntax
```
[Ok := ]  Record.FindSet([ForUpdate: Boolean] [, UpdateKey: Boolean])
```
## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.

*ForUpdate*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Set this parameter to true if you want to modify any records in the set; otherwise, set the parameter to false.If you set this parameter to true, then the LOCKTable method (Record) is immediately run on the table before the records are read. If you set this parameter to false, then you can still modify the records in the set, but these updates will not be performed optimally. The default value is false.
          
*UpdateKey*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Set this parameter to true if you want to modify any field value within the current key. This parameter only applies if the ForUpdate parameter is true. If you set this parameter to false, then you can still modify the records in the set, but these updates will not be performed optimally. The default value is false.
          


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)