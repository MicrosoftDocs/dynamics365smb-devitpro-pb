---
title: "DataTransfer.SetTables(Integer, Integer) Method"
description: "Sets the source and destination tables for the data transfer."
ms.author: solsen
ms.custom: na
ms.date: 08/11/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataTransfer.SetTables(Integer, Integer) Method
> **Version**: _Available or changed with runtime version 10.0._

Sets the source and destination tables for the data transfer.


## Syntax
```AL
 DataTransfer.SetTables(SourceTable: Integer, DestinationTable: Integer)
```
## Parameters
*DataTransfer*  
&emsp;Type: [DataTransfer](datatransfer-data-type.md)  
An instance of the [DataTransfer](datatransfer-data-type.md) data type.  

*SourceTable*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The source table for the transfer.  

*DestinationTable*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The destination table for the transfer.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

[!INCLUDE[data-transfer](../../../developer/includes/data-transfer.md)]

Use this method when copying data in rows or fields of table to rows or fields of another table. For more information, see [Transferring Data Bewteen Tables](../../../developer/devenv-data-transfer.md).

## Example

[!INCLUDE[data-transfer-example](../../../developer/includes/data-transfer-example.md)]

## See Also
[DataTransfer Data Type](datatransfer-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)