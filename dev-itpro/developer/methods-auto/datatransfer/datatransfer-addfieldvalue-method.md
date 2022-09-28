---
title: "DataTransfer.AddFieldValue(Integer, Integer) Method"
description: "Specifies a source and destination field, where the values from the source field are to be copied to the destination field."
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
# DataTransfer.AddFieldValue(Integer, Integer) Method
> **Version**: _Available or changed with runtime version 10.0._

Specifies a source and destination field, where the values from the source field are to be copied to the destination field. The data types of the fields must match, except CODE to TEXT which is allowed.


## Syntax
```AL
 DataTransfer.AddFieldValue(SourceField: Integer, DestinationField: Integer)
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

Use this method when copying data in rows or fields of table to rows or fields of another table. For more information, see [Transferring Data Bewteen Tables](../../../developer/devenv-data-transfer.md).

## Example

[!INCLUDE[data-transfer-example](../../../developer/includes/data-transfer-example.md)]

## See Also
[DataTransfer Data Type](datatransfer-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)