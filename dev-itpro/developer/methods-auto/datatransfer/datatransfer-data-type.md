---
title: "DataTransfer Data Type"
description: "A structure building bulk transfer of data between tables."
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
# DataTransfer Data Type
> **Version**: _Available or changed with runtime version 10.0._

A structure building bulk transfer of data between tables.



The following methods are available on instances of the DataTransfer data type.

|Method name|Description|
|-----------|-----------|
|[AddConstantValue(Any, Integer)](datatransfer-addconstantvalue-method.md)|Specifies the given value is to be set in the given field in the destination table.|
|[AddFieldValue(Integer, Integer)](datatransfer-addfieldvalue-method.md)|Specifies a source and destination field, where the values from the source field are to be copied to the destination field. The data types of the fields must match, except CODE to TEXT which is allowed.|
|[AddJoin(Integer, Integer)](datatransfer-addjoin-method.md)|Adds a field pair to be used to create a join condition which determines which rows to transfer, optional for same table transfers.|
|[AddSourceFilter(Integer, Text [, Any,...])](datatransfer-addsourcefilter-method.md)|Adds a filter for the source table for the data transfer.|
|[CopyFields()](datatransfer-copyfields-method.md)|Copies the fields specified in AddFields with filters from AddSourceFilter, and the join conditions from AddJoins in one bulk operation in SQL.|
|[CopyRows()](datatransfer-copyrows-method.md)|Copies the rows from the source table to the destination table with the fields selected with AddFields and the filters applied with AddSourceFilter, in one bulk operation in SQL.|
|[SetTables(Integer, Integer)](datatransfer-settables-method.md)|Sets the source and destination tables for the data transfer.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## See Also

[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  