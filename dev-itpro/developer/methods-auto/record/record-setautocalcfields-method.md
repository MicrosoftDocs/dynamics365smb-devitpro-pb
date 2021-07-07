---
title: "Record.SetAutoCalcFields([Any,...]) Method"
description: "Sets the FlowFields that you specify to be automatically calculated when the record is retrieved from the database."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Record.SetAutoCalcFields([Any,...]) Method
> **Version**: _Available or changed with runtime version 1.0._

Sets the FlowFields that you specify to be automatically calculated when the record is retrieved from the database.


## Syntax
```AL
[Ok := ]  Record.SetAutoCalcFields([Field1: Any,...])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] Field1*  
&emsp;Type: [Any](../any/any-data-type.md)  
  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

See [AL Database Methods and Performance on SQL Server - SetAutoCalcFields](../../../administration/optimize-sql-al-database-methods-and-performance-on-server.md#setautocalcfields).

## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)