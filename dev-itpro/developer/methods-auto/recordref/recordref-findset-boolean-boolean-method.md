---
title: "RecordRef.FindSet(Boolean, Boolean) Method"
description: "Finds a set of records in a table based on the current key and filter."
ms.author: solsen
ms.custom: na
ms.date: 06/30/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.FindSet(Boolean, Boolean) Method
> **Version**: _Available or changed with runtime version 1.0 until version 11.0 where it was deprecated for the following reason: "This method has been deprecated because the parameter 'UpdateKey' is not used by the runtime. Use the overload without the 'UpdateKey' parameter instead."_

Finds a set of records in a table based on the current key and filter. FindSet can only retrieve records in ascending order.


## Syntax
```AL
[Ok := ]  RecordRef.FindSet(ForUpdate: Boolean, UpdateKey: Boolean)
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*ForUpdate*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Set this parameter to false if you do not want to modify any records in the set. Set this parameter to true if you want to modify records in the set. If you set this parameter to true, the LockTable method (RecordRef) is immediately performed on the table before the records are read.  

*UpdateKey*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The `UpdateKey` parameter has been deprecated and will be removed in the future.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)