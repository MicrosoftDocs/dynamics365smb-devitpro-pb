---
title: "DelayedInsert Property"
ms.date: 10/01/2020
ms.suite: na
ms.topic: article
author: SusanneWindfeldPedersen
---

# DelayedInsert Property

Sets a value that specifies whether a user must leave a record before it is inserted into the database. By default, new records are inserted when the user leaves the control that shows the primary key in the table.  
  
## Applies to  
  
- Pages  
  
## Property Value  

**True** if the record is inserted when the user leaves the record; otherwise, **false** if the record is inserted when the user leaves the control that shows the primary key. The default value is **false**.  

## Syntax

```AL
DelayedInsert = false;
```
  
## See Also  

[Properties](devenv-properties.md)