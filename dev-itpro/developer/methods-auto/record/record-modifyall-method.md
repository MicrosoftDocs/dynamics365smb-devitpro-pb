---
title: "Record.ModifyAll Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# Record.ModifyAll Method
Modifies a field in all records within a range that you specify.


## Syntax
```
 Record.ModifyAll(Field: Any, NewValue: Any [, RunTrigger: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to modify.
          
*NewValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value that you want to assign to Field in all records. The data type of NewValue must match the data type of Field.
          
*RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If this parameter is true, the code in the OnModify Trigger is executed. If this parameter is false (default), the code in the OnModify trigger is not executed.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)  