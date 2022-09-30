---
title: "DataTransfer.AddConstantValue(Any, Integer) Method"
description: "Specifies the given value is to be set in the given field in the destination table."
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
# DataTransfer.AddConstantValue(Any, Integer) Method
> **Version**: _Available or changed with runtime version 10.0._

Specifies the given value is to be set in the given field in the destination table.


## Syntax
```AL
 DataTransfer.AddConstantValue(Value: Any, DestinationField: Integer)
```
## Parameters
*DataTransfer*  
&emsp;Type: [DataTransfer](datatransfer-data-type.md)  
An instance of the [DataTransfer](datatransfer-data-type.md) data type.  

*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value to set in the destination field.  

*DestinationField*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The destination table field.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

[!INCLUDE[data-transfer](../../../developer/includes/data-transfer.md)]

Use this method to set a constant value for a field when copying data in rows or fields of table to another table. For more information, see [Transferring Data Bewteen Tables](../../../developer/devenv-data-transfer.md).

## Example

[!INCLUDE[data-transfer-example](../../../developer/includes/data-transfer-example.md)]

## See Also
[DataTransfer Data Type](datatransfer-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)