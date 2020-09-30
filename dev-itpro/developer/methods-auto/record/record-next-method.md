---
title: "Record.Next Method"
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
# Record.Next Method
Steps through a specified number of records and retrieves a record.


## Syntax
```
[Steps := ]  Record.Next([Steps: Integer])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Steps*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the direction of the search and how many records to step over. This parameter follows the following rules:
-   \> 0  Search Steps records forward in the table.
-   \< 0  Search Steps records backward in the table.
-   = 0  Stay on the same record in the table.
If you do not specify this parameter, then the next record is found.
          


## Return Value
*Steps*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)  