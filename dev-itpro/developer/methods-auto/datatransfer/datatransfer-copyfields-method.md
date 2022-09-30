---
title: "DataTransfer.CopyFields() Method"
description: "Copies the fields specified in AddFields with filters from AddSourceFilter, and the join conditions from AddJoins in one bulk operation in SQL."
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
# DataTransfer.CopyFields() Method
> **Version**: _Available or changed with runtime version 10.0._

Copies the fields specified in AddFields with filters from AddSourceFilter, and the join conditions from AddJoins in one bulk operation in SQL.


## Syntax
```AL
 DataTransfer.CopyFields()
```
## Parameters
*DataTransfer*  
&emsp;Type: [DataTransfer](datatransfer-data-type.md)  
An instance of the [DataTransfer](datatransfer-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks

[!INCLUDE[data-transfer](../../../developer/includes/data-transfer.md)]

Use this method to copy data in fields from one table to another table. For more information, see [Transferring Data Bewteen Tables](../../../developer/devenv-data-transfer.md).

## Example

[!INCLUDE[data-transfer-example-copy-fields](../../../developer/includes/data-transfer-example-copy-fields.md)]
## See Also
[DataTransfer Data Type](datatransfer-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)