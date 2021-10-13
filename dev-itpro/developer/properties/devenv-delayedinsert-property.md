---
title: "DelayedInsert Property"
description: "Sets a value that specifies whether a user must leave a record before it is inserted into the database."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
  
## See Also  

[Properties](devenv-properties.md)