---
title: "DelayedInsert property"
description: "Sets a value that specifies whether a user must leave a record before it is inserted into the database."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DelayedInsert Property
> **Version**: _Available or changed with runtime version 1.0._

Sets a value that specifies whether a user must leave a record before it is inserted into the database. By default, new records are inserted when the user leaves the control that shows the primary key in the table.

## Applies to
-   Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

**True** if the record is inserted when the user leaves the record; otherwise, **false** if the record is inserted when the user leaves the control that shows the primary key. The default value is **false**.  

## Syntax

```AL
DelayedInsert = false;
```
  
## Related information  

[Properties](devenv-properties.md)