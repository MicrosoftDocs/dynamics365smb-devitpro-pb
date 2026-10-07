---
title: "RecordRef.IsDirty() Method"
description: "Gets a boolean value that indicates whether the current in-memory record instance has different values than when it was loaded from the database."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.IsDirty() Method
> **Version**: _Available or changed with runtime version 5.0._

Gets a boolean value that indicates whether the current in-memory record instance has different values than when it was loaded from the database.


## Syntax
```AL
Dirty :=   RecordRef.IsDirty()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*Dirty*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the current in-memory record instance has different values than when it was loaded from the database; otherwise, **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[RecordRef Data Type](recordref-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)