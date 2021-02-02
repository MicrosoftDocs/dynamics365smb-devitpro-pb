---
title: "RecordRef.SystemModifiedByNo Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.SystemModifiedByNo Method
> **Version**: _Available from runtime version 6.0._

Gets the field number that is used by the SystemModifiedBy field. The SystemModifiedBy field is a system field that the platform adds to all table objects.


## Syntax
```
SystemModifiedByFieldNo :=   RecordRef.SystemModifiedByNo()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

## Return Value
*SystemModifiedByFieldNo*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The field number of the SystemModifiedBy field.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)