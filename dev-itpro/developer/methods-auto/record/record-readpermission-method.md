---
title: "Record.ReadPermission Method"
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
# Record.ReadPermission Method
> **Version**: _Available from runtime version 1.0._

Determines whether a user is granted read permission to the table that contains a record. This method can test for both full read permission and partial read permission that has been granted with a security filter.


## Syntax
```
Ok :=   Record.ReadPermission()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.

## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)