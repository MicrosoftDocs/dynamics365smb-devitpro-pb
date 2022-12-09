---
title: "DataTransfer.CopyRows() Method"
description: "Copies the rows from the source table to the destination table with the fields selected with AddFields and the filters applied with AddSourceFilter, in one bulk operation in SQL."
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
# DataTransfer.CopyRows() Method
> **Version**: _Available or changed with runtime version 10.0._

Copies the rows from the source table to the destination table with the fields selected with AddFields and the filters applied with AddSourceFilter, in one bulk operation in SQL.


## Syntax
```AL
 DataTransfer.CopyRows()
```
## Parameters
*DataTransfer*  
&emsp;Type: [DataTransfer](datatransfer-data-type.md)  
An instance of the [DataTransfer](datatransfer-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

[!INCLUDE[data-transfer](../../../developer/includes/data-transfer.md)]

Use this method to copy data in rows of a table to rows in another table. For more information, see [Transferring Data Bewteen Tables](../../../developer/devenv-data-transfer.md).

## Example

[!INCLUDE[data-transfer-example](../../../developer/includes/data-transfer-example.md)]

## See Also
[DataTransfer Data Type](datatransfer-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)