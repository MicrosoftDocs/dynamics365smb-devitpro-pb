---
title: "DataTransfer.AddJoin(Integer, Integer) Method"
description: "Adds a field pair to be used to create a join condition which determines which rows to transfer, optional for same table transfers."
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
# DataTransfer.AddJoin(Integer, Integer) Method
> **Version**: _Available or changed with runtime version 10.0._

Adds a field pair to be used to create a join condition which determines which rows to transfer, optional for same table transfers.


## Syntax
```AL
 DataTransfer.AddJoin(SourceField: Integer, DestinationField: Integer)
```
## Parameters
*DataTransfer*  
&emsp;Type: [DataTransfer](datatransfer-data-type.md)  
An instance of the [DataTransfer](datatransfer-data-type.md) data type.  

*SourceField*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The source table field.  

*DestinationField*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The destination table field.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

[!INCLUDE[data-transfer](../../../developer/includes/data-transfer.md)]

Use this method to create a join condition between tables when copying fields from one table to the other. For more information, see [Transferring Data Bewteen Tables](../../../developer/devenv-data-transfer.md).

This method isn't needed when copying withing the same table.

## Example

[!INCLUDE[data-transfer-example-copy-fields](../../../developer/includes/data-transfer-example-copy-fields.md)]

## See Also
[DataTransfer Data Type](datatransfer-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
