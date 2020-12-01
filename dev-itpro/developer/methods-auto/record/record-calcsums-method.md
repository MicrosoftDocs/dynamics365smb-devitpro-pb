---
title: "Record.CalcSums Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.CalcSums Method
> **Version**: _Available from runtime version 1.0._

Calculates the total of a column in a table. You specify which fields to calculate by using parameters.


## Syntax
```
[Ok := ]  Record.CalcSums(Field1: Any [, Field2: Any,...])
```
## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.

*Field1*  
&emsp;Type: [Any](../any/any-data-type.md)  
  
*Field2*  
&emsp;Type: [Any](../any/any-data-type.md)  
  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[CALCSUM Method (FieldRef)](../fieldref/fieldref-calcsum-method.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)