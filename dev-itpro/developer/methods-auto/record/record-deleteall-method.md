---
title: "Record.DeleteAll([Boolean]) Method"
description: "Deletes all records in a table that fall within a specified range."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.DeleteAll([Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Deletes all records in a table that fall within a specified range.


## Syntax
```AL
 Record.DeleteAll([RunTrigger: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether to run the AL code in the OnDelete Trigger. If this parameter is true, then the code in the OnDelete trigger will be executed. If this parameter is false, then the code in the OnDelete trigger will not be executed. The default value is false.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

> [!IMPORTANT]  
> By design, the global variables of the record instance being deleted will be initialized to their default value during the **DeleteAll** method execution, independently of the value that was previously set.

> [!IMPORTANT]  
> Setting `RunTrigger` to **false** only affects the OnDelete trigger.  The `OnBeforeDelete` and `OnAfterDelete` triggers from Table Extensions will still execute regardless.
 
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)  
