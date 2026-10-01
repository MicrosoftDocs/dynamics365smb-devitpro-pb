---
title: "Record.IsDirty() Method"
description: "Gets a boolean value that indicates whether the current in-memory record instance has different values than when it was loaded from the database."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.IsDirty() Method
> **Version**: _Available or changed with runtime version 18.0._

Gets a boolean value that indicates whether the current in-memory record instance has different values than when it was loaded from the database.


## Syntax
```AL
Dirty :=   Record.IsDirty()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

## Return Value
*Dirty*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the current in-memory record instance has different values than when it was loaded from the database; otherwise, **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record data type](record-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)